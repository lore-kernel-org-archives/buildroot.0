Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A0DCA0FF7
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 11:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6A71843BF;
	Fri, 29 Aug 2025 11:23:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BZIEnRud_OIT; Fri, 29 Aug 2025 11:23:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CEC2842C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CEC2842C8;
	Fri, 29 Aug 2025 11:23:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 34129D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 254BE41575
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pz9PksfR_pTK for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 11:23:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3F70B41559
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F70B41559
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F70B41559
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:23:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 610A24E40B4C;
 Fri, 29 Aug 2025 11:23:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3AFAB606B9;
 Fri, 29 Aug 2025 11:23:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 84E6B1C228095; 
 Fri, 29 Aug 2025 13:23:02 +0200 (CEST)
Date: Fri, 29 Aug 2025 13:23:01 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20250829132301.5d3aef44@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756466583; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=uSDY4sKuB3tZjTED1tpwxwBhMj6vDk1ek0VaZdC2sDU=;
 b=SnrHGXa7ihWFcym62j2iwQRyRROrTQEP2oACbwTh6K4bDBHAI7jqFaFHc+lfSlGvPGnSv0
 E9vaT/whKx61zRny0vpGG+hZk7BPDrBWX8230EjwPe0dLOGVYrC6aSZe8YSvle2ZNTiETS
 PR5vC2LnEIQppO+cG9gshWNiq/y3fjOK+WwutHNa4rgjveke8bIKEcldhu6yKHsoyntXUf
 9mxKu+klfj9aOYrf3pdGpEhiu45zyWJO2u7zmS65hfu1ZUF5GOoBmTttqVPiccVxr+9Vcc
 R9jc1Lr4DT6WWP4oqqMcAmD8EZNmtax0HROTkDI8EruWPqb/DGcj15TqFtefLw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=SnrHGXa7
Subject: [Buildroot] solarus build failure not detected in the autobuilders
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Romain,

Today I worked on updating OpenAL which is a dependency of Solarus, so
I tried to verify Solarus would still build with the updated OpenAL,
but Solarus doesn't build on current master.

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_SOLARUS=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_LUAJIT=y
# BR2_TARGET_ROOTFS_TAR is not set

fails with:

In file included from /home/thomas/projets/buildroot/output/build/solarus-1.6.5/src/graphics/sdlrenderer/SDLShader.cpp:32:
/home/thomas/projets/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/glm/gtx/transform.hpp:23:9: error: #error "GLM: GLM_GTX_transform is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
   23 | #       error "GLM: GLM_GTX_transform is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
      |         ^~~~~
In file included from /home/thomas/projets/buildroot/output/build/solarus-1.6.5/src/graphics/sdlrenderer/SDLShader.cpp:33:
/home/thomas/projets/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/glm/gtx/matrix_transform_2d.hpp:21:9: error: #error "GLM: GLM_GTX_matrix_transform_2d is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
   21 | #       error "GLM: GLM_GTX_matrix_transform_2d is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
      |         ^~~~~
[ 56%] Building CXX object CMakeFiles/solarus.dir/src/graphics/Surface.cpp.o
In file included from /home/thomas/projets/buildroot/output/build/solarus-1.6.5/src/graphics/Shader.cpp:30:
/home/thomas/projets/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/glm/gtx/transform.hpp:23:9: error: #error "GLM: GLM_GTX_transform is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
   23 | #       error "GLM: GLM_GTX_transform is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
      |         ^~~~~
In file included from /home/thomas/projets/buildroot/output/build/solarus-1.6.5/src/graphics/Shader.cpp:31:
/home/thomas/projets/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/glm/gtx/matrix_transform_2d.hpp:21:9: error: #error "GLM: GLM_GTX_matrix_transform_2d is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
   21 | #       error "GLM: GLM_GTX_matrix_transform_2d is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
      |         ^~~~~
make[3]: *** [CMakeFiles/solarus.dir/build.make:1476: CMakeFiles/solarus.dir/src/graphics/glrenderer/GlTexture.cpp.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[3]: *** [CMakeFiles/solarus.dir/build.make:1448: CMakeFiles/solarus.dir/src/graphics/glrenderer/GlRenderer.cpp.o] Error 1
make[3]: *** [CMakeFiles/solarus.dir/build.make:1462: CMakeFiles/solarus.dir/src/graphics/glrenderer/GlShader.cpp.o] Error 1
make[3]: *** [CMakeFiles/solarus.dir/build.make:1602: CMakeFiles/solarus.dir/src/graphics/Shader.cpp.o] Error 1
make[3]: *** [CMakeFiles/solarus.dir/build.make:1574: CMakeFiles/solarus.dir/src/graphics/sdlrenderer/SDLShader.cpp.o] Error 1
make[2]: *** [CMakeFiles/Makefile2:86: CMakeFiles/solarus.dir/all] Error 2
make[1]: *** [Makefile:136: all] Error 2
make[1]: Leaving directory '/home/thomas/projets/buildroot/output/build/solarus-1.6.5'
make: *** [package/pkg-generic.mk:273: /home/thomas/projets/buildroot/output/build/solarus-1.6.5/.stamp_built] Error 2

Could you have a look when you have some time?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
