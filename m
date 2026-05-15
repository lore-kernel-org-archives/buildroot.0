Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFACCD8CA8
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21979856C5;
	Tue,  9 Jun 2026 13:02:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mscWQob0iHQU; Tue,  9 Jun 2026 13:02:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B41058562A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010119;
	bh=kxAQ4zrMYFUaJcPjxH0eEPtV7tp9tAfoJJyFNZFh36o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NbAl2RkIf7s80fGN7+7Cm4XyW4aDqG5d8PGSUETC355VkPHKCrCT9PSvTncf1Ji1q
	 reHXQQPLgxxEsDHMPLe4zcuZMavyVVGg4SfyyZI9MOZIbE4aYePiAPoQTJbCwjOCEA
	 KznE9kel3y+IEUJdYtwVWba2Yso5qKlnhyzqEDVMeeR9nBRCEeUy5b4d62GQK/+rBo
	 zcyMDILHBjLBFHRSCrC6t662NmoWIIRb7o0JZNJNKn66XqPbu6PTwHNN0ve7xO7NNJ
	 qiCVXCmT+kHDmTDtTpwFHz+jqz00ZK+1XuJ6zyjD+z/M2zQsyF2Rcf5pAKMtSssSvb
	 yzxiTj7xQ6baA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B41058562A;
	Tue,  9 Jun 2026 13:01:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 180DC196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8708426C6
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4iThRfyg16Xc for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2FC442552
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2FC442552
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A8F087E8D; Tue,  9 Jun 2026 13:01:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 13:06:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 30c34bdef32062f32e6afaff225c2f27e156fb57
X-Git-Newrev: a24698054b4cf6c994c91d49513bbe5e7b270201
X-Patchwork-Hint: ignore
Message-Id: <20260609130113.1A8F087E8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: make LLVM optional for
 radeonsi
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a24698054b4cf6c994c91d49513bbe5e7b270201
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since mesa3d v26.0 [0], the ACO compiler has been the default over LLVM.
This shader compiler backend has been used for even longer by the RADV
vulkan driver.

Let's make LLVM optional.

Users who wish to continue using LLVM must enable support in Mesa, and
override the default ACO compiler at runtime using an env var. [1]

Users who only want to use the default compiler backend may disable LLVM
support, and save a lot of time during the build.

[0] https://gitlab.freedesktop.org/mesa/mesa/-/commit/e26c28f311cc5416f6c7f5b09a53ca2b14dfb955
[1] https://docs.mesa3d.org/envvars.html#envvar-AMD_DEBUG

Signed-off-by: Joseph Kogut <joseph@anodize.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/mesa3d/Config.in | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 66ebe04394..8cdb548fb6 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -252,17 +252,24 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
 	bool "Gallium Radeon SI driver"
 	depends on BR2_USE_MMU # libdrm
 	depends on BR2_i386 || BR2_x86_64
-	depends on BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_AMDGPU
 	select BR2_PACKAGE_LIBDRM_RADEON
-	select BR2_PACKAGE_LLVM_AMDGPU
+	select BR2_PACKAGE_LLVM_AMDGPU if BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS
 	select BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
 	help
 	  Driver for ATI/AMD Radeon HD7000/HD8000/Rx200 GPUs.
 
+	  Since Mesa 26.0.0, the default shader compiler is ACO,
+	  even when LLVM support is enabled at build time.
+
+	  Use the env var AMD_DEBUG=usellvm to override the
+	  default and use LLVM at runtime.
+
+	  https://docs.mesa3d.org/envvars.html#envvar-AMD_DEBUG
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
 	bool "Gallium vmware svga driver"
 	depends on BR2_i386 || BR2_x86_64
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
