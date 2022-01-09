Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06842C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0FA181A16;
	Sun,  9 Jan 2022 22:49:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XpGdh7f3O5s8; Sun,  9 Jan 2022 22:49:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 135D6819E6;
	Sun,  9 Jan 2022 22:49:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBE9E1BF41C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3B274045E
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:49:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wctqg0ziOvDU for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:49:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5A2940385
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:49:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 87B10832C2; Sun,  9 Jan 2022 22:42:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 23:45:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53c0c7dd01228122c7ceb44d65f2800dbcf473f1
X-Git-Newrev: 7bdb65b3109a8256c6052f2cb35a989432f7a508
X-Patchwork-Hint: ignore
Message-Id: <20220109224247.87B10832C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/avrdude: add support for hidapi
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

commit: https://git.buildroot.net/buildroot/commit/?id=7bdb65b3109a8256c6052f2cb35a989432f7a508
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If BR2_PACKAGE_HIDAPI is selected, add it to avrdude build
dependencies.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/avrdude/avrdude.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 6a8e9074b7..accd92c1d5 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -28,6 +28,10 @@ else ifeq ($(BR2_PACKAGE_LIBFTDI),y)
 AVRDUDE_DEPENDENCIES += libftdi
 endif
 
+ifeq ($(BR2_PACKAGE_HIDAPI),y)
+AVRDUDE_DEPENDENCIES += hidapi
+endif
+
 # if /etc/avrdude.conf exists, the installation process creates a
 # backup file, which we do not want in the context of Buildroot.
 define AVRDUDE_REMOVE_BACKUP_FILE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
