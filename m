Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33F0C369BD
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 09:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21906812A4;
	Sat, 19 Apr 2025 09:05:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nSiTJDvw5itH; Sat, 19 Apr 2025 09:05:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64CA08174D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64CA08174D;
	Sat, 19 Apr 2025 09:05:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5281A22F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 09:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 384A260709
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 09:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TONMaRphlmzV for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 09:05:48 +0000 (UTC)
X-Greylist: delayed 458 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 19 Apr 2025 09:05:46 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 773CB60705
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 773CB60705
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=94.230.68.37;
 helo=mail-out-01.as48500.net; envelope-from=ciro04@incmail.it;
 receiver=<UNKNOWN> 
Received: from mail-out-01.as48500.net (smtp-out1.as48500.net [94.230.68.37])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 773CB60705
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 09:05:46 +0000 (UTC)
Received: from webmailng.irpinianetcom.it (inc-pub.as48500.net [94.230.68.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 (Authenticated sender: ciro04@incmail.it)
 by mail-out-01.as48500.net (Postfix) with ESMTPSA id 50C743E0599
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 10:57:46 +0200 (CEST)
MIME-Version: 1.0
Date: Sat, 19 Apr 2025 10:58:04 +0200
From: ciro04@incmail.it
To: buildroot@buildroot.org
Message-ID: <c7ad7f2c28141fcabce03e8b0712c114@incmail.it>
X-Sender: ciro04@incmail.it
User-Agent: Roundcube Webmail/1.3.8
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=incmail.it
Subject: [Buildroot] Buildroot 2024.11.3  and QT5-webkit
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi guys,
I'm new to buildroot and I'm currently using version 2024.11.3 on imx8mp 
platform (NXP starter kit).
I'm trying to compile QT5-webkit to integrate a simple HMI application.
But unfortunately qt5webkit 5.212.0-alpha4 does not link the opengles 
libraries:

/home/ciro/buildroot/buildroot-2024.11.3/output/host/lib/gcc/aarch64-buildroot-linux-gnu/13.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: 
CMakeFiles/WebCore.dir/platform/graphics/opengl/Extensions3DOpenGLES.cpp.o: 
in function `WebCore::Extensions3DOpenGLES::getExtensions()':
Extensions3DOpenGLES.cpp:(.text._ZN7WebCore20Extensions3DOpenGLES13getExtensionsEv+0x14): 
undefined reference to `glGetString

in the buildroot .config they are correctly set:

BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GLESV2=y
BR2_PACKAGE_GLMARK2_FLAVOR_WAYLAND_GLESV2=y
BR2_PACKAGE_GLMARK2_FLAVOR_X11_GLESV2=y
BR2_PACKAGE_PROVIDES_LIBGLES="mesa3d"
BR2_PACKAGE_HAS_LIBGLES=y

has anyone faced this problem?

Thanks in advance.
Ciro
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
