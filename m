Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A1CCA1013
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BFDF405A7;
	Thu,  4 Sep 2025 16:34:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yu1PwuGVd4zO; Thu,  4 Sep 2025 16:34:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 787F040580
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 787F040580;
	Thu,  4 Sep 2025 16:34:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E900106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E47DD60648
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4FDzba4EqgJZ for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:33:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37A0560633
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37A0560633
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 35D7E87F4B; Thu,  4 Sep 2025 16:33:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 14:15:21 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 5cf3e448d1d352f5339a1f7e2c086fb4372f34ac
X-Git-Newrev: f81bd1db4c11ed9ab0f6b4d2d9d1e8906c1d7dde
X-Patchwork-Hint: ignore
Message-Id: <20250904163336.35D7E87F4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] Reapply "package/ffmpeg:
 add support for pulseaudio"
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f81bd1db4c11ed9ab0f6b4d2d9d1e8906c1d7dde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

This reverts commit fecc337d21f337a30ef7f9f448683d99c01fc245,
re-adding optional support for pulseuadio in ffmpeg.

This is possible now that the circular dependency:

  pulseaudio -> libsoxr -> ffmpeg -> pulseaudio

has been broken between libsoxr and ffmpeg.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8db836d2924ca50269f4a2de199cce19cab5a2d7)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/ffmpeg/ffmpeg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 8ee45a8034..0211c35afb 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -92,6 +92,13 @@ else
 FFMPEG_CONF_OPTS += --disable-libjack
 endif
 
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+FFMPEG_DEPENDENCIES += pulseaudio
+FFMPEG_CONF_OPTS += --enable-libpulse
+else
+FFMPEG_CONF_OPTS += --disable-libpulse
+endif
+
 ifeq ($(BR2_PACKAGE_LIBV4L),y)
 FFMPEG_DEPENDENCIES += libv4l
 FFMPEG_CONF_OPTS += --enable-libv4l2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
