Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2672D0D156
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B304841329;
	Wed,  7 Jan 2026 18:01:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x3ZyWKGSpHyT; Wed,  7 Jan 2026 18:01:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0B484132A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808914;
	bh=/h5Sb34Ibl08b/jGTnlruhgD69tOA5LsGB8UaRiAC4o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aKztvHFqfCsamq2b67kq3WwwVhUbLYdxWtKDYKV9AaA/n/2gIwBl7kb/xV4/AZVLa
	 NiFc2KoygNna/3O0K7lH/hFuHx5SMBn08SI8+4p/s3vEjbm53eWjS3g+JaeCrdXG7c
	 VxVeJvncsjxkNrB8V+K5n7C927uPh8YkRJtTkOSBCT9NAZOFU/Mb4XcVpISww3o71V
	 rRvX65rEu/4/DUnIzYpVfIwcuWvU76NfXMqSXlEeKGl5xQGH9L7Hw5P5Br3/DCFtu6
	 1LsAM/tiELjzsyCYAxiSG4ntHMf/atR7PVRtqwh9pJN9s9VPYr4Gw5je/eIyiRiNz/
	 KvwHcAzOeucAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0B484132A;
	Wed,  7 Jan 2026 18:01:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D44D9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C461480EDB
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UsB4nlPUqWiU for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C9B580AB2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C9B580AB2
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BA3287C86; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:40:04 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 71fa1a61c541809951fa0b1f026adaa1173518d3
X-Git-Newrev: 8ec8167d80a8c8daf0537bc4f3486da384667a0d
X-Patchwork-Hint: ignore
Message-Id: <20260107180112.1BA3287C86@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] DEVELOPERS: add Giulio
 Benetti to package dash
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ec8167d80a8c8daf0537bc4f3486da384667a0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 92f2cb504545d3377da460cba407c09c842824cf)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4d1aaae2a1..f5ad587424 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1291,6 +1291,7 @@ F:	configs/rockpro64_defconfig
 F:	package/at/
 F:	package/binutils/
 F:	package/cryptsetup/
+F:	package/dash/
 F:	package/erlang-jiffy/
 F:	package/esp-hosted/
 F:	package/gcc/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
