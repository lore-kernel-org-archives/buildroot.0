Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8243C4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F6E241685;
	Tue,  1 Nov 2022 22:26:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F6E241685
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aJFthKzBo7rZ; Tue,  1 Nov 2022 22:26:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B6BA415D8;
	Tue,  1 Nov 2022 22:26:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B6BA415D8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4FF001BF3E8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C6DF60E4E
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C6DF60E4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 65nzmtcH8iqU for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:26:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5751860E2F
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5751860E2F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46034879A4; Tue,  1 Nov 2022 22:26:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Nov 2022 23:26:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f71e8c313eecd6aeacc3d7e4f10edd645034809d
X-Git-Newrev: fbaffb0179b904e4a19a3a13af842f4ba9ee0b96
X-Patchwork-Hint: ignore
Message-Id: <20221101222614.46034879A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/igd2-for-linux: bump to version 2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=fbaffb0179b904e4a19a3a13af842f4ba9ee0b96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix the build with pupnp >= 1.14.13 raised since commit
a9ee25b01b741ad4f68575974c89c65146ab87f2 and
https://github.com/pupnp/pupnp/commit/2f99af26731ec7d5677e5576c006a35128b59d55:

In file included from src/threadutil/FreeList.h:43,
                 from src/threadutil/TimerThread.h:39,
                 from src/gatedevice.h:32,
                 from src/gatedevice.c:38:
src/threadutil/ithread.h:917:12: error: expected ';' before 'int'
  917 | EXPORT_SPEC int pthread_mutexattr_setkind_np(
      |            ^~~~
      |            ;

Fixes:
 - http://autobuild.buildroot.org/results/2eebf8264327bd492ee8cadc0c539d42c4f2e252

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/igd2-for-linux/igd2-for-linux.hash | 2 +-
 package/igd2-for-linux/igd2-for-linux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/igd2-for-linux/igd2-for-linux.hash b/package/igd2-for-linux/igd2-for-linux.hash
index fe1272338a..3b4fd4f5c9 100644
--- a/package/igd2-for-linux/igd2-for-linux.hash
+++ b/package/igd2-for-linux/igd2-for-linux.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  843f2b0a7597e6cc7af85da099a7cce3401a334cbb4a6ae9d38ce252311db9b9  igd2-for-linux-2.1.tar.gz
+sha256  68ee10bf02b18890af8bf9e38be377f038627cd16fce54200fc1b26fd83e4375  igd2-for-linux-2.2.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  linuxigd2/doc/LICENSE
 sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  linuxigd2/src/threadutil/COPYING
diff --git a/package/igd2-for-linux/igd2-for-linux.mk b/package/igd2-for-linux/igd2-for-linux.mk
index 8cc3c6ae18..c646c6bf92 100644
--- a/package/igd2-for-linux/igd2-for-linux.mk
+++ b/package/igd2-for-linux/igd2-for-linux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IGD2_FOR_LINUX_VERSION = 2.1
+IGD2_FOR_LINUX_VERSION = 2.2
 IGD2_FOR_LINUX_SITE = \
 	$(call github,Orange-OpenSource,igd2-for-linux,v$(IGD2_FOR_LINUX_VERSION))
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
