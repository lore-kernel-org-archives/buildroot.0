Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222FFCA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E917E40635;
	Thu,  4 Sep 2025 16:34:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q6fgm52oRhsc; Thu,  4 Sep 2025 16:34:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C6A940641
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C6A940641;
	Thu,  4 Sep 2025 16:34:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BBFEAE8
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FCF04009E
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BEHdiZewFUmu for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:33:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40738400AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40738400AA
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3EADD87E99; Thu,  4 Sep 2025 16:33:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 14:15:31 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: f81bd1db4c11ed9ab0f6b4d2d9d1e8906c1d7dde
X-Git-Newrev: 2f2eaa53b21c15e0ee5c9f02549c4b211548fe48
X-Patchwork-Hint: ignore
Message-Id: <20250904163336.3EADD87E99@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/ffmpeg: add
 optional support for libsoxr
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f2eaa53b21c15e0ee5c9f02549c4b211548fe48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Now that libsoxr no longer depends on ffmpeg, we can actually use
libsoxr in ffmpeg.

See:

  https://trac.ffmpeg.org/wiki/FFmpeg%20and%20the%20SoX%20Resampler

for some details.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c719a73a21ba5b35901e422f899afe5c19bf76fc)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/ffmpeg/ffmpeg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 0211c35afb..f218e60067 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -372,6 +372,13 @@ else
 FFMPEG_CONF_OPTS += --disable-libopenmpt
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSOXR),y)
+FFMPEG_CONF_OPTS += --enable-libsoxr
+FFMPEG_DEPENDENCIES += libsoxr
+else
+FFMPEG_CONF_OPTS += --disable-libsoxr
+endif
+
 ifeq ($(BR2_PACKAGE_SPEEX),y)
 FFMPEG_CONF_OPTS += --enable-libspeex
 FFMPEG_DEPENDENCIES += speex
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
