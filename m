Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E571AEF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B83BD4211D;
	Fri, 13 Feb 2026 19:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fMOBbdhm1QPD; Fri, 13 Feb 2026 19:38:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0FE742125
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011530;
	bh=J9G51iT0e09Bpck7gJUrfsDQ7slOvgx159riQs9B8q4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dIhfYDvb55NfsrzGVpp0ViT54pulVHqxopArAQCvtnV5RsTq3EclOeIY2HhBuzWwu
	 Aozw4tfJX2moGHzNlXDLzGsJBrKmXcGXbTnLRvSeguH0wpqAed3JZyCK3xIcn7LnDP
	 ajukJVYK9I576BuIRH+9sFF4CxzlPt0KoB/NU7AOBLva46QvJ+/Q2RIokOqvgULv2J
	 gD7MFmPmkdhziy4xt9epasjlpH9aC6KT9QeArijf3U4AmGvxd0cet1tcmcAmQ0gFSn
	 pcruC8jkc/k3aFFd12Q5e1++K82Vye4Iw9Mqlw5Kke4kjMV41cakPhawSiE/g4HDDm
	 HNOZSTVG5CtuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0FE742125;
	Fri, 13 Feb 2026 19:38:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC3DB69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACE85412A6
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T8v4TGgxdi-X for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23E15412A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23E15412A0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1972B83DBC; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 15:04:07 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: b261c641139439bad02a5d7f67f282db3e35df77
X-Git-Newrev: cec80fc0679121c63cd2935b13d21681569425dd
X-Patchwork-Hint: ignore
Message-Id: <20260213193704.1972B83DBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/mesa3d:
 explicitly enable llvm for host-mesa3d
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cec80fc0679121c63cd2935b13d21681569425dd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

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
(cherry picked from commit db1a28435d22b8dad391be6ee8c1af282bc72fde)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mesa3d/mesa3d.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 6bcaf226ae..b3fae9c0cf 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -298,6 +298,7 @@ HOST_MESA3D_CONF_OPTS = \
 	-Dgallium-vdpau=disabled \
 	-Dtools=$(subst $(space),$(comma),$(HOST_MESA3D_TOOLS)) \
 	-Dinstall-mesa-clc=true \
+	-Dllvm=enabled \
 	-Dmesa-clc=enabled \
 	-Dplatforms= \
 	-Dprecomp-compiler=enabled \
@@ -307,6 +308,7 @@ HOST_MESA3D_CONF_OPTS = \
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
