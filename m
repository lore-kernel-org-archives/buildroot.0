Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7FFC433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 21:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6E8E410B8;
	Tue,  4 Jan 2022 21:00:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id blVp-pPh6r_5; Tue,  4 Jan 2022 21:00:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F00D4410AD;
	Tue,  4 Jan 2022 21:00:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DC64E1BF44A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 21:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CACBD60C08
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 21:00:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ddiifU72DPso for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 21:00:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0172F60B8A
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 21:00:52 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id w20so69624298wra.9
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 13:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lXK7DLpB5vLCgol8kC7JEC4Dv52PKfPWV0BNH9Lhtfw=;
 b=bkgOd8zCxYjtUtMxTa+TY95BqBBcisHCgCRp6PAZj552n05bVa08/BS3E++ROIYCmr
 8i6jqvGWcQIkQkMlXPSHaSmL2R23jq96Ln5LXdZCk5oihr/OMxjlymKL8C5Tq50OLzSS
 nRhDbVCruvpGnV8MesLfrzrahfYOMC6KikAIr8TaYDXAi8Up1zDUefNPoxjjmtB+3JC5
 3sLB2l7nEucyTzZ7kM4AEElQCZbCNGoEKobiFKbU82RrjLfbRX+j932JIDQziKUEmWlb
 1sLaTEagVApWv/A9BXd53b4u1NXv00M89WGnFX6M5e0CQSTqqOSOLpSXZgv0O68HbP9H
 hYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lXK7DLpB5vLCgol8kC7JEC4Dv52PKfPWV0BNH9Lhtfw=;
 b=vP53PzjrPxLNYAC23QSzSkiZ18ZKtNoKlL+HjA06atHjFm1GpvhwkY6zX0ooP4OLYr
 VkB1Aupd7B2P0ckWXcD341dHAwPFMqQgZtQMvVMJ3cBQyKVkNK9JVx7pXh6asjOYfTGd
 wwenv8NpbVoIp/pcvboT2DINR515b8YRyM/uZ88AWGzQOtc1Dc/pmkZnABZauaxT84/I
 fNWgJPstp+fdlBQHIBJdXNGDS8gaL468OMyXMkxQT0o9D67oepD2Dz4uisbwf2SSRN2v
 cVIu2eig3H3G0c4JaDvyyP7qHSb89dgk7i5qOqJbcI+4DKt/dQsK+dF+zhALNOE2sjvU
 aMZw==
X-Gm-Message-State: AOAM531I0dRzAasOUptDUpSMA5ApW92Id8NumQ4ODCV5qB7zB7ApVljI
 cpfZ9tS6QBRKW5SnPb5Y7qphqaxs5TE=
X-Google-Smtp-Source: ABdhPJz706v/BPkoarLZraw3XiuKU+RD2tgfAWNPK6uZOrj37UvzcMY5Kt5CfxRlY6yzq5JOagy2pw==
X-Received: by 2002:a05:6000:148:: with SMTP id
 r8mr44162163wrx.333.1641330051100; 
 Tue, 04 Jan 2022 13:00:51 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id h3sm39512736wrt.94.2022.01.04.13.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 13:00:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 21:59:48 +0100
Message-Id: <20220104205948.3633747-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/openipmi: fix musl build with
 libexecinfo
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable execinfo to avoid the following musl build failure raised since
the addition of libexecinfo package in commit
eea8ba446c10701a273432552108d80fb2224ef4:

/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/10.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/openipmi-2.0.28/utils/.libs/libOpenIPMIutils.so: undefined reference to `backtrace'

Fixes:
 - http://autobuild.buildroot.org/results/dcc33c5cca97d538231647a94212450f043974b3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...igure.ac-add-without-execinfo-option.patch | 55 +++++++++++++++++++
 package/openipmi/openipmi.mk                  |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 package/openipmi/0002-configure.ac-add-without-execinfo-option.patch

diff --git a/package/openipmi/0002-configure.ac-add-without-execinfo-option.patch b/package/openipmi/0002-configure.ac-add-without-execinfo-option.patch
new file mode 100644
index 0000000000..e1838a06f4
--- /dev/null
+++ b/package/openipmi/0002-configure.ac-add-without-execinfo-option.patch
@@ -0,0 +1,55 @@
+From 388033e3d0129510c3884333bc428cefeb75e0b8 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 3 Jan 2022 23:27:21 +0100
+Subject: [PATCH] configure.ac: add --without-execinfo option
+
+Add an option to allow the user to disable execinfo to avoid the
+following build failure on musl with
+https://github.com/mikroskeem/libexecinfo:
+
+/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/10.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/openipmi-2.0.28/utils/.libs/libOpenIPMIutils.so: undefined reference to `backtrace'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/dcc33c5cca97d538231647a94212450f043974b3
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://sourceforge.net/p/openipmi/patches/36]
+---
+ configure.ac | 14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 607864b9..f369166f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -77,6 +77,16 @@ AC_ARG_WITH(poptlibs,
+     POPTLIBS="$withval"
+ )
+ 
++tryexecinfo=yes
++AC_ARG_WITH(execinfo,
++[  --with-execinfo[[=yes|no]]      Look for execinfo.],
++    if test "x$withval" = "xyes"; then
++      tryexecinfo=yes
++    elif test "x$withval" = "xno"; then
++      tryexecinfo=no
++    fi,
++)
++
+ # If UCD SNMP requires OpenSSL, this tells where to find the crypto lib
+ tryopenssl=yes
+ AC_ARG_WITH(openssl,
+@@ -275,7 +285,9 @@ AM_PROG_CC_C_O
+ AC_PROG_LIBTOOL
+ AC_STDC_HEADERS
+ 
+-AC_CHECK_HEADERS(execinfo.h)
++if test "x$tryexecinfo" != "xno"; then
++   AC_CHECK_HEADERS(execinfo.h)
++fi
+ AC_CHECK_HEADERS([netinet/ether.h])
+ AC_CHECK_HEADERS([sys/ethernet.h])
+ 
+-- 
+2.34.1
+
diff --git a/package/openipmi/openipmi.mk b/package/openipmi/openipmi.mk
index ad2f2d2f4f..b3a4d90d4b 100644
--- a/package/openipmi/openipmi.mk
+++ b/package/openipmi/openipmi.mk
@@ -15,6 +15,7 @@ OPENIPMI_INSTALL_STAGING = YES
 OPENIPMI_AUTORECONF = YES
 OPENIPMI_CONF_ENV = ac_cv_path_pkgprog="$(PKG_CONFIG_HOST_BINARY)"
 OPENIPMI_CONF_OPTS = \
+	--with-execinfo=no \
 	--with-glib=no \
 	--with-tcl=no \
 	--with-perl=no \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
