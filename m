Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA0CC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 14:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A10541556;
	Thu,  9 May 2024 14:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uOdqcdPugT51; Thu,  9 May 2024 14:31:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EFA2405D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EFA2405D2;
	Thu,  9 May 2024 14:31:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2244B1BF995
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C9244054B
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:31:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Er7TGYoj_aO for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 14:31:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 588DD400F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 588DD400F5
 for <buildroot@buildroot.org>; Thu,  9 May 2024 14:31:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 434A186BB9; Thu,  9 May 2024 14:31:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 16:15:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 10a59697e9a05954380d8dfb440a1c22efd6edf2
X-Git-Newrev: 1a8676aa6e4b0e372a1a744eac6e53c90c03bf0e
X-Patchwork-Hint: ignore
Message-Id: <20240509143147.434A186BB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bluez5_utils: disable datafiles
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a8676aa6e4b0e372a1a744eac6e53c90c03bf0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable installation of datafiles to avoid the following build failure
rasied since bump to version 5.75 in commit
b890206876588ed0d16187abf49d35a45177cc3d and
https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=be0e796299b0e7a73bf06c5655b56180588550b0:

rm: cannot remove '/home/buildroot/autobuild/instance-3/output-1/build/buildroot-fs/ext2/target/etc/bluetooth/input.conf': Permission denied
rm: cannot remove '/home/buildroot/autobuild/instance-3/output-1/build/buildroot-fs/ext2/target/etc/bluetooth/network.conf': Permission denied
rm: cannot remove '/home/buildroot/autobuild/instance-3/output-1/build/buildroot-fs/ext2/target/etc/bluetooth/main.conf': Permission denied

Fixes: b890206876588ed0d16187abf49d35a45177cc3d
 - http://autobuild.buildroot.org/results/cbd98588b3aced7c18467c2fec96e59c7d180881

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bluez5_utils/bluez5_utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index d386ad57f0..da10f95a05 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -25,6 +25,7 @@ BLUEZ5_UTILS_DEPENDENCIES = \
 BLUEZ5_UTILS_CONF_OPTS = \
 	--enable-library \
 	--disable-cups \
+	--disable-datafiles \
 	--disable-manpages \
 	--disable-asan \
 	--disable-lsan \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
