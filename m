Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D64C28B30
	for <buildroot@archiver.kernel.org>; Sun, 16 Mar 2025 20:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 683E181F05;
	Sun, 16 Mar 2025 20:28:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uNkQONk0eWmH; Sun, 16 Mar 2025 20:28:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70A1281FAA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70A1281FAA;
	Sun, 16 Mar 2025 20:28:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 72F2461
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 20:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02FD04015E
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 20:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WkJqNK3TJRMm for <buildroot@buildroot.org>;
 Sun, 16 Mar 2025 20:27:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EEEE40616
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EEEE40616
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 20:27:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BB9C8807C; Sun, 16 Mar 2025 20:27:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Mar 2025 21:24:04 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 7d3901ca5f6aa47b367a509d5139574f4b8c71c8
X-Git-Newrev: 01e010cfc453b53f02cbc354dac3e32f2bcdf771
X-Patchwork-Hint: ignore
Message-Id: <20250316202757.1BB9C8807C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/prboom: Fix big
 endian fix up
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

commit: https://git.buildroot.net/buildroot/commit/?id=01e010cfc453b53f02cbc354dac3e32f2bcdf771
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The hack to force big endian support when building
for a big endian machine doesn't work as there is
some whitespace between "#" and "undef" in config.h.

Add a wildcard between those two so that the target
line matches and the replacement is done.

Allows me to play DOOM on my LC475.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ebcd82198f2c84efddf82c7be9b0782b4180ce93)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/prboom/prboom.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/prboom/prboom.mk b/package/prboom/prboom.mk
index c1ba05ff70..fc440e5cf8 100644
--- a/package/prboom/prboom.mk
+++ b/package/prboom/prboom.mk
@@ -40,7 +40,7 @@ PRBOOM_CONF_OPTS = \
 
 # endianness detection isn't used when cross compiling
 define PRBOOM_BIG_ENDIAN_FIXUP
-	$(SED) 's,.*#undef WORDS_BIGENDIAN.*,#define WORDS_BIGENDIAN 1,g' \
+	$(SED) 's,.*#.*undef WORDS_BIGENDIAN.*,#define WORDS_BIGENDIAN 1,g' \
 		$(PRBOOM_DIR)/config.h
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
