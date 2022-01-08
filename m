Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18567C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 17:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D24C2408B6;
	Sat,  8 Jan 2022 17:52:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HZYmLQrHMz4M; Sat,  8 Jan 2022 17:52:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31E09402EE;
	Sat,  8 Jan 2022 17:52:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 098C21BF2C6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA3CC400CD
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:52:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pbzt2quAy7sR for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 17:52:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F71F400BA
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 17:52:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5D91C8324A; Sat,  8 Jan 2022 17:46:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 18:52:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ebe808ac4071395b4d1e90d617c33a5e6e514af1
X-Git-Newrev: 03aa3e6ac71a0fe1ff87fe192c8de0b1acebd0df
X-Patchwork-Hint: ignore
Message-Id: <20220108174616.5D91C8324A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] core/pkg-utils: properly indent
 per-package-rsync
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=03aa3e6ac71a0fe1ff87fe192c8de0b1acebd0df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Continuation lines should be indented one level more than the line the
are the continuation of.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-utils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 38ba5bca93..6aa64a2096 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -213,8 +213,8 @@ define per-package-rsync
 	mkdir -p $(3)
 	$(foreach pkg,$(1),\
 		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
-		$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
-		$(3)$(sep))
+			$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
+			$(3)
 endef
 
 # prepares the per-package HOST_DIR and TARGET_DIR of the current
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
