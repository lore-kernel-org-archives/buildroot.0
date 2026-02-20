Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0208CC54FD3
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 13:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0DC783EAF;
	Fri, 20 Feb 2026 13:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vguuJJBL0fGN; Fri, 20 Feb 2026 13:45:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6784083EA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771595141;
	bh=sWz8NgVnov2OT8ouOOF0tnVfCA59Q78KkaNjyrNEsJ8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d2FHrG3THV0plpandFIlTR2g+ddTr7IKL91wHIQBYVRRMpq8nq6wfkne/oPhrZ66+
	 J1Ab6MACTp+J24EvLBpOhuTH0eM2RL3kV+fmVuB+92eLydRml9OJOj3VOoyYTwiguo
	 b5SiV9w+Ybb9fzHGU4H6yFItgCc2LSNCf54thA142bdAEaEJWomC5wQE9KnZUnOO6F
	 4o8dTfuKKf3FFXcj28Dze7N5E5oAdhQ91vCXNURk9ju753Tv6Rvm0nJXsVbTh8+IZ2
	 p85QfyUrL6T7n/bOYyavWxe8x6CaLmd77DVs+Vzl3QKr55K6e08iGUUvSwHOcWEAwD
	 kSgn6tD8YvzDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6784083EA4;
	Fri, 20 Feb 2026 13:45:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 497A1183
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 13:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AECD40766
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 13:45:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DH5W0XbMLnTO for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 13:45:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EF2C40595
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EF2C40595
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 13:45:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D98287110; Fri, 20 Feb 2026 13:45:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 20 Feb 2026 13:53:54 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: a739fb7a0f34a83901cc90594a0050ad90a38893
X-Git-Newrev: 7136e0682ef76fc3ff53eb407ace1ef229f48197
X-Patchwork-Hint: ignore
Message-Id: <20260220134539.6D98287110@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] CHANGES: correct
 2025.11.2 release date
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7136e0682ef76fc3ff53eb407ace1ef229f48197
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Reported-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 07008c8f2ad9484a1d6df8a31622a109bbd86e1f)
---
 CHANGES | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index 9073aea474..0e8251a80f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2025.11.2, released February xx, 2026
+2025.11.2, released February 20, 2026
 
 	avahi: CVE-2021-3468, CVE-2023-38469, CVE-2023-38470, CVE-2023-38471,
 	  CVE-2023-38472, CVE-2023-38473, CVE-2024-52615, CVE-2024-52616,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
