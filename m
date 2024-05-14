Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5530C25B75
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 15:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A0FE820D8;
	Tue, 14 May 2024 15:39:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4QWJo6d0X_kV; Tue, 14 May 2024 15:39:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 795FD82159
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 795FD82159;
	Tue, 14 May 2024 15:39:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A3A301BF4DB
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 15:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CCD3820D8
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 15:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KAynQVj9dAdt for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 15:39:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D772D820C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D772D820C4
 for <buildroot@buildroot.org>; Tue, 14 May 2024 15:39:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB5BE873BD; Tue, 14 May 2024 15:39:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 17:39:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1dace793ba11fc45c6ae7842a84daa4612ad4279
X-Git-Newrev: 31c39632856ecd38d3597793e8273786d4f0614f
X-Patchwork-Hint: ignore
Message-Id: <20240514153934.BB5BE873BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/acmesystems/acqua-a5: fix hash of
 at91bootstrap3
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

commit: https://git.buildroot.net/buildroot/commit/?id=31c39632856ecd38d3597793e8273786d4f0614f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 5b847f88fef7 (board: update hashes for generated achives) updated
the file

    board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash

by changing the file name suffix: -git3.tar.gz -> -git4.tar.gz. It did
not, however, update the hash itself. Do it now.

Fixes: 5b847f88fef768c8e79422db4193533b3a7488ea
Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash b/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash
index 3734f22c95..6edf3d3345 100644
--- a/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash
+++ b/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  fef34111a07d9e5aa97b0840355a367f806a17e029583830e9deaa747ce47824  at91bootstrap3-v3.10.3-git4.tar.gz
+sha256  5ea2a8fed1ba0024229c6f6d77176679e1b24791bdbce8e285634013d4a93551  at91bootstrap3-v3.10.3-git4.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
