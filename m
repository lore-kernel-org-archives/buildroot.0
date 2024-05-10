Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C008C25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 21:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A132404A3;
	Fri, 10 May 2024 21:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LU-5c2qD41R5; Fri, 10 May 2024 21:33:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1726240B7F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1726240B7F;
	Fri, 10 May 2024 21:33:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E0C811BF36A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCFD240507
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:33:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j2xwkeAIoaIo for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 21:33:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE7DB404FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE7DB404FE
 for <buildroot@buildroot.org>; Fri, 10 May 2024 21:33:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B06786F7A; Fri, 10 May 2024 21:33:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 23:33:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd1ea28b07e9b50facbee4aee0254631b9b4fe14
X-Git-Newrev: 0dd00cbce5d9d2eb4f5232080459ba32416192ef
X-Patchwork-Hint: ignore
Message-Id: <20240510213331.9B06786F7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8189fs: bump to latest git
 commit
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0dd00cbce5d9d2eb4f5232080459ba32416192ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to latest git commit to fix the following powerpc64 build failure
raised at least since commit 25956b29e4d63f599b9baf7298f69538ba2f22fa
thanks to
https://github.com/jwrdegoede/rtl8189ES_linux/commit/c7bf7590bc0d7252005fd0496898ad420a85e1ae:

In file included from /home/autobuild/autobuild/instance-7/output-1/build/rtl8189fs-5d523593f41c0b8d723c6aa86b217ee1d0965786/./include/drv_types.h:30,
                 from /home/autobuild/autobuild/instance-7/output-1/build/rtl8189fs-5d523593f41c0b8d723c6aa86b217ee1d0965786/./core/rtw_cmd.c:17:
/home/autobuild/autobuild/instance-7/output-1/build/rtl8189fs-5d523593f41c0b8d723c6aa86b217ee1d0965786/./include/wifi.h:459:32: error: conflicting types for 'get_ra'; have 'unsigned char *(unsigned char *)'
  459 | __inline static unsigned char *get_ra(unsigned char *pframe)
      |                                ^~~~~~

Fixes: 25956b29e4d63f599b9baf7298f69538ba2f22fa
 - http://autobuild.buildroot.org/results/83153ed38a583ce2712df9b142ac3fc55a8413e3
 - http://autobuild.buildroot.org/results/63186c7adb5ecc8b8a16a6ae641ecfb9c03478bd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8189fs/rtl8189fs.hash | 2 +-
 package/rtl8189fs/rtl8189fs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index e3d63ac4b0..2746194f43 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c92e1d800258665835922c1e927708f7a0477a1cbb281dc98ba5d33d5e3271ee  rtl8189fs-5d523593f41c0b8d723c6aa86b217ee1d0965786.tar.gz
+sha256  b28c15f4631f4151ea6fca96d59aec931766af49ccb7a0d5e1080fc41a323713  rtl8189fs-eb51e021b0e1b6f94a4b49da3f4ee5c5fb20b715.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index 86a2ac734b..174bb346ca 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = 5d523593f41c0b8d723c6aa86b217ee1d0965786
+RTL8189FS_VERSION = eb51e021b0e1b6f94a4b49da3f4ee5c5fb20b715
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
