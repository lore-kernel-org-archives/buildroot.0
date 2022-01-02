Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93FCC433EF
	for <buildroot@archiver.kernel.org>; Sun,  2 Jan 2022 17:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DBC060AF7;
	Sun,  2 Jan 2022 17:46:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8gB3OywC8Hts; Sun,  2 Jan 2022 17:46:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B40D360601;
	Sun,  2 Jan 2022 17:46:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3DBB71BF3FF
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 17:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CDB560601
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 17:46:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JyC3HxVqWoCx for <buildroot@lists.busybox.net>;
 Sun,  2 Jan 2022 17:46:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19C4160594
 for <buildroot@buildroot.org>; Sun,  2 Jan 2022 17:46:48 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id i22so65814941wrb.13
 for <buildroot@buildroot.org>; Sun, 02 Jan 2022 09:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u8cU2q6Zkin+zfGeMrSe3l9+7aF5hPp2QuobvLUba3M=;
 b=gt4c4xZVcTz8QgHW0IhZQj/BUgPEtoSDNnNd1+wY5YD3IpXcxrTFz4VUDONm5zGs1J
 t1Q3Jf5ZIQxrrQguT/sHVd5u1XonLrCgpWrUU807v9Md4YLsGlqIJWUqWTvv+U4YxPVc
 PBxE760zZQBf4CDc6Hq9h8lV6dokZE0tfPG/z43cBK8fhNF/3yv0wDGJCtr8BhJIellq
 fgbdxggaSbxuPCCGU9rBwRGi//F3kjxpoOGuzvwmOjFoEGiXp+h9naKxeBUy8PzyduDe
 QocfL9U46Mt1Jc40QxXTeA04tdmVb7DfFh5ZeWYzTG25TOHn4bggDFWaHwN4MUapDhIi
 G3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u8cU2q6Zkin+zfGeMrSe3l9+7aF5hPp2QuobvLUba3M=;
 b=PT0Y18KHxrRH8TduCzwRUWMqvuSaL46pbzXUaOkhVHUvo2hqopOQd/1DqJVyvcwf2V
 l2vKy31MYWzT/lTQG+4PFs47aA9DoC/OFyzuC/rGLv5deuU++48NA7inUmXlN2w+5w0N
 KX+MYIoQTo3slvl/5iA3LoBnAsaL194qNTWmMxluM7T20B9T5LHFBbGi8qiHG/8BnqSP
 VDPQ8pnARO6NrWLsoNLzJReaJCm2h4oDuBfxxYtp1P7XZdx5/Z0jtHHAYVxwqkkscScE
 +ZH2HPbv2KSLXuLT02ov1aesaNVHNLRO4WIrxL42lksp/PHgvSy7mavkkEXC4ZQufSu3
 ME5g==
X-Gm-Message-State: AOAM533D5TADOb1r5MLg+TFXvC+EUNEC0P8aF1xYjpF8hBa6gDG/VqoB
 M/5YjdK70Mxx49uYWaAjegdjcrXLX8Q=
X-Google-Smtp-Source: ABdhPJzwrUfiZH++eCDMMbaefUI6Ipo3bZlllbXubZdCe4wUaY3UnKMJQfjfdpb7ULZXZyNOZLmgLA==
X-Received: by 2002:a5d:54d2:: with SMTP id x18mr35640498wrv.701.1641145607203; 
 Sun, 02 Jan 2022 09:46:47 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id w9sm1636668wrq.70.2022.01.02.09.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jan 2022 09:46:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Jan 2022 18:45:56 +0100
Message-Id: <20220102174556.2824179-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dnsmasq: fix build with gcc 4.8
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc 4.8 raised since bump to
version 2.86 in commit 5b29096f8fcb0acd8890073a56ba9d620b1f911c:

option.c: In function 'one_opt':
option.c:2445:11: error: 'for' loop initial declarations are only allowed in C99 mode
           for (char *p = arg; *p; p++) {
           ^
option.c:2445:11: note: use option -std=c99 or -std=gnu99 to compile your code
option.c:2453:11: error: 'for' loop initial declarations are only allowed in C99 mode
           for (u8 i = 0; i < sizeof(daemon->umbrella_device); i++, arg+=2) {
           ^

Fixes:
 - http://autobuild.buildroot.org/results/39b34a4e69fc10f4bd9d4ddb0ed8c0aae5741c84

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-src-option.c-fix-build-with-gcc-4.8.patch | 52 +++++++++++++++++++
 ...9080ff8743133fbd52427b4b2213171-typo.patch | 36 +++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 package/dnsmasq/0001-src-option.c-fix-build-with-gcc-4.8.patch
 create mode 100644 package/dnsmasq/0002-Fix-46312909d9080ff8743133fbd52427b4b2213171-typo.patch

diff --git a/package/dnsmasq/0001-src-option.c-fix-build-with-gcc-4.8.patch b/package/dnsmasq/0001-src-option.c-fix-build-with-gcc-4.8.patch
new file mode 100644
index 0000000000..50ecf2f18a
--- /dev/null
+++ b/package/dnsmasq/0001-src-option.c-fix-build-with-gcc-4.8.patch
@@ -0,0 +1,52 @@
+From 46312909d9080ff8743133fbd52427b4b2213171 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 31 Dec 2021 17:29:44 +0100
+Subject: [PATCH] src/option.c: fix build with gcc 4.8
+
+Fix the following build failure with gcc 4.8 raised since version 2.86:
+
+option.c: In function 'one_opt':
+option.c:2445:11: error: 'for' loop initial declarations are only allowed in C99 mode
+           for (char *p = arg; *p; p++) {
+           ^
+option.c:2445:11: note: use option -std=c99 or -std=gnu99 to compile your code
+option.c:2453:11: error: 'for' loop initial declarations are only allowed in C99 mode
+           for (u8 i = 0; i < sizeof(daemon->umbrella_device); i++, arg+=2) {
+           ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/39b34a4e69fc10f4bd9d4ddb0ed8c0aae5741c84
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream commit 46312909d9080ff8743133fbd52427b4b2213171]
+---
+ src/option.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/option.c b/src/option.c
+index ff54def..c57f6d8 100644
+--- a/src/option.c
++++ b/src/option.c
+@@ -2525,7 +2525,8 @@ static int one_opt(int option, char *arg, char *errstr, char *gen_err, int comma
+           arg += 9;
+           if (strlen(arg) != 16)
+               ret_err(gen_err);
+-          for (char *p = arg; *p; p++) {
++          char *p;
++          for (*p = arg; *p; p++) {
+             if (!isxdigit((int)*p))
+               ret_err(gen_err);
+           }
+@@ -2533,7 +2534,8 @@ static int one_opt(int option, char *arg, char *errstr, char *gen_err, int comma
+ 
+           u8 *u = daemon->umbrella_device;
+           char word[3];
+-          for (u8 i = 0; i < sizeof(daemon->umbrella_device); i++, arg+=2) {
++          u8 i;
++          for (i = 0; i < sizeof(daemon->umbrella_device); i++, arg+=2) {
+             memcpy(word, &(arg[0]), 2);
+             *u++ = strtoul(word, NULL, 16);
+           }
+-- 
+2.33.0
+
diff --git a/package/dnsmasq/0002-Fix-46312909d9080ff8743133fbd52427b4b2213171-typo.patch b/package/dnsmasq/0002-Fix-46312909d9080ff8743133fbd52427b4b2213171-typo.patch
new file mode 100644
index 0000000000..8cdf5b3f1b
--- /dev/null
+++ b/package/dnsmasq/0002-Fix-46312909d9080ff8743133fbd52427b4b2213171-typo.patch
@@ -0,0 +1,36 @@
+From 2748fb81e23b71e2c44956e99321816aca91905d Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Sat, 1 Jan 2022 23:03:26 +0000
+Subject: [PATCH] Fix 46312909d9080ff8743133fbd52427b4b2213171 typo.
+
+[Upstream commit 2748fb81e23b71e2c44956e99321816aca91905d]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com> 
+---
+ src/option.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/option.c b/src/option.c
+index c57f6d8..6f56ce8 100644
+--- a/src/option.c
++++ b/src/option.c
+@@ -357,7 +357,7 @@ static const struct myoption opts[] =
+     { "dhcp-ignore-clid", 0, 0,  LOPT_IGNORE_CLID },
+     { "dynamic-host", 1, 0, LOPT_DYNHOST },
+     { "log-debug", 0, 0, LOPT_LOG_DEBUG },
+-	{ "umbrella", 2, 0, LOPT_UMBRELLA },
++    { "umbrella", 2, 0, LOPT_UMBRELLA },
+     { "quiet-tftp", 0, 0, LOPT_QUIET_TFTP },
+     { NULL, 0, 0, 0 }
+   };
+@@ -2526,7 +2526,7 @@ static int one_opt(int option, char *arg, char *errstr, char *gen_err, int comma
+           if (strlen(arg) != 16)
+               ret_err(gen_err);
+           char *p;
+-          for (*p = arg; *p; p++) {
++          for (p = arg; *p; p++) {
+             if (!isxdigit((int)*p))
+               ret_err(gen_err);
+           }
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
