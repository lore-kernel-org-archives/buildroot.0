Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0322DC55822
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 12:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7DA1605E3;
	Tue,  4 Aug 2026 12:48:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FgBZMyapRquh; Tue,  4 Aug 2026 12:48:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD029605FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785847724;
	bh=wAJog47YjKpdCzJxlZmtiGHH3QA0pWaGlIITTg7D0JQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K7LTTf4RqBTZpXU0RX/871T2qI6W77SeAvSIIbKQKQFzuEq0JvQcGIAqsP4J6JOnX
	 watWAarsfh6GBNi8typrGH7ChFXIcZBcGvbihw3uf/ZSHubxawOjIKKlXBlcQQPK22
	 AIcNL2KSvS9u3Vrvf+V5oGfboTYx/SAlhgu/MdNoOod37J7O007sYDkpgMK6FiOVgI
	 V7zTYzOZWEMQ4MDM3/Xx0M9TCLBPsqKTLeEPCgd3sZ7s+g2cwqBg4YXR+Rq5IhnjJx
	 PZ+ViRq08gxW75WpTqn7saTQmJx7IWLBY6wZ1XzclnuE4jfNfKshPMLozFJ08Jk8sh
	 BLjzQpGnMPDnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD029605FA;
	Tue,  4 Aug 2026 12:48:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FEAA2AA
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 12:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DF7080C69
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 12:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4EdRKHri2FEq for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 12:48:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 964AD8083E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 964AD8083E
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 12:48:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A4208B908; Tue,  4 Aug 2026 12:47:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Aug 2026 14:08:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c5f7741726d7bb72b71e7a83088032bdecb9d44
X-Git-Newrev: 2938f827f7eef628b4758cd19f699ca972661730
X-Patchwork-Hint: ignore
Message-Id: <20260804124756.6A4208B908@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Neal Frager for xen
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2938f827f7eef628b4758cd19f699ca972661730
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add Neal Frager for xen and qemu-xen packages.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a877140992..d8b1680c48 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2513,6 +2513,8 @@ F:	package/binutils-bare-metal/
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
