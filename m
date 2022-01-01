Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C893C433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 16:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA26981465;
	Sat,  1 Jan 2022 16:00:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cP_nxP4KLP4p; Sat,  1 Jan 2022 16:00:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F139881462;
	Sat,  1 Jan 2022 16:00:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 148AA1BF59B
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 16:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02EA381462
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 16:00:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ifnRTuSDClf7 for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 16:00:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B54281461
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 16:00:54 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 k66-20020a1ca145000000b00345fa984108so10348279wme.2
 for <buildroot@buildroot.org>; Sat, 01 Jan 2022 08:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E5TQFGRD73+THIcSZVEsTY51Eka90NMiqVOhD7lShhI=;
 b=mEIm6Uum0Fk1VMbxPRFLzLAYu5EEgJ+V0tvGBvySkex3Y1ut9oIlyozzPI6Iqi3K6G
 gNvG7FEGUX2nNOlf70tM/vSkZ/KT0Jk83muDtZz7+ZsLJfvAro8YFBi+svKCThMeEgcc
 O21tYNJ3Pu1kZxxsjp+3R65+Bz9bi0bvbPmAaJSATn2FtILAFjVQQec9y38srSK9e+Ej
 xh+ZgNmK5qr1v+wBGyyvHgOhpnEakOS7qlcXljB/i4UW6ZkYxT1cOWvy0u/hJ4TTwk9T
 XV/fkrWTErgd1Rwsjw8qOeM12lNZSWO7S1pV/GSTIXEXWy7gQQWD5T6LCBE1LEHAhFMe
 F/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E5TQFGRD73+THIcSZVEsTY51Eka90NMiqVOhD7lShhI=;
 b=21Gs2t0GcUoM7w0J/X7sNkuLPIlCJvPutyQEIR8F5XaXft0+cMSnfErEcHA0FzLW7+
 QI/oHfyG70i72Y4HEQZnqLP16WBbM4rKr66Tt1CYVl+hCtFlW/aKrYedEl/oNMuggdht
 ynrUIVYx2qerdtc6Hn/3TYT7pEiDpDOAezMPgjM9zs5Npe0vkuiP/iBWwFr0lgnv2hKz
 XINYUiqG9fateC7bgyy8Kv3y+h+b9DsZoqawEPG7PCFeuaPwgJSyf9d/P3DNmsS9yxP7
 +Pk1J0vmtsuK6ncnJXCVEvuFivTznexOcg0kTlNLlQxzJv5N1eOroR4Jy396P4JZtPAK
 EiKg==
X-Gm-Message-State: AOAM532t36sihH/GciGVmZYd6lM69b+R+2pTuAPhxjpc6okF6rDIHKp/
 8LXNwcuqzzmStvC8Pg2hkkwH+n8/IX0=
X-Google-Smtp-Source: ABdhPJy8+j89XgYTv0dBxLHrA+c5KFFr0O8BXm1XVJk8Dn3QDZfkqfS5idxQjwNAYmujwqDKihYu2Q==
X-Received: by 2002:a7b:c40f:: with SMTP id k15mr33315759wmi.74.1641052853242; 
 Sat, 01 Jan 2022 08:00:53 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id m35sm61633030wms.1.2022.01.01.08.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jan 2022 08:00:52 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Jan 2022 16:59:50 +0100
Message-Id: <20220101155950.1784485-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: disable execinfo
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable execinfo to avoid the following build failure if libexecinfo is
built before tvheadend since the addition of the package in commit
eea8ba446c10701a273432552108d80fb2224ef4:

/home/peko/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: /home/peko/autobuild/instance-0/output-1/build/tvheadend-b8710206eb073c72b142bce95846b77a0ffa34a6/build.linux/src/tvhlog.o: in function `tvhlog_backtrace_printf':
/home/peko/autobuild/instance-0/output-1/build/tvheadend-b8710206eb073c72b142bce95846b77a0ffa34a6/src/tvhlog.c:522: undefined reference to `backtrace'

Fixes:
 - http://autobuild.buildroot.org/results/ee9ad2c999b622097fe0f1522e7e32184722e548

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-configure-add-execinfo-option.patch  | 55 +++++++++++++++++++
 package/tvheadend/tvheadend.mk                |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 package/tvheadend/0002-configure-add-execinfo-option.patch

diff --git a/package/tvheadend/0002-configure-add-execinfo-option.patch b/package/tvheadend/0002-configure-add-execinfo-option.patch
new file mode 100644
index 0000000000..c55d127d58
--- /dev/null
+++ b/package/tvheadend/0002-configure-add-execinfo-option.patch
@@ -0,0 +1,55 @@
+From 04c01e631cb1bf47dd50b1ef92a086308e380eff Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 1 Jan 2022 16:53:29 +0100
+Subject: [PATCH] configure: add execinfo option
+
+Add execinfo option to allow the user to disable the feature even if
+execinfo.h is found on the system
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upsteam status: https://github.com/tvheadend/tvheadend/pull/1431]
+---
+ configure | 17 +++++++++++++++--
+ 1 file changed, 15 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 4dad024c4..c087502bf 100755
+--- a/configure
++++ b/configure
+@@ -75,6 +75,7 @@ OPTIONS=(
+   "ddci:yes"
+   "cclang_threadsan:no"
+   "gperftools:no"
++  "execinfo:auto"
+ )
+ 
+ #
+@@ -150,11 +151,23 @@ if [ ${PLATFORM} = "freebsd" ]; then
+     # If we don't have libunwind then fallback to execinfo.
+     if ! enabled libunwind
+     then
+-        check_cc_header execinfo
++        if enabled_or_auto execinfo; then
++            if check_cc_header execinfo; then
++                enable execinfo
++            else
++                die "execinfo.h not found (use --disable-execinfo)"
++           fi
++        fi
+     fi
+ 
+ else
+-    check_cc_header execinfo
++    if enabled_or_auto execinfo; then
++        if check_cc_header execinfo; then
++            enable execinfo
++        else
++            die "execinfo.h not found (use --disable-execinfo)"
++        fi
++    fi
+ fi
+ check_cc_option mmx
+ check_cc_option sse2
+-- 
+2.33.0
+
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 4e84e496bf..58ebdcb054 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -161,6 +161,7 @@ define TVHEADEND_CONFIGURE_CMDS
 			--enable-dvbscan \
 			--enable-bundle \
 			--enable-pngquant \
+			--disable-execinfo \
 			--disable-ffmpeg_static \
 			--disable-hdhomerun_static \
 			$(TVHEADEND_CONF_OPTS) \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
