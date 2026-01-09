Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFEBD2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1843D40B6F;
	Tue, 13 Jan 2026 19:41:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JwlOqKNZt6B4; Tue, 13 Jan 2026 19:41:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A43B40B4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333298;
	bh=AXyC/d4ePkrFj3gR3NjmvTbL2R0aG/nttkgtE3G5Wz8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UrjZPUIO+Uh5gblR27rqt2e5vAWfB9aW6bFLsBPNdHCATUHESqEq8gZIyH4AsMotL
	 iCwCe31i8cBj4Ht8NkqU8W+Xim7+Q3COiThghgfwT1X8Tu3/aE3VaueLs5qd2YYGwh
	 2kw9tSdejemCMojZ7cdeYOMMPMdK05FNKAxE++BNIAtKjboHi2IAnLPt+UVX3Qz49M
	 JN++WY/w7pO+p7eaT9qxMO7qPuI61l4otTOM62HN2A264h6EokNWRiPAUtaoJjPFVL
	 zbhUpAPzOxgBh/sTGPyrdr9cXGGDQVZHKSLKE2Qh8EkgunlQ8D8DcQL06QgNQNlcSF
	 Ht2YvCoWidfdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A43B40B4E;
	Tue, 13 Jan 2026 19:41:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 101881C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E14A783126
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b-Oyu-cz-TGp for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBD5482CA5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBD5482CA5
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9B3282271; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 18:22:27 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: a160539c5f24d88424201cc8905143b40184bfc7
X-Git-Newrev: 311a9a8d89220348bf0a56eeeb3be22662072f2d
X-Patchwork-Hint: ignore
Message-Id: <20260113194034.D9B3282271@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x]
 package/mender-update-modules: fix kernel header dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=311a9a8d89220348bf0a56eeeb3be22662072f2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Commit f933a165e2ee2ee775c7fa0824d2bfcfa9545f88 ("package/podman:
raise kernel header requirement to v4.14") raised the kernel headers
dependency of podman from 3.17 to 4.14, but forgot to propagate this
change to the mender-update-modules podman option, causing the
following kconfig warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PODMAN
  Depends on [n]: BR2_USE_MMU [=y] && BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS [=y] && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=y] && BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS [=y] && BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS [=y] && BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 [=n] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_WCHAR [=y]
  Selected by [y]:
  - BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN [=y] && BR2_PACKAGE_MENDER_UPDATE_MODULES [=y] && BR2_USE_MMU [=y] && BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS [=y] && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=y] && BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS [=y] && BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS [=y] && BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_WCHAR [=y]

Fix this by properly propagating the dependency.

Fixes: f933a165e2ee2ee775c7fa0824d2bfcfa9545f88 ("package/podman: raise kernel header requirement to v4.14")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0cead19ec2fcba0bbd56f9849ca2161537d3c9b0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mender-update-modules/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index e71309c3d6..1158bb42b2 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -132,7 +132,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS  # podman
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # podman
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS  # podman
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17  # podman
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14  # podman
 	depends on BR2_TOOLCHAIN_HAS_THREADS  # podman
 	depends on BR2_USE_WCHAR  # podman
 	select BR2_PACKAGE_JQ # runtime
@@ -150,13 +150,13 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN
 
 	  https://github.com/mendersoftware/mender-update-modules/tree/master/podman
 
-comment "podman support needs a toolchain w/ headers >= 3.17, threads, wchar"
+comment "podman support needs a toolchain w/ headers >= 4.14, threads, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 \
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_USE_WCHAR
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
