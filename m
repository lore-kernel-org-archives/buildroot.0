Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C20C5DF6D
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B405840525;
	Fri, 14 Aug 2026 13:21:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QFSJz8lzapxQ; Fri, 14 Aug 2026 13:21:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA9374059C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713691;
	bh=UUjqhm6+042GTXMn7pvlaNLAdjD0LyLWMsmi+55CXkE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JwvJ9puxC3P5QH2a5qfTIfiOrRNPY/cEk7N/aI/mZTI74zgrkLsKnkdP7cgtcf5wY
	 QJRNqlDJM9rpLPxR1Rm0C5ZuPNt/YmaBPrjWOhpPw/MSls+00dmpWuWu9ZGo1yhE00
	 nOgq7PhZ9dy1hTrw/MN+KqylJlnr7tPS9KqnO1jmu0+Cnh8lUtfmjyHY0nkbPFYsg0
	 pXKuhB863cS4pGPvbKwBs3nLDM8swqy6SkExb0ct4GsUgP3g11Xy/qrlyhCfhy/BgO
	 6rJbZIsrAHks3lgTaFqaCSkOwoUWY0Ms4d6vHhEza9JvnNlK2CQlHjqhUPdyEt2zqP
	 l4eAehKjIP2tQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA9374059C;
	Fri, 14 Aug 2026 13:21:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EDE523F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50F8080E3E
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VBEXpeKp1Q8e for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:21:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54D3E80E48
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54D3E80E48
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 589AE8D66D; Fri, 14 Aug 2026 13:20:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 16:03:38 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 72916929d5179fab4c19de0f6c070c036dfd5d16
X-Git-Newrev: 0b33e52c5749a946a8a04e86ba3ca039a410db51
X-Patchwork-Hint: ignore
Message-Id: <20260814132034.589AE8D66D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] DEVELOPERS: add Neal
 Frager for xen
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0b33e52c5749a946a8a04e86ba3ca039a410db51
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Add Neal Frager for xen and qemu-xen packages.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 2938f827f7eef628b4758cd19f699ca972661730)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 010ddf0fb9..953ff68388 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2495,6 +2495,8 @@ F:	package/binutils-bare-metal/
 F:	package/bootgen/
 F:	package/gcc-bare-metal/
 F:	package/newlib-bare-metal/
+F:	package/qemu-xen/
+F:	package/xen/
 F:	package/xilinx-fpgautil/
 F:	toolchain/toolchain-bare-metal-buildroot/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
