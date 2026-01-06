Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57D9D0D155
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84AF7413D7;
	Wed,  7 Jan 2026 18:02:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ggsq32KcY03s; Wed,  7 Jan 2026 18:02:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 284C4413E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808941;
	bh=1FMkCvauN6ybfIRe+zp21I/32MUg9j18maC9XbvbaZE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GOw1ITdaRT3D6vvVU4NDXM/Rv+MvgBTC4Crn5O+D4+jb5io0EckQ0ov3MsVFTlWC+
	 8F60yMMoHzw9zfeWfalKC7uPbvAOBpSUzey+cFUuHA2pLa/IHj0hfGEtuzihJAXd2Y
	 fNS62eEfeV8lhhOv9NVRfD4hQQuLGqjRzePZjpI9lLcwy1K0WkAufc6kSVYrq4k804
	 hbC3ftZbgkSu+sLCwwsCYGoxLtc6DNS8MiDu30W+il7gtLrzCSRL/VD9TSNgtcnOKL
	 QsyzRt5p8XUNAxVECTkJ2gcn6if9CRCstu3vsa4SI4hreOwPFUzbO2CO9webJwPsdE
	 1mwMJTqf1mobA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 284C4413E1;
	Wed,  7 Jan 2026 18:02:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D26E25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2F2B40B7C
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jHz5cFQF77ez for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D64A040A4E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D64A040A4E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4D3683B69; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:54:13 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 836753465c116d242a88a7f41caeb9da44d52369
X-Git-Newrev: 3d23d0a30a72182e3dee95cb9075736330c6cbed
X-Patchwork-Hint: ignore
Message-Id: <20260107180112.D4D3683B69@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/skopeo: needs NPTL
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d23d0a30a72182e3dee95cb9075736330c6cbed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

So far, skopeo inherited the thread dependency from its runtime
dependencies. However, skopeo uses pthread_getattr_np(3), which
is only available with NPTL on uClibc. glibc and musl have had
it for ages (and only implement NPTL anyway).

Fixes: https://autobuild.buildroot.org/results/b9d123986c2a65427bfca32ee3ea792a988e6890/

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit dab0feeae84ad8d1e4a52621b2606dab2ede0cad)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/skopeo/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/skopeo/Config.in b/package/skopeo/Config.in
index 0de9b16047..b0229873d4 100644
--- a/package/skopeo/Config.in
+++ b/package/skopeo/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_SKOPEO
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_USE_MMU  # btrfs-progs, libgpgme, lvm2
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # libgpgme
-	depends on BR2_TOOLCHAIN_HAS_THREADS  # btrfs-progs, lvm2
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS  # lvm2
 	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_BTRFS_PROGS
@@ -17,10 +17,10 @@ config BR2_PACKAGE_SKOPEO
 
 	  https://github.com/containers/skopeo
 
-comment "skopeo needs a toolchain w/ threads, sahred libs"
+comment "skopeo needs a toolchain w/ NPTL, sahred libs"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS \
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
