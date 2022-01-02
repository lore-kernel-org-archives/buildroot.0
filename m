Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB556C433EF
	for <buildroot@archiver.kernel.org>; Sun,  2 Jan 2022 19:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60C39402BA;
	Sun,  2 Jan 2022 19:14:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7X7i5YVpw9YV; Sun,  2 Jan 2022 19:14:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FAF6402C3;
	Sun,  2 Jan 2022 19:14:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 622901BF3F4
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 19:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 514E2400D6
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 19:12:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uXjgnYYP4LZc for <buildroot@lists.busybox.net>;
 Sun,  2 Jan 2022 19:11:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C502A400D5
 for <buildroot@buildroot.org>; Sun,  2 Jan 2022 19:11:56 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q16so66117394wrg.7
 for <buildroot@buildroot.org>; Sun, 02 Jan 2022 11:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W6Yysi/4i12aa7MQJmeAsfOAAT3lPIza6T6CZV7o8Io=;
 b=DRawiPQAe/FE6eG0/cESQsjnoYRQ/9AFP58vHk+4/+GXyqk8olVA17l2Dynlp32KyD
 vs4CHVZnCE3UAcHzgXI7SARLVV7uzDeppM1e8BYr0Ey++LVkuhd/ZfADJMCxa91pCcjN
 9pGvihabUp8KeVNbVU76trP/fkEDe1OYix0ZqjoR/Whqx0vC2aDhG5LNPe3kqjxnopTV
 /2mah8yR8+ovmO/SN3UspVBb91pi2mzNT+PqKUGaymtXe9mLAZbKWPovlxWi2PpWrSyj
 lM3MIx5v2lcVJeK8MFioVhAVF6+qsnkqqjTPFn1IAObrDaGzAdXu9EZC7JVVRvI39OV8
 +0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W6Yysi/4i12aa7MQJmeAsfOAAT3lPIza6T6CZV7o8Io=;
 b=knDRLqi6HzgXcNFVQo5FJYPMMPbdCZY+3X5Uo1mcbS5aDVleCTDB3eBKuNs3QS/7EQ
 1oO7jP/5rIvBu/jIkFCoLszLGZ1jijK5OCGcmcgGu8SKAcul54lQyGLdrB2bVvlSGMN8
 Xck0djtcC87gYoe3TlVp5UHN+AFAuTV/ljAdfqtXuQ4LIpNuXpXfcL32MI+87pJYdSYH
 bzUfdrQew1CsG7Txtwq15Y4QizFxzqbe4jEYeFUsgz/I4VCqpTtJbzu/gW/oZemMNJP5
 kTwxASN1aOdUlco0qI1KgRZuII6k99FOPqFzy94KrvldYUMt/DE3q2T79dt9UEg4nkSb
 WZ7Q==
X-Gm-Message-State: AOAM532PJhm/b/QlaBRUt4aoddvnIYkuXwXKK4NeIW59LnHDLjPdkhuY
 4+CAvqf0XLXExfxCNztudJrrRuh8Y9c=
X-Google-Smtp-Source: ABdhPJwiQnNGiGKpCOiHinxV+LT2cXaZ09Q++EseCrE47NMSAKGcgoYITjYTbsEn2rk32jCKGJV/QA==
X-Received: by 2002:a5d:4b0a:: with SMTP id v10mr35509582wrq.294.1641150714772; 
 Sun, 02 Jan 2022 11:11:54 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id p23sm31661527wms.3.2022.01.02.11.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jan 2022 11:11:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Jan 2022 20:10:26 +0100
Message-Id: <20220102191027.3219775-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libsigrokdecode: fix build with
 python 3.10
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
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with sigrok-cli raised since bump of
python3 to version 3.10.1 in commit
25b1fc2898d68ddf2674b14c738045875fc5a2dc:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-none-linux-gnu/10.3.1/../../../../aarch64-none-linux-gnu/bin/ld: /home/giuliobenetti/autobuild/run/instance-3/output-1/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libsigrokdecode.so: undefined reference to `PyTuple_SetItem'

Fixes:
 - http://autobuild.buildroot.org/results/e2f33366803b18aff29086007610fa0a264f90d6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...02-configure-Add-python-3-10-support.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/libsigrokdecode/0002-configure-Add-python-3-10-support.patch

diff --git a/package/libsigrokdecode/0002-configure-Add-python-3-10-support.patch b/package/libsigrokdecode/0002-configure-Add-python-3-10-support.patch
new file mode 100644
index 0000000000..e3148dcde8
--- /dev/null
+++ b/package/libsigrokdecode/0002-configure-Add-python-3-10-support.patch
@@ -0,0 +1,28 @@
+From c4c10b89396fe21a622b8c38dd5815a496b007bf Mon Sep 17 00:00:00 2001
+From: Soeren Apel <soeren@apelpie.net>
+Date: Mon, 20 Dec 2021 19:36:39 +0100
+Subject: [PATCH] configure: Add python 3.10 support
+
+[Retrieved from:
+https://sigrok.org/gitweb/?p=libsigrokdecode.git;a=commit;h=c4c10b89396fe21a622b8c38dd5815a496b007bf]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 2917cb3..b8841f8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -100,7 +100,7 @@ SR_PKG_CHECK_SUMMARY([srd_pkglibs_summary])
+ # first, since usually only that variant will add "-lpython3.8".
+ # https://docs.python.org/3/whatsnew/3.8.html#debug-build-uses-the-same-abi-as-release-build
+ SR_PKG_CHECK([python3], [SRD_PKGLIBS],
+-	[python-3.9-embed], [python-3.8-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
++	[python-3.10-embed], [python-3.9-embed], [python-3.8-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
+ AS_IF([test "x$sr_have_python3" = xno],
+ 	[AC_MSG_ERROR([Cannot find Python 3 development headers.])])
+ 
+-- 
+2.24.0.rc2
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
