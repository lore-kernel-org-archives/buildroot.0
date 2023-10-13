Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A46CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 06:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33B8B81364;
	Fri, 13 Oct 2023 06:22:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33B8B81364
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5aVeic0DEinb; Fri, 13 Oct 2023 06:22:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3098281DA0;
	Fri, 13 Oct 2023 06:22:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3098281DA0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C4F4D1BF3C8
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 06:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A100B81DA0
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 06:22:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A100B81DA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BiVhFf_fnZUk for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 06:22:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4ACE81364
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 06:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4ACE81364
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D26978468D; Fri, 13 Oct 2023 06:22:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 08:05:09 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 5b1a3bd2c3314b2cc2b1b9ba13b62fe5b88c5b33
X-Git-Newrev: 5a594e2cf854cfa747fd1d51f193c458ff942e7c
X-Patchwork-Hint: ignore
Message-Id: <20231013062252.D26978468D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/pipewire: fix
 typo in Kconfig comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=5a594e2cf854cfa747fd1d51f193c458ff942e7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

"NTPL" should read "NPTL" (Native POSIX Threads Library).

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b9300f70b26f15d4cc58c0d5cff17f86b6e43bf6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pipewire/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
index 4929e5d3d1..9d2de6c866 100644
--- a/package/pipewire/Config.in
+++ b/package/pipewire/Config.in
@@ -60,7 +60,7 @@ comment "pipewire v4l2 support needs udev and a toolchain w/ headers >= 3.18"
 
 endif
 
-comment "pipewire needs a toolchain w/ dynamic library, NTPL, gcc >= 5"
+comment "pipewire needs a toolchain w/ dynamic library, NPTL, gcc >= 5"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
