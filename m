Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF04C61DD9
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26EEC81164;
	Fri, 28 Aug 2026 14:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BOcMT_B29CUN; Fri, 28 Aug 2026 14:26:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927163;
	bh=vwPU/lltQSfnGOKw1biEZiGIPkm7QZmMrl+NVcODI68=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sPT1CyC49hj7eOjsz/UCPVEMpeVaWtTT+NwoULYdH0xjDWPenVTKIoENGpv2oX5MW
	 +IIIiDdy/zg93y69cRazmdCeUcDS/X3KFxXKHOfX+zX6J/XG+lK/FqlcfCVyJ29Ref
	 3zwZUXhimXIl/vLb8BR8O3LgozNxgwLG9JNjpd0NvMYiEUl7x9OtvVYVZS0Xnshm6j
	 yOQ+hqdqow39zEEIELWkq44YqbuAYcgGU+rMgoKaHPhhAfMh0jWkqXYbIvgyp6lP9e
	 9vZmkq5IBUbrJX47HBgx7P3W3YwxUYIojk2aar4/vAxFgKbCfyqPWjOF7oRaVlrPVO
	 jrepBq9r/cQoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 218258116A;
	Fri, 28 Aug 2026 14:26:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 31C57127
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F81180F75
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id feRn9zRIP3_d for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CCF680F4E
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B377921FA; Fri, 28 Aug 2026 14:24:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:58:04 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: d16f8597fedd4fabc4e347fcab9cad4bcbce88d5
X-Git-Newrev: c1bfd5d5ab0a42572ec8e66ca28a04fb44195d3d
X-Patchwork-Hint: ignore
Message-Id: <20260828142442.4B377921FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x]
 package/distribution-registry: needs NPTL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c1bfd5d5ab0a42572ec8e66ca28a04fb44195d3d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

distribution-registry calls pthread_getattr_np() which is only available
with NPTL; i.e. always available with glibc (where it originates from,
since 2.2.3), always available with musl (which has had it since 0.9.10
in 2013), and only available when uClibc has NPTL (since 1.0.0 in 2015).

Fixes: https://autobuild.buildroot.org/results/9395500a8baee6c6142f96d7bc97e81725c2e754/

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d21a81ef8c2969d46fd3c569936f056dfb7d1abd)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/distribution-registry/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/distribution-registry/Config.in b/package/distribution-registry/Config.in
index af650171b1..3db2a8d906 100644
--- a/package/distribution-registry/Config.in
+++ b/package/distribution-registry/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DISTRIBUTION_REGISTRY
 	bool "distribution-registry"
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL  # pthread_*_np()
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
