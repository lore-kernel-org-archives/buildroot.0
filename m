Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108A6C021A4
	for <buildroot@archiver.kernel.org>; Wed, 12 Feb 2025 13:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69BE6424F8;
	Wed, 12 Feb 2025 13:15:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EMfXz-HvDIV5; Wed, 12 Feb 2025 13:15:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 422CC42506
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 422CC42506;
	Wed, 12 Feb 2025 13:15:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 68559194
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 13:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4979B40621
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 13:15:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QiKMQEYv0JTx for <buildroot@buildroot.org>;
 Wed, 12 Feb 2025 13:15:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48A4140410
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48A4140410
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 13:15:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33D4287582; Wed, 12 Feb 2025 13:15:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 12 Feb 2025 13:59:18 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 29a3e446a988729b872c208baecddb0ef768d830
X-Git-Newrev: 75634fc29429f4d4a3e5df3e92bdd5244c648559
X-Patchwork-Hint: ignore
Message-Id: <20250212131532.33D4287582@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/ffmpeg: add
 optional support for libxml2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=75634fc29429f4d4a3e5df3e92bdd5244c648559
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Support for libxml2 was added 2017 in ffmpeg version 3.4:
http://git.videolan.org/?p=ffmpeg.git;a=commit;h=96d70694aea64616c68db8be306c159c73fb3980

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit abd20d7a27fb2fc0a7bd9d8ccd515485da742133)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 08a93e6af3..b3d0ab9834 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -390,6 +390,13 @@ else
 FFMPEG_CONF_OPTS += --disable-iconv
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+FFMPEG_CONF_OPTS += --enable-libxml2
+FFMPEG_DEPENDENCIES += libxml2
+else
+FFMPEG_CONF_OPTS += --disable-libxml2
+endif
+
 # ffmpeg freetype support require fenv.h which is only
 # available/working on glibc.
 # The microblaze variant doesn't provide the needed exceptions
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
