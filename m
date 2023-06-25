Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9783EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 13:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8998A81F6A;
	Sun, 25 Jun 2023 13:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8998A81F6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yfNJtgJtSovQ; Sun, 25 Jun 2023 13:55:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9932081F21;
	Sun, 25 Jun 2023 13:55:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9932081F21
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0BECD1BF3BA
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8282940489
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8282940489
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9zIrA-wl5Aj2 for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 13:54:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 964A540158
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 13:54:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 964A540158
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84B16849F4; Sun, 25 Jun 2023 13:54:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 15:35:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d6fe4ae3e3ad0f5a0c9289f1e4c78070c05ef56
X-Git-Newrev: 39fef045414b5dde70401d197033eb8cf15e3099
X-Patchwork-Hint: ignore
Message-Id: <20230625135415.84B16849F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/open-plc-utils: bump to version
 1ba7d5a042e4e8ff6858b08e113eec5dc4e89cf2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=39fef045414b5dde70401d197033eb8cf15e3099
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other changes:
 - Remove 0002-plc-plc.h-fix-build-with-gcc-10.patch as
   related MR https://github.com/qca/open-plc-utils/pull/141
   has been merged.

Notable changes since last version:

 - Drop privileges after opening the channel file descriptor
 - Remove all checks for root permissions
 - Add chip identification for QCA7006AQ

Signed-off-by: Kai Stuhlemmer (ebee Engineering) <kai.stuhlemmer@ebee.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore                                |  1 -
 .../0002-plc-plc.h-fix-build-with-gcc-10.patch     | 37 ----------------------
 package/open-plc-utils/open-plc-utils.hash         |  2 +-
 package/open-plc-utils/open-plc-utils.mk           |  2 +-
 4 files changed, 2 insertions(+), 40 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 4a40bc7fcc..d0378929ee 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1115,7 +1115,6 @@ package/olsr/S50olsr Indent Shellcheck Variables
 package/omxplayer/0001-Update-Makefile-to-be-compatible-with-buildroot.patch Upstream
 package/open-iscsi/0001-SHA3-is-not-supported-by-libressl.patch Upstream
 package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch Upstream
-package/open-plc-utils/0002-plc-plc.h-fix-build-with-gcc-10.patch Upstream
 package/open2300/0001-fix-makefile.patch Upstream
 package/openjdk/17.0.7+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch Upstream
 package/openldap/0001-fix_cross_strip.patch Upstream
diff --git a/package/open-plc-utils/0002-plc-plc.h-fix-build-with-gcc-10.patch b/package/open-plc-utils/0002-plc-plc.h-fix-build-with-gcc-10.patch
deleted file mode 100644
index 063bfc536c..0000000000
--- a/package/open-plc-utils/0002-plc-plc.h-fix-build-with-gcc-10.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 27222be0b8db59cae30a5fcca93255daea147bb6 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 23 Sep 2020 19:05:23 +0200
-Subject: [PATCH] plc/plc.h: fix build with gcc 10
-
-Drop plcproperty from plc/plc.h to avoid the following build failure
-with gcc 10 (which defaults to -fno-common):
-
-/home/buildroot/autobuild/run/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: rules.o:(.bss+0x0): multiple definition of `plcproperty'; pibruin.o:(.bss+0x0): first defined here
-
-Fixes:
- - http://autobuild.buildroot.org/results/6b3064b64dea3d4aaf219f787429c25918101483
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/qca/open-plc-utils/pull/141]
----
- plc/plc.h | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/plc/plc.h b/plc/plc.h
-index 1fa32b53..208cf91a 100644
---- a/plc/plc.h
-+++ b/plc/plc.h
-@@ -496,9 +496,7 @@ struct __packed plcproperty
- 	uint8_t DATA_FORMAT;
- 	uint32_t DATA_LENGTH;
- 	uint8_t DATA_BUFFER [128];
--}
--
--plcproperty;
-+};
- 
- #ifndef __GNUC__
- #pragma pack (pop)
--- 
-2.28.0
-
diff --git a/package/open-plc-utils/open-plc-utils.hash b/package/open-plc-utils/open-plc-utils.hash
index 1788b42fc0..0ab661231a 100644
--- a/package/open-plc-utils/open-plc-utils.hash
+++ b/package/open-plc-utils/open-plc-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b0156567a71c608cc1a0b18bbb1c5a97dd0ad9180097435f7e99119712bb299b  open-plc-utils-32408520fcebe785983a68e39ec83830a3005779.tar.gz
+sha256  4b1b55896939f178321ffe1ec2dc6937ea688d577b3671a5f0edb5c3326dfa3d  open-plc-utils-1ba7d5a042e4e8ff6858b08e113eec5dc4e89cf2.tar.gz
 sha256  3137c632bbcec5e88b72dc13f4fe06ee184eea364fec8f7494bdfa57672ef921  LICENSE
diff --git a/package/open-plc-utils/open-plc-utils.mk b/package/open-plc-utils/open-plc-utils.mk
index d2ac39aca4..086552e09b 100644
--- a/package/open-plc-utils/open-plc-utils.mk
+++ b/package/open-plc-utils/open-plc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPEN_PLC_UTILS_VERSION = 32408520fcebe785983a68e39ec83830a3005779
+OPEN_PLC_UTILS_VERSION = 1ba7d5a042e4e8ff6858b08e113eec5dc4e89cf2
 OPEN_PLC_UTILS_SITE = $(call github,qca,open-plc-utils,$(OPEN_PLC_UTILS_VERSION))
 OPEN_PLC_UTILS_LICENSE = BSD-3-Clause
 OPEN_PLC_UTILS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
