Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56CAC433FE
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 16:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58F2B408AE;
	Sat, 29 Oct 2022 16:10:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58F2B408AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 68SsL3PDgLYL; Sat, 29 Oct 2022 16:10:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28F30404ED;
	Sat, 29 Oct 2022 16:10:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28F30404ED
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42E7A1BF5DC
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 16:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14B93813B6
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 16:09:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14B93813B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qAa8p2RBUGMu for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 16:09:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A8E3813B9
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 16:09:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A8E3813B9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A7D986FBA; Sat, 29 Oct 2022 16:09:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 18:08:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c7b4f88bca9b1ceba6478c5c03797675b1f10e8
X-Git-Newrev: 6cbfed0dbf43c5e04e3cc543b642e3c996bfed97
X-Patchwork-Hint: ignore
Message-Id: <20221029160920.7A7D986FBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dahdi-linux: bump to version 3.2.0
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7505726391526069401=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7505726391526069401==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6cbfed0dbf43c5e04e3cc543b642e3c996bfed97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Use official tarball
- This bump will fix the following build failures with kernel >= 5.16:

/home/autobuild/autobuild/instance-6/output-1/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/wct4xxp/base.c:45:10: fatal error: stdbool.h: No such file or directory
   45 | #include <stdbool.h>
      |          ^~~~~~~~~~~

[...]

../dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/xpp/xbus-core.c: In function ‘xbus_read_proc_open’:
../dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/xpp/xbus-core.c:1845:43: error: implicit declaration of function ‘PDE_DATA’; did you mean ‘NODE_DATA’? [-Werror=implicit-function-declaration]
 1845 |  return single_open(file, xbus_proc_show, PDE_DATA(inode));
      |                                           ^~~~~~~~
      |                                           NODE_DATA

https://github.com/asterisk/dahdi-linux/compare/5c840cf43838e0690873e73409491c392333b3b8...v3.2.0

Fixes:
 - http://autobuild.buildroot.org/results/3f23559f01a7783d82ad4e0b2d6792171e6f2b79
 - http://autobuild.buildroot.org/results/f3f226fb661a6b1998381f5fb7cb306771c2ecc0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dahdi-linux/dahdi-linux.hash | 4 ++--
 package/dahdi-linux/dahdi-linux.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/dahdi-linux/dahdi-linux.hash b/package/dahdi-linux/dahdi-linux.hash
index 7a4c688061..2d3f336777 100644
--- a/package/dahdi-linux/dahdi-linux.hash
+++ b/package/dahdi-linux/dahdi-linux.hash
@@ -1,5 +1,5 @@
-# Locally computed
-sha256  3faf127ee3f1fad0195c56d00b7bf2708ec8a54bf3c31edd827fd9beb47e0a51  dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8-br1.tar.gz
+# From http://downloads.asterisk.org/pub/telephony/dahdi-linux/releases/dahdi-linux-3.2.0.sha256
+sha256  e2ef9b3f6769f60f432cfa09c39c9a0d7ab5bddff59229f385056915c65f9f13  dahdi-linux-3.2.0.tar.gz
 
 # Firmware files have no upstream hash, so sha56 locally computed
 sha256  3ff26cf80555fd7470b43a87c51d03c1db2a75abcd4561d79f69b6c48298e4a1  dahdi-fwload-vpmadt032-1.25.0.tar.gz
diff --git a/package/dahdi-linux/dahdi-linux.mk b/package/dahdi-linux/dahdi-linux.mk
index 93124f0e02..88519b5106 100644
--- a/package/dahdi-linux/dahdi-linux.mk
+++ b/package/dahdi-linux/dahdi-linux.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DAHDI_LINUX_VERSION = 5c840cf43838e0690873e73409491c392333b3b8
-DAHDI_LINUX_SITE = https://gerrit.asterisk.org/dahdi-linux
-DAHDI_LINUX_SITE_METHOD = git
+DAHDI_LINUX_VERSION = 3.2.0
+DAHDI_LINUX_SITE = \
+	http://downloads.asterisk.org/pub/telephony/dahdi-linux/releases
 
 # We need to download all those firmware blobs ourselves, otherwise
 # dahdi-linux will try to download them at install time.

--===============7505726391526069401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7505726391526069401==--
