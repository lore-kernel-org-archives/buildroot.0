Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB1AD0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 128C180F1A;
	Wed,  7 Jan 2026 17:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ATYCHyp0xzaf; Wed,  7 Jan 2026 17:48:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39538822BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808125;
	bh=mgUeImGXw6MMrEkaXh4sfaSMHTdNrCJn0SGwx5Vye1c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UXRg/PO+RQX5l18+DG3cM7hOZjRyDBSNsh7b/gc3UuY/v+0226w8Dp/iL2oGz41Xo
	 kZlPaAmLHFqDEPbVJe0kYYlnv5tsvzPQkx9U/3L8qdSxyZIhGlgajXVxeMPlcn5aJl
	 +I73c4ACEQUVUAJ/u150DPMj8p9N9TvQruzIthLoJ5AO/VJfsUGeMEQvZE5M2y/93h
	 A8GOgiSG/uygjQKkmK7qGhf5VWxigldZ9k7FI0glqs/3pHuu2+QUPdm+02GwGWZtoR
	 YD+KQAdnnrgXuJ4ZeZXanND1WdeMeNtW4LrUUtHvBl5boF97lDY9ObM5aAENAdWzV5
	 tABkBbZyowekQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39538822BD;
	Wed,  7 Jan 2026 17:48:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D51F25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30D2680A96
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nAuPXaHiv_Oy for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CC5480CCF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CC5480CCF
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BFE58225F; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:19:22 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2f7a2dcdd2377ebd7d37cfc1c907842e185c97a0
X-Git-Newrev: 86215951ee3b359375d9d8733ed62177ff674bbc
X-Patchwork-Hint: ignore
Message-Id: <20260107174644.4BFE58225F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/x11vnc: add CVE
 trailer in patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=86215951ee3b359375d9d8733ed62177ff674bbc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6244163284a05ae38a819abcb7b65e03b04102dd)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0002-scan-limit-access-to-shared-memory-segments-to-curre.patch      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-curre.patch b/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-curre.patch
index 05977375d8..015a8c4c41 100644
--- a/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-curre.patch
+++ b/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-curre.patch
@@ -3,6 +3,7 @@ From: =?UTF-8?q?Gu=C3=A9nal=20DAVALAN?= <guenal.davalan@uca.fr>
 Date: Wed, 18 Nov 2020 08:40:45 +0100
 Subject: [PATCH] scan: limit access to shared memory segments to current user
 
+CVE: CVE-2020-29074
 Upstream: https://github.com/LibVNC/x11vnc/commit/69eeb9f7baa14ca03b16c9de821f9876def7a36a
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
