Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635D7D2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3767860D68;
	Tue, 13 Jan 2026 19:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-3ujA6rL0Fa; Tue, 13 Jan 2026 19:37:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70E7660BD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333027;
	bh=MLOQ/7sMBmtOCotB+ASrrroZBKJfRocFIVQGmT13RuE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g/74PiNwzoEOYMPFDqxePoJEYx47oSeCWgxX4kI92OlAxrOR25hGp1N0hBuafg4Bm
	 Omfe94UfKYFRktusSyiCNZrGSryk4MY/LA2uyw9UaevZjq/xJCtFH+EjGFrxs9KHKQ
	 b8QvZ5LLkCLuyslBfYNDz+8/1C8krb6vwoYvc7ZgHiljsWQkT0BVTCwrsEeUlsriAL
	 oqtDSuFy9PVBITIb0oqK0M9bFCN9IJGQ5jk+23Il8fI7GEcQ8ULF1Gx3IivVPiO3rP
	 JZarXTb4aLTj/EM1kAsr6uxGBiaVcK/BdRJkGPt+SlG2f1l1u5ZkSNKNkFYM0HIbDF
	 7uRd7v5i8lPmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70E7660BD0;
	Tue, 13 Jan 2026 19:37:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11A422CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99FC082C38
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PdMjdNIYlkUJ for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CA8882C5E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CA8882C5E
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BB7F86E71; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 17:04:47 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9ec0fee664187cd7e6dcb17f4016a5ce32f437c6
X-Git-Newrev: 07cd241056ae36caf5f83a4937b8c720dbc4ae0f
X-Patchwork-Hint: ignore
Message-Id: <20260113193619.7BB7F86E71@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/spice: propagate
 libglib2 BR2_USE_MMU dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=07cd241056ae36caf5f83a4937b8c720dbc4ae0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

spice selects libglib2, but forgot to propagate the BR2_USE_MMU
dependency. There is no practical implication at the moment as spice
is only available for i386 and x86-64, and both always have MMU. But
as we're about to relax this architecture dependency, it makes sense
to fix the propagation of BR2_USE_MMU.

Signed-off-by: Julien Olivain <ju.o@free.fr>
[Thomas: patch extracted from
https://patchwork.ozlabs.org/project/buildroot/patch/20241122213809.176709-1-ju.o@free.fr/]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ec45430d19ed1ab1aa39e9bd534f3d3d992888bd)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/spice/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/spice/Config.in b/package/spice/Config.in
index ca5c562ca1..468097cea1 100644
--- a/package/spice/Config.in
+++ b/package/spice/Config.in
@@ -1,11 +1,13 @@
 comment "spice server needs a toolchain w/ wchar, threads, C++"
 	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_SPICE
 	bool "spice server"
 	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_USE_MMU # libglib2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
