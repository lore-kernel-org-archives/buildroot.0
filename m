Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA480CD343F
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 20:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A89E0607D9;
	Mon, 18 May 2026 20:46:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fpnf2EhwVCSj; Mon, 18 May 2026 20:46:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E68DB607CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779137173;
	bh=/aWzFigzxugDGw7JbOsRwNDweVFfL+V8gmSlFWF8qMA=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=lpVaevp6E1aatvboXbtuw0bYCmxHuK/phwMUM2UBlnWFROM5/ken+n+PVXtnGhWey
	 5Ey4ytu89ZFy2otiKflQkFpyQxxE+NdiHSa/FMFZQAp9bZ74BWG78T/a5yTrA23mMI
	 zQjLmMMgxNMbvHDilFB245edEhqKDDXZF/PjaZlFSR/i8XBxqg9+3XoXc/XQmUiNz7
	 W4ClmHGMHc8Ssw9wd5XSRhBd2AmBH64yIDIHYIskrYv8d6SrsfkyFOQTZ9ixpgtGUL
	 zFSw5GcdjW2oiYIKo+jCeLZugHnOpgdOJ5uPKDK9m1DI9QHuKfNZBjoQvhA0GusJ4V
	 EGdVtXwT+RxhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E68DB607CF;
	Mon, 18 May 2026 20:46:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AB799282
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91792811F9
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:46:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ozxzjf0IhMtm for <buildroot@buildroot.org>;
 Mon, 18 May 2026 20:46:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6A3AC811F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A3AC811F7
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A3AC811F7
 for <buildroot@uclibc.org>; Mon, 18 May 2026 20:46:09 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1wP4qk-0003b6-La
 for buildroot@uclibc.org; Mon, 18 May 2026 22:46:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 18 May 2026 22:45:34 +0200
Message-ID: <pan$7b7e2$11f918fb$bc78faab$1070d19@ID-313208.user.individual.net>
References: <20260517085341.1338094-1-thomas.devoogdt__44574.7323495866$1779008053$gmane$org@barco.com>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH v1 1/2] package/mesa3d: add Gallium VA-API
 support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Sun, 17 May 2026 10:53:40 +0200 schrieb Thomas Devoogdt:

> Re-enable VA-API support as a new BR2_PACKAGE_MESA3D_GALLIUM_VA option,
> guarded by a dependency that prevents the circular case. This allows
> hardware video acceleration on AMD, Intel and other GPUs with Gallium
> drivers.

Hi Thomas,

it seems not all drivers support gallium-va:

output/build/mesa3d-26.1.0/meson.build:742:3: ERROR: Feature gallium-va 
cannot be enabled: VA state tracker requires at least one of the following 
gallium drivers: r600, radeonsi, nouveau, d3d12 (with option gallium-
d3d12-video), virgl.

Snippet of the configure options:

-Dmicrosoft-clc=disabled -Dllvm=enabled -Dcpp_rtti=true -Dgallium-
rusticl=false -Dglx=disabled -Dgallium-vc4-neon=disabled -Dgallium-
drivers=iris -Dgallium-extra-hud=true -Damdgpu-virtio=false -Dmesa-
clc=system -Dprecomp-compiler=system -Ddisplay-info=disabled -Dvulkan-
drivers= -Dopengl=true -Dgallium-va=enabled -Dvideo-codecs=all_free 
-Dplatforms= -Dgbm=enabled -Degl=enabled -Dgles1=enabled -Dgles2=enabled 
-Dvalgrind=enabled -Dlibunwind=disabled -Dlmsensors=enabled -Dzstd=enabled 
-Dglvnd=disabled

$ grep -s ^BR2_PACKAGE_MESA3D .config
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER=y
BR2_PACKAGE_MESA3D_LLVM=y
BR2_PACKAGE_MESA3D_OPENCL=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER=y
BR2_PACKAGE_MESA3D_DRIVER=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS=y
BR2_PACKAGE_MESA3D_GBM=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_MESA3D_GALLIUM_VA=y

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
