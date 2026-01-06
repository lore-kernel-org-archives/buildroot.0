Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37256D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3AAD4088B;
	Wed,  7 Jan 2026 17:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2d4yEOHNmjYE; Wed,  7 Jan 2026 17:48:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13A8C40949
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808119;
	bh=GdzmTvpXPy0Gan2XPqTGJ9cDmOrGydj+jWPKWkjqEdM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cdJaAhyZVKXGsyJBQLay6DFXZhM6yGmYuNJZj0UJk0bO8f6uG3RZ0yVb5FwqOY00/
	 U/FixNl9p6eYL3aRpKYhKIggtyyeBJ0b/he84YzrA/2kPtPX7yMB4QK1zonJQRGixE
	 YDb9l/eKugoVdNvPpe2PrGEH/SPSiNzbDSgrYfIuICI10FKxQv1NifRTHFsPAfaFKV
	 pSVKdqxLDS0AS03SyaIPBUrSlwttXLAf2QsEsNw8GqQ9OvsF3w5k6NzgbQyJkhLjz7
	 /ZKqmws6YHsBuQKlRq34oaU4F4oDNARBt7lAgiu59L71GJ/KDJJxZusIgxwVYIZufL
	 ruskYQiNOGphA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13A8C40949;
	Wed,  7 Jan 2026 17:48:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E3E19ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31E6A6089B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W4jD9NScKotd for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53B6A6083E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53B6A6083E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 533FF883AA; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:17:22 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 215197fd17c0d93bb8b91c6d80f6aebc89058bc9
X-Git-Newrev: 589c1f6be3ec3af1743e1424243f5f7a48c0d41e
X-Patchwork-Hint: ignore
Message-Id: <20260107174641.533FF883AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] DEVELOPERS: add Giulio
 Benetti to vim
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=589c1f6be3ec3af1743e1424243f5f7a48c0d41e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit edf4a89aaf9d7af884149a431a141a4b80c524bc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index aeaf0d1ea9..97cf77eda5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1309,6 +1309,7 @@ F:	package/tmux/
 F:	package/trace-cmd/
 F:	package/udisks/
 F:	package/util-linux/
+F:	package/vim/
 F:	package/wilc-driver/
 F:	toolchain/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
