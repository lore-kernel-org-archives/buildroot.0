Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D65AE8784C
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 17:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 993C26087F;
	Tue,  3 Feb 2026 17:28:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pmOtiWp4gAUt; Tue,  3 Feb 2026 17:28:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF24C60887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770139730;
	bh=MAYSCwaW8WpXOQ2ckBhg4qsXak4k5sXuaUGqsWo8YQg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=og3JPf4gLzlKysJnzSxZWnIQ+IzFcoIWlCo2gHlgtMX6tLs0q4UdskTmKJQYTO74G
	 6XZLwCeUolg+n1cttZK5c4hkAPsc1wjvRJ+UD4hkC52smmoy0zR13JOnCx4QBrH0Mf
	 e5hgamOJWIsyr+QVi6kWAEcwUrFxEWyAxUKPopCVhuN7AbgWtprZLMvevnd0xB4qL2
	 rcqktkeqEeeOyC4e9uTat6RFIPjBH4r2n9fgfdnUom/TNGMtAqvOba9jQnAiwipCdn
	 aWYaKPvvtl6Sgago63g5C40Nv6W0orDdO5m38oz64nA+v4oHMqM36bGZmz13/2suGf
	 8eH5pfcicVT2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF24C60887;
	Tue,  3 Feb 2026 17:28:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8843F13D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 17:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72A1540BE2
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 17:28:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U28BuEEIlWgq for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 17:28:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BB8640BDD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BB8640BDD
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 17:28:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80A38866FF; Tue,  3 Feb 2026 17:28:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 17:47:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb25a634c1cd779a62907a3a57515b46cf3c41a4
X-Git-Newrev: db1a28435d22b8dad391be6ee8c1af282bc72fde
X-Patchwork-Hint: ignore
Message-Id: <20260203172844.80A38866FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: explicitly enable llvm for
 host-mesa3d
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=db1a28435d22b8dad391be6ee8c1af282bc72fde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LLVM is already implicitly enabled for host-mesa3d when
BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER is selected. This blind
option is automatically enabled when LLVM is required by drivers such
as intel-iris, panfrost, imagination, or intel-vulkan.

The BR2_PACKAGE_MESA3D_LLVM option also independently selects host-llvm,
but this change makes the dependency more explicit for host-mesa3d
builds.

Note that disabling LLVM is not possible for host-mesa3d, as the build
will fail with:
../../../br-test-pkg/bootlin-armv5-uclibc/build/host-mesa3d-25.3.2/meson.build:847:3: ERROR: Feature llvm cannot be disabled: CLC requires LLVM

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/mesa3d/mesa3d.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 2468310413..db46d7bc7c 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -297,6 +297,7 @@ HOST_MESA3D_CONF_OPTS = \
 	-Dgallium-drivers=$(subst $(space),$(comma),$(HOST_MESA3D_GALLIUM_DRIVERS-y)) \
 	-Dtools=$(subst $(space),$(comma),$(HOST_MESA3D_TOOLS)) \
 	-Dinstall-mesa-clc=true \
+	-Dllvm=enabled \
 	-Dmesa-clc=enabled \
 	-Dplatforms= \
 	-Dprecomp-compiler=enabled \
@@ -306,6 +307,7 @@ HOST_MESA3D_CONF_OPTS = \
 HOST_MESA3D_DEPENDENCIES = \
 	host-libclc \
 	host-libdrm \
+	host-llvm \
 	host-python-mako \
 	host-python-pyyaml \
 	host-spirv-tools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
