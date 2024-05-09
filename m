Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5B1C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 17:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F21AC41776;
	Thu,  9 May 2024 17:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FKjIKx0eRh99; Thu,  9 May 2024 17:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C41441778
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C41441778;
	Thu,  9 May 2024 17:01:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 53CA91BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 17:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41993402BC
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 17:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PoJTOnU77Yj7 for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 17:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61ECA40198
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61ECA40198
 for <buildroot@buildroot.org>; Thu,  9 May 2024 17:01:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5693786D3D; Thu,  9 May 2024 17:01:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 18:56:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa36a6375dbeae131c596070570cec66c7bd2456
X-Git-Newrev: 45c4473bbfcd33de4ab3c9c359632417a25680f1
X-Patchwork-Hint: ignore
Message-Id: <20240509170112.5693786D3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ffmpeg: add optional support for
 libvpl
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

commit: https://git.buildroot.net/buildroot/commit/?id=45c4473bbfcd33de4ab3c9c359632417a25680f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added with commit
http://git.videolan.org/?p=ffmpeg.git;a=commit;h=7158f1e64d9b76afea78537a35c465447df0cff8

"It will fail to run configure script if both libmfx and libvpl are
enabled.

It is recommended to use oneVPL for new work, even for currently
available hardwares"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ffmpeg/ffmpeg.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index acd5a7d8b2..87c482656c 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -321,11 +321,14 @@ else
 FFMPEG_CONF_OPTS += --disable-libbluray
 endif
 
-ifeq ($(BR2_PACKAGE_INTEL_MEDIASDK),y)
-FFMPEG_CONF_OPTS += --enable-libmfx
+ifeq ($(BR2_PACKAGE_LIBVPL),y)
+FFMPEG_CONF_OPTS += --enable-libvpl --disable-libmfx
+FFMPEG_DEPENDENCIES += libvpl
+else ifeq ($(BR2_PACKAGE_INTEL_MEDIASDK),y)
+FFMPEG_CONF_OPTS += --disable-libvpl --enable-libmfx
 FFMPEG_DEPENDENCIES += intel-mediasdk
 else
-FFMPEG_CONF_OPTS += --disable-libmfx
+FFMPEG_CONF_OPTS += --disable-libvpl --disable-libmfx
 endif
 
 ifeq ($(BR2_PACKAGE_RTMPDUMP),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
