Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11579606A31E
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 12:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qXIZ1wMT;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=NCCrBHgk
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E660960802;
	Tue, 24 Nov 2026 12:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MsTI9NPGEHU9; Tue, 24 Nov 2026 12:05:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F112A60825
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795521907;
	b=BU0dZnpOoVzmU350tfdP1v0OweOoSl/BZz7B8jpHpv8eRkfxwZveUQ9eyYnnMgu67Ftk
	 jDMo+qzYDI5O00rTekrpkhkAEiSseKFqT9TxB9kxMv9Nc8baICveMXxGkfgri00nQ4NXg
	 Fj+F/Gpk6wLAzpcxbdwriSYJQ/Rkd7ypp6KFCEOr42MGGz5vrJus/1ecq1m6VC0+YowSg
	 KB5NJxG39d9FWy71FMzaubb2ASIlsE7dhOwwovC8stqe3MKCJrhuhbIM1xX0EC2dP6P4g
	 YU1XDIiSkpc7QBQxitZAjf41ejbCmUwj4qNanLrDGbozqfUVsenjLq7cAVQ5ulVdz1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795521907;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=/6hZ0/yrPfilc3cr8LmyIcv7JlBVQjw0npZ43hH0Z7I=;
	b=BTwIi8w5xpzZU0xFfC0m+Z10DD9hxDg5YFBG6JGJ2K+bGpyvCuiHySxV8JemrMaTiZf2
	 Acqp5WaftUfdqkvjQM1d7P5vfdEulDp5oTM5R7aNJ2iao4IoZpk4BeqRoPx3HckDiV34N
	 ytseu0uenYEkuRm9MBTCii+0fX0zo3mzcmnVgH+HM8S8fEfSsWxAhw70etLwx5Qvz2kOQ
	 bJTFEat5QXMZdmA0m3WV1J72XTZIPDMYx65w14TLfHg2tHjFSfn09ic3lWYNRxyrLhHxY
	 2y63PcnYa8fiTj+/8WVE72YrF49HmyxT50E4pPDqCdyesaqsSXwnZhN2Eeeho5rwvhQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=NCCrBHgk;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795521907;
	bh=/6hZ0/yrPfilc3cr8LmyIcv7JlBVQjw0npZ43hH0Z7I=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qXIZ1wMTBflQgnkIT0rnC6Sqr95aiL2C45hESOCnvyNZ5DjwaMgviKH22UVcZ5Q/e
	 dA+Yudg9HGyVqn8hJdsuXUk6X2Ttj1j/6Ye9nwv5EJF0mNdbUkBwLicY9D9hN0I43U
	 tvwxQ8cYes6Rg0sF69hHR/Nb3EdKZawMljRTVPIZrC9g7qHLtn8Tf+J1xFFCEczrpV
	 MyPOCU8gy/k/W422GkiDD+Ea1Yg3dI5VYgL3sG5tHIjN6vF+5Lk3+Ouzjon8OVO7xE
	 JIgcxGN/MrUlrVmQ4fFkpnVtZEIBQyDd1l/3nXb8ONJ36ic120TqltlDYi3Av1fx/Q
	 h2/Tv+hiuJpMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F112A60825;
	Tue, 24 Nov 2026 12:05:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A56B371
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 12:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4726D6082B
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 12:04:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AXSL58INzp5i for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 12:04:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D0711607C7
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=NCCrBHgk
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0711607C7
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 12:04:52 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-c50686daf9cso75632066b.0
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 04:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795521890; x=1796126690;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LckBmvPJZUt8eOl5pjvmcCJNiJGSFIzeU2fkztIONAM=;
 b=NCCrBHgkGVbPUlzEUVb/luYQqs7a/iTekyQTyGNS2e5fqgYVqG4VT39R0+vW1Sd0aV
 0ARBf9y0em6tPH1vgZ/DilYzbBlNkc2I1u89f2TEVB/csuitt5khC+uXIH6XVUJ8A94Z
 qMUgjZq4QiRn32YAA2Gp36qFgzgYs6E/mWiYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795521890; x=1796126690;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=LckBmvPJZUt8eOl5pjvmcCJNiJGSFIzeU2fkztIONAM=;
 b=roL6g5BiiTdVpX4+jc22mZz/9pdHBIDiH0QyxP0W9eF3hMhSicyjJifybZDbHnCTi4
 vBTbdrvb8bgX1mbeGZkvM4TtNpZYgy2JCoy0MeM0zpihA/E7xBvDuthZ3q4gDyZGj4QW
 yFFW20UnU5XLZUUNA5Oui/4B3oxqkgXu5nJwLYvEwz7lqviBM6spbse2pOLdKyPsWSnw
 Cot6NOuQNhh6aoKOxVYlNs0ioYs1dVRMVb4zem4x6Vg/7nG6OAzqA2FwdP1G+qg+kXLp
 GQyn9EcwlCGIFjkycXR+KvrFi5D0HRUN0cJ/B/zOVieUJg5hcrHdHzlucXQWdgy5akkf
 i7OQ==
X-Gm-Message-State: APuU4Z+0QZQ6CGb27YcnkGxdTPqEg6ep79L1XoIgEKPmICXMkIxjYG+a
 Sf7hqHzlj2yVWK9Ty3q4yUh/J99h1w3LUxJyAb9z6acstENpSk0ilUolZfjr7xq/rROD6Mv0dOo
 RksEmHGU=
X-Gm-Gg: AZFdTZd/k2H8GDVqfDA6BVg0iPbh45JpO55y3e9ilmceHnB4nmZyzeBgf1veon4uBLA
 IwOYoRC58JELYps8M9nRDeoGxN4RvwKekhC2SxrRVKjguhWK6PzMrN2t8t6ytU/BgGAl9wWswZR
 gBRQQMrBHAkrSeW90tEZ0uGR/Ksbv18TShXCCYm6oC7wIhVKy4G65UPGI2hTZUDNAZlakcFKJFM
 t4wWQsa8vDfr0vvajsiiHVxq0+xGvvM7HYkkcGYUT+TnbtmNW4sIqHhvVkAvSe8jmHiZmkb27ug
 Hz2HKBqn0jm3zDTt6I3mddPdFIZ8N4ytQuQUlegCKVnCE/QDxiuPx4vIxS6Qke+a7OdSd6Ap6Pb
 SdsWIPXnBWmb5Rfz0xWZXUh9e6q4idTDDa8xRISwxjYDovrHxzA9iG7bzhC496FuCY0WAIUIHBO
 ZqHj2heOoLcjSNJgVepNevA7N8zVCNfLbW5aBTQTgdLAblA7Uk+gSKT8+rnN2g22/OYUTpRjHkU
 7vaxxKCiOdhmJQOkOuwHGCkYI4P7ubUmkIpTGTFBevS7/+40aDj/iPuEM+244G7ZS/E4VondMIT
 bFibnWl1lD2XdHABRCcmYfnFqXQ70QDSU/uhB33eTBey+hj8xOudyk6i4OT2hsfw+1KTozSFz/P
 vrkPvH/QVU867j3ZlVj6Pcmg3vyj9WFrQaZ0slp8HMhKH2idu1kKP8z9xuAN1BO92nh6m8/M01c
 8776IwCslxmCselaZ2mttGsKwdEgvr6ggBi43dfcGtuul8Y+ws4r3X2AV78D3j9DW62J1YNhgyn
 NjUxsio4QDeq4tvpsS17g==
X-Received: by 2002:a17:906:cedc:b0:c51:269e:5c7b with SMTP id
 a640c23a62f3a-c513a85b344mr1157355466b.4.1795521890235; 
 Tue, 24 Nov 2026 04:04:50 -0800 (PST)
Received: from adam-linux.amarulasolutions.com
 (2001-1c00-8181-e800-dc0e-c162-ac5f-4bbe.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:dc0e:c162:ac5f:4bbe])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513ae67bd3sm499466766b.27.2026.11.24.04.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 04:04:49 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Claude Opus 5.5" <noreply@anthropic.com>
Date: Tue, 24 Nov 2026 13:04:42 +0100
Message-ID: <20261124120443.1909297-8-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124120443.1909297-1-adam.duskett@amarulasolutions.com>
References: <20261124120443.1909297-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 8/9] package/ivi-homescreen: bump to version
 950f7a5a
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This switches from the v1.0 branch to the v3.0 branch, which is now the
default upstream branch and a rewrite of the embedder:

- The plugins were moved out of tree to a separate `ivi-homescreen-plugins`
  repository. Build with DISABLE_PLUGINS=ON for now, and add legacy
  entries for the removed plugin options. Functionality such as text
  input, logging, mouse cursor and platform views is now part of the
  core embedder.

- The Dart VM logging option was removed upstream.

- Third-party dependencies are now git submodules, so enable
  IVI_HOMESCREEN_GIT_SUBMODULES and update the license files.

- The Wayland bindings are generated at build time by
  wayland-cxx-scanner, a bundled submodule that must be available as a
  host tool when cross-compiling. Build it from the bundled sources in
  a pre-configure hook, so that the generator always matches the
  header-only framework the embedder is built against. It needs
  host-pugixml, and a host gcc >= 9, as it uses std::filesystem
  without linking with -lstdc++fs.

- The Wayland EGL backend is now always built, hence the package now
  requires EGL and OpenGL ES. The Wayland Vulkan backend is built when
  vulkan-loader is available. The backend is selected at runtime. Both
  backends need libdrm, and libgbm is used when available.

- Add options for the agl-shell and simple-shell clients, and for the
  xdg-shell client, which is enabled by default as before.

- Add a choice for the Wayland text input protocol, which must match
  the one supported by the compositor.

- Build the internal libraries statically with BUILD_SHARED_LIBS=OFF,
  as upstream intends: they are linked into the homescreen binary, and
  building them shared creates a CMake dependency cycle once plugins
  are enabled. libihs_shared is explicitly a shared library and is
  unaffected.

- wayland-utils is no longer needed.

- The ihs_shared library is now built and installed alongside the
  homescreen binary, so install to staging as well.

- Drop 0001-add-missing-headers-to-the-audio-players-and-keyboar.patch,
  as the plugins it patched are no longer in this repository.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
---
 Config.in.legacy                              | 227 +++++++++++++++
 ...ers-to-the-audio-players-and-keyboar.patch | 104 -------
 package/ivi-homescreen/Config.in              | 262 ++++--------------
 package/ivi-homescreen/ivi-homescreen.hash    |  18 +-
 package/ivi-homescreen/ivi-homescreen.mk      | 185 ++++++-------
 5 files changed, 389 insertions(+), 407 deletions(-)
 delete mode 100644 package/ivi-homescreen/0001-add-missing-headers-to-the-audio-players-and-keyboar.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index 9f15bbd4ce..d941d62b5e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,233 @@ endif
 
 comment "Legacy options removed in 2027.02"
 
+config BR2_PACKAGE_IVI_HOMESCREEN_DART_VM_LOGGING
+	bool "ivi-homescreen Dart VM logging removed"
+	select BR2_LEGACY
+	help
+	  The Dart VM logging option was removed from ivi-homescreen
+	  3.0.
+
+config BR2_PACKAGE_IVI_HOMESCREEN_ACCESSIBILITY_PLUGIN
+	bool "ivi-homescreen Accessibility plugin removed"
+	select BR2_LEGACY
+	help
+	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
+	  moved to the separate ivi-homescreen-plugins repository,
+	  which is not supported yet. Built-in functionality such as
+	  text input, logging, mouse cursor and platform views is now
+	  part of the core embedder.
+
+config BR2_PACKAGE_IVI_HOMESCREEN_COMP_REGION_PLUGIN
+	bool "ivi-homescreen Compositor Region plugin removed"
+	select BR2_LEGACY
+	help
+	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
+	  moved to the separate ivi-homescreen-plugins repository,
+	  which is not supported yet. Built-in functionality such as
+	  text input, logging, mouse cursor and platform views is now
+	  part of the core embedder.
+
+config BR2_PACKAGE_IVI_HOMESCREEN_COMP_SURF_PLUGIN
+	bool "ivi-homescreen Compositor Surface plugin removed"
+	select BR2_LEGACY
+	help
+	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
+	  moved to the separate ivi-homescreen-plugins repository,
+	  which is not supported yet. Built-in functionality such as
+	  text input, logging, mouse cursor and platform views is now
+	  part of the core embedder.
+
+config BR2_PACKAGE_IVI_HOMESCREEN_DESKTOP_WINDOW_PLUGIN
+	bool "ivi-homescreen Desktop Window plugin removed"
+	select BR2_LEGACY
+	help
+	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
+	  moved to the separate ivi-homescreen-plugins repository,
+	  which is not supported yet. Built-in functionality such as
+	  text input, logging, mouse cursor and platform views is now
+	  part of the core embedder.
+
+config BR2_PACKAGE_IVI_HOMESCREEN_GO_ROUTER_PLUGIN
+	bool "ivi-homescreen Go Router plugin removed"
+	select BR2_LEGACY
+	help
+	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
+	  moved to the separate ivi-homescreen-plugins repository,
+	  which is not supported yet. Built-in functionality such as
+	  text input, logging, mouse cursor and platform views is now
+	  part of the core embedder.
+
+config BR2_PACKAGE_IVI_HOMESCREEN_INTEGRATION_TEST_PLUGIN
+	bool "ivi-homescreen Integration Test plugin removed"
+	select BR2_LEGACY
+	help
+	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
+	  moved to the separate ivi-homescreen-plugins repository,
+	  which is not supported yet. Built-in functionality such as
+	  text input, logging, mouse cursor and platform views is now
+	  part of the core embedder.
+
+config BR2_PACKAGE_IVI_HOMESCREEN_ISOLATE_PLUGIN
+	bool "ivi-homescreen Isolate plugin removed"
+	select BR2_LEGACY
+	help
+	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
+	  moved to the separate ivi-homescreen-plugins repository,
+	  which is not supported yet. Built-in functionality such as
+	  text input, logging, mouse cursor and platform views is now
+	  part of the core embedder.
+
+config BR2_PACKAGE_IVI_HOMESCREEN_KEYBOARD_MANAGER_PLUGIN
+	bool "ivi-homescreen Keyboard Manager plugin removed"
+	select BR2_LEGACY
+	help
+	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
+	  moved to the separate ivi-homescreen-plugins repository,
+	  which is not supported yet. Built-in functionality such as
+	  text input, logging, mouse cursor and platform views is now
+	  part of the core embedder.
+
+config BR2_PACKAGE_IVI_HOMESCREEN_KEY_EVENT_PLUGIN
+	bool "ivi-homescreen Key Event plugin removed"
+	select BR2_LEGACY
+	help
+	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
+	  moved to the separate ivi-homescreen-plugins repository,
+	  which is not supported yet. Built-in functionality such as
+	  text input, logging, mouse cursor and platform views is now
+	  part of the core embedder.
+
+config BR2_PACKAGE_IVI_HOMESCREEN_LAYER_PLAYGROUND_PLUGIN
+	bool "ivi-homescreen Layer Playground plugin removed"
+	select BR2_LEGACY
+	help
+	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
+	  moved to the separate ivi-homescreen-plugins repository,
+	  which is not supported yet. Built-in functionality such as
+	  text input, logging, mouse cursor and platform views is now
+	  part of the core embedder.
+
+config BR2_PACKAGE_IVI_HOMESCREEN_LOGGING_PLUGIN
+	bool "ivi-homescreen Logging plugin removed"
+	select BR2_LEGACY
+	help
+	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
+	  moved to the separate ivi-homescreen-plugins repository,
+	  which is not supported yet. Built-in functionality such as
+	  text input, logging, mouse cursor and platform views is now
+	  part of the core embedder.
+
+config BR2_PACKAGE_IVI_HOMESCREEN_MOUSE_CURSOR_PLUGIN
+	bool "ivi-homescreen Mouse Cursor plugin removed"
+	select BR2_LEGACY
+	help
+	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
+	  moved to the separate ivi-homescreen-plugins repository,
+	  which is not supported yet. Built-in functionality such as
+	  text input, logging, mouse cursor and platform views is now
+	  part of the core embedder.
+
+config BR2_PACKAGE_IVI_HOMESCREEN_PACKAGE_INFO_PLUGIN
+	bool "ivi-homescreen PackageInfo plugin removed"
+	select BR2_LEGACY
+	help
+	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
+	  moved to the separate ivi-homescreen-plugins repository,
+	  which is not supported yet. Built-in functionality such as
+	  text input, logging, mouse cursor and platform views is now
+	  part of the core embedder.
+
+config BR2_PACKAGE_IVI_HOMESCREEN_PLATFORM_PLUGIN
+	bool "ivi-homescreen Platform plugin removed"
+	select BR2_LEGACY
+	help
+	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
+	  moved to the separate ivi-homescreen-plugins repository,
+	  which is not supported yet. Built-in functionality such as
+	  text input, logging, mouse cursor and platform views is now
+	  part of the core embedder.
+
+config BR2_PACKAGE_IVI_HOMESCREEN_PLATFORM_VIEWS_PLUGIN
+	bool "ivi-homescreen Platform Views plugin removed"
+	select BR2_LEGACY
+	help
+	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
+	  moved to the separate ivi-homescreen-plugins repository,
+	  which is not supported yet. Built-in functionality such as
+	  text input, logging, mouse cursor and platform views is now
+	  part of the core embedder.
+
+config BR2_PACKAGE_IVI_HOMESCREEN_RESTORATION_PLUGIN
+	bool "ivi-homescreen Restoration plugin removed"
+	select BR2_LEGACY
+	help
+	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
+	  moved to the separate ivi-homescreen-plugins repository,
+	  which is not supported yet. Built-in functionality such as
+	  text input, logging, mouse cursor and platform views is now
+	  part of the core embedder.
+
+config BR2_PACKAGE_IVI_HOMESCREEN_TEXT_INPUT_PLUGIN
+	bool "ivi-homescreen Text Input plugin removed"
+	select BR2_LEGACY
+	help
+	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
+	  moved to the separate ivi-homescreen-plugins repository,
+	  which is not supported yet. Built-in functionality such as
+	  text input, logging, mouse cursor and platform views is now
+	  part of the core embedder.
+
+config BR2_PACKAGE_IVI_HOMESCREEN_AUDIO_PLAYERS
+	bool "ivi-homescreen Audio Players plugin removed"
+	select BR2_LEGACY
+	help
+	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
+	  moved to the separate ivi-homescreen-plugins repository,
+	  which is not supported yet. Built-in functionality such as
+	  text input, logging, mouse cursor and platform views is now
+	  part of the core embedder.
+
+config BR2_PACKAGE_IVI_HOMESCREEN_FLUTTER_SECURE_STORAGE_PLUGIN
+	bool "ivi-homescreen Flutter Secure Storage plugin removed"
+	select BR2_LEGACY
+	help
+	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
+	  moved to the separate ivi-homescreen-plugins repository,
+	  which is not supported yet. Built-in functionality such as
+	  text input, logging, mouse cursor and platform views is now
+	  part of the core embedder.
+
+config BR2_PACKAGE_IVI_HOMESCREEN_GOOGLE_SIGN_IN_PLUGIN
+	bool "ivi-homescreen Google Sign In plugin removed"
+	select BR2_LEGACY
+	help
+	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
+	  moved to the separate ivi-homescreen-plugins repository,
+	  which is not supported yet. Built-in functionality such as
+	  text input, logging, mouse cursor and platform views is now
+	  part of the core embedder.
+
+config BR2_PACKAGE_IVI_HOMESCREEN_GSTREAMER_EGL_PLUGIN
+	bool "ivi-homescreen GStreamer EGL plugin removed"
+	select BR2_LEGACY
+	help
+	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
+	  moved to the separate ivi-homescreen-plugins repository,
+	  which is not supported yet. Built-in functionality such as
+	  text input, logging, mouse cursor and platform views is now
+	  part of the core embedder.
+
+config BR2_PACKAGE_IVI_HOMESCREEN_OPENGL_TEXTURE_PLUGIN
+	bool "ivi-homescreen OpenGL Texture plugin removed"
+	select BR2_LEGACY
+	help
+	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
+	  moved to the separate ivi-homescreen-plugins repository,
+	  which is not supported yet. Built-in functionality such as
+	  text input, logging, mouse cursor and platform views is now
+	  part of the core embedder.
+
 config BR2_PACKAGE_FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE
 	bool "flutter adaptive scaffold example has been removed"
 	select BR2_LEGACY
diff --git a/package/ivi-homescreen/0001-add-missing-headers-to-the-audio-players-and-keyboar.patch b/package/ivi-homescreen/0001-add-missing-headers-to-the-audio-players-and-keyboar.patch
deleted file mode 100644
index 0d308b786b..0000000000
--- a/package/ivi-homescreen/0001-add-missing-headers-to-the-audio-players-and-keyboar.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-From 7e35ea4fbd94a1604907069bb9cc2e2dff4b43c7 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <adam.duskett@amarulasolutions.com>
-Date: Sat, 6 Jan 2024 14:18:56 -0700
-Subject: [PATCH] add missing headers to the audio-players and keyboard_manager
- plugin
-
-Fixes flutter::StandardMethodCodec not being declared on the following lines:
-plugins/audio_players/audio_players_registry.cc:83
-plugins/audio_players/audio_players_registry.cc:94
-plugins/audio_players/audio_players_registry.cc:152
-plugins/audio_players/audio_player.cc:257
-plugins/audio_players/audio_player.cc:623
-plugins/keyboard_manager/keyboard_manager.cc:25
-
-Upstream: https://github.com/toyota-connected/ivi-homescreen/pull/133
-
-Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
----
- shell/plugins/audio_players/audio_player.cc           | 3 ++-
- shell/plugins/audio_players/audio_players.cc          | 4 +++-
- shell/plugins/audio_players/audio_players_registry.cc | 3 ++-
- shell/plugins/keyboard_manager/keyboard_manager.h     | 3 ++-
- 4 files changed, 9 insertions(+), 4 deletions(-)
-
-diff --git a/shell/plugins/audio_players/audio_player.cc b/shell/plugins/audio_players/audio_player.cc
-index 56027eb..a85e9ae 100644
---- a/shell/plugins/audio_players/audio_player.cc
-+++ b/shell/plugins/audio_players/audio_player.cc
-@@ -20,6 +20,7 @@
- #include <map>
- #include <sstream>
- 
-+#include <flutter/standard_method_codec.h>
- #include <flutter/standard_message_codec.h>
- 
- #include <gst/audio/audio.h>
-@@ -639,4 +640,4 @@ void AudioPlayer::OnPlatformMessage(const FlutterPlatformMessage* message,
-   engine->SendPlatformMessageResponse(message->response_handle, result->data(),
-                                       result->size());
- }
--}  // namespace Plugins
-\ No newline at end of file
-+}  // namespace Plugins
-diff --git a/shell/plugins/audio_players/audio_players.cc b/shell/plugins/audio_players/audio_players.cc
-index 0605576..4290f5a 100644
---- a/shell/plugins/audio_players/audio_players.cc
-+++ b/shell/plugins/audio_players/audio_players.cc
-@@ -19,6 +19,8 @@
- #include <memory>
- #include <vector>
- 
-+#include <flutter/standard_method_codec.h>
-+
- #include "audio_player.h"
- #include "audio_players_registry.h"
- #include "engine.h"
-@@ -314,4 +316,4 @@ void AudioPlayers::OnPlatformMessage(const FlutterPlatformMessage* message,
-               : "Unknown AudioPlayersLinux error");
-   }
- }
--}
-\ No newline at end of file
-+}
-diff --git a/shell/plugins/audio_players/audio_players_registry.cc b/shell/plugins/audio_players/audio_players_registry.cc
-index 6c9ef33..00c4f45 100644
---- a/shell/plugins/audio_players/audio_players_registry.cc
-+++ b/shell/plugins/audio_players/audio_players_registry.cc
-@@ -19,6 +19,7 @@
- #include <memory>
- #include <mutex>
- 
-+#include <flutter/standard_method_codec.h>
- #include <flutter/standard_message_codec.h>
- 
- #include "audio_player.h"
-@@ -168,4 +169,4 @@ void AudioPlayersRegistry::OnPlatformMessageEvents(
-   engine->SendPlatformMessageResponse(message->response_handle, result->data(),
-                                       result->size());
- }
--}  // namespace Plugins
-\ No newline at end of file
-+}  // namespace Plugins
-diff --git a/shell/plugins/keyboard_manager/keyboard_manager.h b/shell/plugins/keyboard_manager/keyboard_manager.h
-index 74b4e8d..cae1954 100644
---- a/shell/plugins/keyboard_manager/keyboard_manager.h
-+++ b/shell/plugins/keyboard_manager/keyboard_manager.h
-@@ -17,6 +17,7 @@
- #pragma once
- 
- #include "flutter/fml/macros.h"
-+#include <flutter/standard_method_codec.h>
- 
- #include <shell/platform/embedder/embedder.h>
- 
-@@ -45,4 +46,4 @@ class KeyboardManager {
- 
-  private:
-   static constexpr char kGetKeyboardState[] = "getKeyboardState";
--};
-\ No newline at end of file
-+};
--- 
-2.43.0
-
diff --git a/package/ivi-homescreen/Config.in b/package/ivi-homescreen/Config.in
index d7cc4ce04e..ecdc15a3f0 100644
--- a/package/ivi-homescreen/Config.in
+++ b/package/ivi-homescreen/Config.in
@@ -2,270 +2,128 @@ menuconfig BR2_PACKAGE_IVI_HOMESCREEN
 	bool "ivi-homescreen"
 	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
-	depends on BR2_HOST_GCC_AT_LEAST_5 # flutter-engine
+	depends on BR2_HOST_GCC_AT_LEAST_9 # flutter-engine, wayland-cxx-scanner
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17 filesystem
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # flutter-engine
 	depends on BR2_TOOLCHAIN_USES_GLIBC # flutter-engine
 	depends on BR2_INSTALL_LIBSTDCPP # flutter-engine
 	depends on !BR2_STATIC_LIBS # flutter-engine, wayland
 	depends on BR2_USE_WCHAR # flutter-engine
-	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES # flutter-engine
+	depends on BR2_PACKAGE_HAS_LIBEGL # Wayland EGL backend
+	depends on BR2_PACKAGE_HAS_LIBGLES # flutter-engine, Wayland EGL backend
 	select BR2_PACKAGE_HOST_FLUTTER_SDK_BIN
 	select BR2_PACKAGE_FLUTTER_ENGINE
+	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBXKBCOMMON
 	select BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
-	select BR2_PACKAGE_WAYLAND_UTILS
 	help
 	  Toyota's Flutter Embedder that communicates with Wayland
 	  compositors.
 	  Features:
 	  - Strongly Typed (C++)
 	  - Lightweight
-	  - Platform Channels enabled/disabled via CMake
-	  - OpenGL Texture Framework
-	  - Compositor Sub-surface/Region support
 	  - Vulkan / EGL backend support
 
+	  The Wayland EGL backend is always built, and the Wayland
+	  Vulkan backend is also built when vulkan-loader is enabled.
+	  The backend is chosen at runtime.
+
 	  https://github.com/toyota-connected/ivi-homescreen
 
 if BR2_PACKAGE_IVI_HOMESCREEN
 
-config BR2_PACKAGE_IVI_HOMESCREEN_IVI_SHELL_CLIENT
-	bool "ivi-shell client"
-
-comment "Logging"
-config BR2_PACKAGE_IVI_HOMESCREEN_DART_VM_LOGGING
-	bool "Enable Dart VM Logging"
-
-config BR2_PACKAGE_IVI_HOMESCREEN_DLT_LOGGING
-	bool "DLT logging"
-
-comment "EGL options"
-
-config BR2_PACKAGE_IVI_HOMESCREEN_EGL_TRANSPARENCY
-	bool "Transparency"
-	depends on BR2_PACKAGE_HAS_LIBEGL
-
-comment "Transparency support needs an EGL backend"
-	depends on !BR2_PACKAGE_HAS_LIBEGL
-
-config BR2_PACKAGE_IVI_HOMESCREEN_EGL_ENABLE_3D
-	bool "3D support"
-	depends on BR2_PACKAGE_HAS_LIBEGL
-	help
-	  Build with EGL Stencil, Depth, and Stencil
-
-comment "3D support needs an EGL backend"
-	depends on !BR2_PACKAGE_HAS_LIBEGL
-
-config BR2_PACKAGE_IVI_HOMESCREEN_EGL_MULTISAMPLE
-	bool "Multisample support"
-	depends on BR2_PACKAGE_HAS_LIBEGL
-	help
-	  Build with EGL Sample set to 4
-
-comment "Multisample support needs an EGL backend"
-	depends on !BR2_PACKAGE_HAS_LIBEGL
-
-comment "dependency-less plugins"
-
-config BR2_PACKAGE_IVI_HOMESCREEN_ACCESSIBILITY_PLUGIN
-	bool "Accessibility"
-
-config BR2_PACKAGE_IVI_HOMESCREEN_COMP_REGION_PLUGIN
-	bool "Compositor Region"
-
-config BR2_PACKAGE_IVI_HOMESCREEN_COMP_SURF_PLUGIN
-	bool "Compositor Surface"
-
-config BR2_PACKAGE_IVI_HOMESCREEN_DESKTOP_WINDOW_PLUGIN
-	bool "Desktop Window"
-	help
-	  Flutter plugin to change window size.
-
-	  https://pub.dev/packages/desktop_window
-
-config BR2_PACKAGE_IVI_HOMESCREEN_GO_ROUTER_PLUGIN
-	bool "Go Router"
-	help
-	  A declarative routing package for Flutter that uses the
-	  Router API to provide a convenient, url-based API for
-	  navigating between different screens. You can define URL
-	  patterns, navigate using a URL, handle deep links, and a
-	  number of other navigation-related scenarios.
-
-	  https://pub.dev/packages/go_router
-
-config BR2_PACKAGE_IVI_HOMESCREEN_INTEGRATION_TEST_PLUGIN
-	bool "Flutter Integration Test support"
-	help
-	  https://docs.flutter.dev/cookbook/testing/integration/introduction
-
-config BR2_PACKAGE_IVI_HOMESCREEN_ISOLATE_PLUGIN
-	bool "Isolate"
-
-config BR2_PACKAGE_IVI_HOMESCREEN_KEYBOARD_MANAGER_PLUGIN
-	bool "Keyboard Manager"
-	select BR2_PACKAGE_IVI_HOMESCREEN_TEXT_INPUT_PLUGIN # runtime
-	help
-	  This is a wrapper for the raw keyboard listener made to
-	  simplify intercept external keyboard button press.
-
-	  https://pub.dev/packages/keyboard_manager
-
-config BR2_PACKAGE_IVI_HOMESCREEN_KEY_EVENT_PLUGIN
-	bool "Key Event"
-	select BR2_PACKAGE_IVI_HOMESCREEN_TEXT_INPUT_PLUGIN # runtime
-	help
-	  KeyEvent plugin to support RawKeyEvent.
+comment "Wayland shell clients"
 
-config BR2_PACKAGE_IVI_HOMESCREEN_LAYER_PLAYGROUND_PLUGIN
-	bool "Layer Playground"
-	select BR2_PACKAGE_IVI_HOMESCREEN_PLATFORM_VIEWS_PLUGIN
+config BR2_PACKAGE_IVI_HOMESCREEN_XDG_SHELL_CLIENT
+	bool "xdg-shell client"
+	default y
 	help
-	  This plugin enables the platform views plugin and also
-	  provides a simple-box-view-type option.
-
-	  https://github.com/toyota-connected/ivi-homescreen/tree/main/shell/plugins/platform_views
-
-config BR2_PACKAGE_IVI_HOMESCREEN_LOGGING_PLUGIN
-	bool "Logging"
+	  Support the xdg-shell protocol, used by most desktop
+	  compositors.
 
-config BR2_PACKAGE_IVI_HOMESCREEN_MOUSE_CURSOR_PLUGIN
-	bool "Mouse Cursor"
+config BR2_PACKAGE_IVI_HOMESCREEN_AGL_SHELL_CLIENT
+	bool "agl-shell client"
 	help
-	  Add mouse cursor support.
+	  Support the agl-shell protocol, used by agl-compositor.
 
-config BR2_PACKAGE_IVI_HOMESCREEN_PACKAGE_INFO_PLUGIN
-	bool "PackageInfo"
+config BR2_PACKAGE_IVI_HOMESCREEN_IVI_SHELL_CLIENT
+	bool "ivi-shell client"
 	help
-	  Prints the ivi-homescreen package information.
+	  Support the ivi-shell protocol, used by weston's ivi-shell.
 
-config BR2_PACKAGE_IVI_HOMESCREEN_PLATFORM_PLUGIN
-	bool "Platform"
+config BR2_PACKAGE_IVI_HOMESCREEN_SIMPLE_SHELL_CLIENT
+	bool "simple-shell client"
 	help
-	  Get information about the platform the Flutter application
-	  is running on.
+	  Support the RDK/Westeros simple_shell protocol.
 
-config BR2_PACKAGE_IVI_HOMESCREEN_PLATFORM_VIEWS_PLUGIN
-	bool "Platform Views"
+choice
+	prompt "Text input protocol"
+	default BR2_PACKAGE_IVI_HOMESCREEN_IME_TEXT_INPUT_V3
 	help
-	  This plugin supports the AndroidView interface. Meaning you
-	  can take any Platform View Dart code, change the definition
-	  to use AndroidView, and you will have a working interface.
+	  The Wayland protocol used for text input. This must match
+	  what the compositor supports, or text input will not work.
+	  GNOME/Mutter and KDE use text-input-v3, AGL and weston use
+	  text-input-v1.
 
-	  Benefits of using this interface:
-	    - pre-defined interface that is supported in Flutter SDK
-	    - params are easily augmented in Dart to add for given use
-	      case
-	    - pass touch to another process/library without additional
-	      work
+config BR2_PACKAGE_IVI_HOMESCREEN_IME_TEXT_INPUT_V3
+	bool "text-input-v3"
 
-	  For a backing implementation there are a number of approaches:
-	    - Have a PlatformView implementation render to a Texture
-	    - Compositor Region support
-	      (poke a hole for another process)
-	    - Compositor sub-surface and manage Z-order
+config BR2_PACKAGE_IVI_HOMESCREEN_IME_TEXT_INPUT_V1
+	bool "text-input-v1"
 
-	  The above is already supported today using either an OpenGL
-	  texture, or a Compositor Sub-Surface. Using Platform Views
-	  just re-uses an existing interface.
+config BR2_PACKAGE_IVI_HOMESCREEN_IME_INPUT_METHOD_V1
+	bool "input-method-v1"
 
-	  https://github.com/toyota-connected/ivi-homescreen/tree/main/shell/plugins/platform_views
+config BR2_PACKAGE_IVI_HOMESCREEN_IME_INPUT_METHOD_V2
+	bool "input-method-v2"
 
-config BR2_PACKAGE_IVI_HOMESCREEN_RESTORATION_PLUGIN
-	bool "Restoration"
-	help
-	  Handles the Flutter restoration callback
+config BR2_PACKAGE_IVI_HOMESCREEN_IME_VIRTUAL_KEYBOARD_V1
+	bool "virtual-keyboard-v1"
 
-config BR2_PACKAGE_IVI_HOMESCREEN_TEXT_INPUT_PLUGIN
-	bool "Text Input"
-	help
-	  Allow for text input
+config BR2_PACKAGE_IVI_HOMESCREEN_IME_NONE
+	bool "none"
 
-comment "plugins with external dependencies"
-config BR2_PACKAGE_IVI_HOMESCREEN_AUDIO_PLAYERS
-	bool "Audio Players"
-	depends on BR2_USE_MMU # gstreamer1
-	select BR2_PACKAGE_GSTREAMER1
-	select BR2_PACKAGE_GST1_PLUGINS_BASE
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOCONVERT
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
-	help
-	  A Flutter plugin to play multiple simultaneously audio files.
-	  Based on audioplayers-v5.2.1
+endchoice
 
-	  https://pub.dev/packages/audioplayers
+comment "Logging"
 
-config BR2_PACKAGE_IVI_HOMESCREEN_FLUTTER_SECURE_STORAGE_PLUGIN
-	bool "Flutter Secure Storage"
-	depends on BR2_USE_MMU # libsecret
-	select BR2_PACKAGE_LIBSECRET
+config BR2_PACKAGE_IVI_HOMESCREEN_DLT_LOGGING
+	bool "DLT logging"
 	help
-	  Store data in secure storage
+	  Add a DLT logging sink. libdlt is loaded at runtime.
 
-	  https://pub.dev/packages/flutter_secure_storage
-
-config BR2_PACKAGE_IVI_HOMESCREEN_GOOGLE_SIGN_IN_PLUGIN
-	bool "Google Sign In manager"
-	select BR2_PACKAGE_LIBCURL
-	select BR2_PACKAGE_LIBCURL_FORCE_TLS
-	select BR2_PACKAGE_OPENSSL
-	help
-	  This static plugin is to support this pub.dev package:
-	  https://pub.dev/packages/google_sign_in
+comment "EGL options"
 
-	  https://github.com/toyota-connected/ivi-homescreen/tree/main/shell/plugins/google_sign_in
+config BR2_PACKAGE_IVI_HOMESCREEN_EGL_TRANSPARENCY
+	bool "Transparency"
 
-config BR2_PACKAGE_IVI_HOMESCREEN_GSTREAMER_EGL_PLUGIN
-	bool "GStreamer EGL"
-	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HAS_LIBEGL
-	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API # GST1_PLUGINS_BASE_LIB_OPENGL_EGL
-	select BR2_PACKAGE_FFMPEG
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL
+config BR2_PACKAGE_IVI_HOMESCREEN_EGL_ENABLE_3D
+	bool "3D support"
 	help
-	  A GStreamer-powered alternative to Flutter's video_player that
-	  support Linux, iOS and Android.
-
-	  https://pub.dev/packages/flutter_gstreamer_player
-
-comment "GStreamer plugin needs gst1-plugins-base with an EGL backend"
-	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
-	depends on !BR2_PACKAGE_HAS_LIBEGL \
-		|| !BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API
+	  Build with EGL Stencil, Depth, and Stencil
 
-config BR2_PACKAGE_IVI_HOMESCREEN_OPENGL_TEXTURE_PLUGIN
-	bool "OpenGL Texture"
-	depends on BR2_PACKAGE_HAS_LIBEGL
+config BR2_PACKAGE_IVI_HOMESCREEN_EGL_MULTISAMPLE
+	bool "Multisample support"
 	help
-	  A Flutter OpenGL ES plugin using a Texture() widget.
-	  Many shaders from ShaderToy.com can be copy/pasted
-
-	  https://pub.dev/packages/flutter_opengl
-
-comment "OpenGL texture plugin needs an EGL backend"
-	depends on !BR2_PACKAGE_HAS_LIBEGL
+	  Default --msaa-samples to 4 instead of 0
 
 endif # BR2_PACKAGE_IVI_HOMESCREEN
 
-comment "ivi-homescreen needs a glibc toolchain w/ wchar, C++, gcc >= 8, dynamic library, host gcc >= 5"
+comment "ivi-homescreen needs a glibc toolchain w/ wchar, C++, gcc >= 8, dynamic library, host gcc >= 9"
 	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_USES_GLIBC \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_8 \
 		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
-		|| !BR2_HOST_GCC_AT_LEAST_5
+		|| !BR2_HOST_GCC_AT_LEAST_9
 
 comment "ivi-homescreen needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
-comment "ivi-homescreen needs an OpenGL or OpenGLES backend"
+comment "ivi-homescreen needs an EGL and OpenGL ES backend"
 	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
-	depends on !BR2_PACKAGE_HAS_LIBGL && !BR2_PACKAGE_HAS_LIBGLES
+	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES
diff --git a/package/ivi-homescreen/ivi-homescreen.hash b/package/ivi-homescreen/ivi-homescreen.hash
index 484ecfb128..c4b8a1d990 100644
--- a/package/ivi-homescreen/ivi-homescreen.hash
+++ b/package/ivi-homescreen/ivi-homescreen.hash
@@ -1,21 +1,23 @@
 # Locally calculated
-sha256  aba31437dd90eca1fc5723619c269394e475b3000309eda86efcfd252452a85e  ivi-homescreen-a038ce00031ed5a9a89b4d8dd7dbde5e3d7ade6e-git4.tar.gz
+sha256  0d35e23a9f13cf4a8e37d9dd7c8fc40001e7dc2f6026180d988160fd34ff7821  ivi-homescreen-950f7a5aeed1bfc1112c9757ed8588a9fc46124c-git4.tar.gz
 
 # Apache-2.0
 sha256  6b96fa0a3def85caaf466caa2bd82d4ca4f22d106ff88f97a00c537c00cc714b  LICENSE
-sha256  943c358cb6d086e4bc0937941b8f8d766db7d4e5f06583efd45dca0ca6a645f3  third_party/filament/libs/bluevk/include/bluevk/BlueVK.h
+sha256  95ad366d23fadf701d355bc45fb8b82ae2d700239471d35d41286ac3b08ff903  third_party/Vulkan-Headers/LICENSE.md
 
 # BSD-3-Clause
-sha256  fdff25c8a4147791114584a45d56621336d294601da77656e83504a71747c8c2  third_party/flutter/shell/platform/common/client_wrapper/core_implementations.cc
+sha256  41d4f7cdb38ad3b0096d1c1444f559538d9f24b5dab48e8f326e51b4c3d5b7dd  third_party/flutter/shell/platform/common/client_wrapper/core_implementations.cc
 
 # BSD-Style
-sha256  baa98cbcc03e3e745c4ad9ac2d3fb3464424486b2e420081181013034a7e6406  third_party/flutter/third_party/dart/runtime/include/dart_api.h
+sha256  d5009bb2dfa76dcdf3ed3c5bd427a74c4c820cea29f393a5909efa377291f713  third_party/flutter/third_party/dart/runtime/include/dart_api.h
 
 # BSL-1.0
-sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  third_party/asio-1-28-1/asio/LICENSE_1_0.txt
+sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  third_party/asio/LICENSE_1_0.txt
 
 # MIT
-sha256  240f786071b64c28c0a1dae3e3b05fc3ca93fa4882b1e36e56ee49fee3037b0a  third_party/flutter/third_party/rapidjson/include/rapidjson/rapidjson.h
+sha256  aa324fbe633a96546bebca975fbbab65caa175894bd00cfa13d7335e7363400c  third_party/cxxopts/LICENSE
+sha256  07580f2a3b35709ce703d523f447b242f6dfec7582a8c0df102c7fa2849375f8  third_party/fmt/LICENSE
+sha256  a140e5d46fe734a1c78f1a3c3ef207871dd75648be71fdda8e309b23ab8b1f32  third_party/rapidjson/license.txt
 sha256  4b67e7ae8c91e68e1a929eb1cbaa4c773c6d19aa91aaa12c390cf9560d1c9799  third_party/sanitizers-cmake/LICENSE
-sha256  a7241a379cb98d37788f82c2fc2e484c3ae85dae881fd3406f0637644850926f  third_party/spdlog-1.12.0/LICENSE
-sha256  8b79f17fa7cf47adeeb8277965267e3932155fdfcab81a0ed5d583438bdf9135  third_party/weston/protocol/ivi-application.xml
+sha256  529bc3900a9571e49db285b0df432397e70b881cc3bf48de6667ae74ff4b06d8  third_party/tomlplusplus/LICENSE
+sha256  97a1fb2cb59395d5131de386c963e7846fbb92b334c0468ffefdc8bb817d6400  third_party/wayland-cxx-scanner/LICENSE
diff --git a/package/ivi-homescreen/ivi-homescreen.mk b/package/ivi-homescreen/ivi-homescreen.mk
index 525fb4e11b..7fa971a404 100644
--- a/package/ivi-homescreen/ivi-homescreen.mk
+++ b/package/ivi-homescreen/ivi-homescreen.mk
@@ -4,133 +4,132 @@
 #
 ################################################################################
 
-IVI_HOMESCREEN_VERSION = a038ce00031ed5a9a89b4d8dd7dbde5e3d7ade6e
+IVI_HOMESCREEN_VERSION = 950f7a5aeed1bfc1112c9757ed8588a9fc46124c
 IVI_HOMESCREEN_SITE = https://github.com/toyota-connected/ivi-homescreen.git
 IVI_HOMESCREEN_SITE_METHOD = git
+IVI_HOMESCREEN_GIT_SUBMODULES = YES
 IVI_HOMESCREEN_LICENSE = Apache-2.0, BSD-3-Clause, BSD-Style, BSL-1.0, MIT
+IVI_HOMESCREEN_INSTALL_STAGING = YES
 
 # Keep order as listed in ivi-homescreen.hash
 IVI_HOMESCREEN_LICENSE_FILES = \
 	LICENSE \
-	third_party/filament/libs/bluevk/include/bluevk/BlueVK.h \
+	third_party/Vulkan-Headers/LICENSE.md \
 	third_party/flutter/shell/platform/common/client_wrapper/core_implementations.cc \
 	third_party/flutter/third_party/dart/runtime/include/dart_api.h \
-	third_party/asio-1-28-1/asio/LICENSE_1_0.txt \
-	third_party/flutter/third_party/rapidjson/include/rapidjson/rapidjson.h \
+	third_party/asio/LICENSE_1_0.txt \
+	third_party/cxxopts/LICENSE \
+	third_party/fmt/LICENSE \
+	third_party/rapidjson/license.txt \
 	third_party/sanitizers-cmake/LICENSE \
-	third_party/spdlog-1.12.0/LICENSE \
-	third_party/weston/protocol/ivi-application.xml
+	third_party/tomlplusplus/LICENSE \
+	third_party/wayland-cxx-scanner/LICENSE
 
 IVI_HOMESCREEN_DEPENDENCIES = \
 	host-flutter-sdk-bin \
+	host-pugixml \
 	flutter-engine \
+	libdrm \
 	libxkbcommon \
 	wayland \
-	wayland-protocols \
-	wayland-utils
+	wayland-protocols
+
+# The Wayland C++ bindings are generated at build time by
+# wayland-cxx-scanner, which is bundled as a submodule. When cross
+# compiling, the scanner must be provided as a host tool, so build it
+# from the bundled sources to guarantee it matches the header-only
+# framework the embedder is compiled against.
+IVI_HOMESCREEN_HOST_SCANNER_BUILDDIR = $(@D)/host-wayland-cxx-scanner
+
+define IVI_HOMESCREEN_BUILD_HOST_WAYLAND_CXX_SCANNER
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(BR2_CMAKE) \
+		-S $(@D)/third_party/wayland-cxx-scanner \
+		-B $(IVI_HOMESCREEN_HOST_SCANNER_BUILDDIR) \
+		-DCMAKE_BUILD_TYPE=Release \
+		-DCMAKE_PREFIX_PATH=$(HOST_DIR) \
+		-DWAYLAND_CXX_SCANNER_TOOL_ONLY=ON
+	$(HOST_MAKE_ENV) $(BR2_CMAKE) \
+		--build $(IVI_HOMESCREEN_HOST_SCANNER_BUILDDIR) \
+		-j$(PARALLEL_JOBS)
+endef
+IVI_HOMESCREEN_PRE_CONFIGURE_HOOKS += IVI_HOMESCREEN_BUILD_HOST_WAYLAND_CXX_SCANNER
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_IME_TEXT_INPUT_V1),y)
+IVI_HOMESCREEN_IME_BACKEND = text-input-v1
+else ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_IME_INPUT_METHOD_V1),y)
+IVI_HOMESCREEN_IME_BACKEND = input-method-v1
+else ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_IME_INPUT_METHOD_V2),y)
+IVI_HOMESCREEN_IME_BACKEND = input-method-v2
+else ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_IME_VIRTUAL_KEYBOARD_V1),y)
+IVI_HOMESCREEN_IME_BACKEND = virtual-keyboard-v1
+else ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_IME_NONE),y)
+IVI_HOMESCREEN_IME_BACKEND = none
+else
+IVI_HOMESCREEN_IME_BACKEND = text-input-v3
+endif
 
+# The internal libraries are meant to be linked statically into the
+# homescreen binary (ihs_shared is explicitly a shared library). Building
+# them shared creates a dependency cycle when plugins are enabled.
 IVI_HOMESCREEN_CONF_OPTS = \
+	-DBUILD_SHARED_LIBS=OFF \
+	-DBUILD_ACCESSIBILITY=OFF \
+	-DBUILD_BACKEND_DRM_KMS_EGL=OFF \
+	-DBUILD_BACKEND_DRM_KMS_VULKAN=OFF \
+	-DBUILD_BACKEND_HEADLESS_EGL=OFF \
+	-DBUILD_BACKEND_HEADLESS_VULKAN=OFF \
+	-DBUILD_BACKEND_SOFTWARE=OFF \
+	-DBUILD_BACKEND_WAYLAND_LEASED_DRM=OFF \
+	-DBUILD_COMPOSITOR=OFF \
 	-DBUILD_CRASH_HANDLER=OFF \
-	-DBUILD_PLUGIN_FILE_SELECTOR=OFF \
-	-DBUILD_PLUGIN_FIREBASE_CORE=OFF \
-	-DBUILD_PLUGIN_URL_LAUNCHER=OFF \
-	-DBUILD_TEXTURE_NAVI_RENDER_EGL=OFF \
-	-DBUILD_TEXTURE_TEST_EGL=OFF \
+	-DBUILD_DOCS=OFF \
+	-DBUILD_FUZZERS=OFF \
+	-DBUILD_INTEGRATION_TESTS=OFF \
+	-DBUILD_MCP=OFF \
 	-DBUILD_UNIT_TESTS=OFF \
-	-DENABLE_AGL_CLIENT=OFF \
-	-DENABLE_XDG_CLIENT=ON \
-	-DENABLE_IVI_SHELL_CLIENT=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_IVI_SHELL_CLIENT),ON,OFF)
+	-DBUILD_WATCHDOG=OFF \
+	-DDISABLE_PLUGINS=ON \
+	-DENABLE_OSGI=OFF \
+	-DENABLE_STATIC_LINK=OFF \
+	-DWAYLAND_CXX_IME_BACKEND=$(IVI_HOMESCREEN_IME_BACKEND) \
+	-DWAYLAND_CXX_SCANNER_EXECUTABLE=$(IVI_HOMESCREEN_HOST_SCANNER_BUILDDIR)/src/wayland-cxx-scanner
+
+# Wayland shell clients
+IVI_HOMESCREEN_CONF_OPTS += \
+	-DENABLE_AGL_SHELL_CLIENT=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_AGL_SHELL_CLIENT),ON,OFF) \
+	-DENABLE_IVI_SHELL_CLIENT=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_IVI_SHELL_CLIENT),ON,OFF) \
+	-DENABLE_SIMPLE_SHELL_CLIENT=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_SIMPLE_SHELL_CLIENT),ON,OFF) \
+	-DENABLE_XDG_CLIENT=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_XDG_SHELL_CLIENT),ON,OFF)
 
 # Logging
 IVI_HOMESCREEN_CONF_OPTS += \
-	-DENABLE_DART_VM_LOGGING=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_DART_VM_LOGGING),ON,OFF) \
 	-DENABLE_DLT=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_DLT_LOGGING),ON,OFF)
 
-# EGL
+ifeq ($(BR2_ENABLE_LTO),y)
+IVI_HOMESCREEN_CONF_OPTS += -DENABLE_LTO=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DENABLE_LTO=OFF
+endif
+
+# Wayland EGL backend
+IVI_HOMESCREEN_DEPENDENCIES += libegl libgles
 IVI_HOMESCREEN_CONF_OPTS += \
+	-DBUILD_BACKEND_WAYLAND_EGL=ON \
 	-DBUILD_EGL_TRANSPARENCY=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_EGL_TRANSPARENCY),ON,OFF) \
 	-DBUILD_EGL_ENABLE_3D=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_EGL_ENABLE_3D),ON,OFF) \
 	-DBUILD_EGL_ENABLE_MULTISAMPLE=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_EGL_MULTISAMPLE),ON,OFF)
-
-# dependency-less plugins
-IVI_HOMESCREEN_CONF_OPTS += \
-	-DBUILD_PLUGIN_ACCESSIBILITY=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_ACCESSIBILITY_PLUGIN),ON,OFF) \
-	-DBUILD_PLUGIN_COMP_REGION=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_COMP_REGION_PLUGIN),ON,OFF) \
-	-DBUILD_PLUGIN_COMP_SURF=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_COMP_SURF_PLUGIN),ON,OFF) \
-	-DBUILD_PLUGIN_DESKTOP_WINDOW=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_DESKTOP_WINDOW_PLUGIN),ON,OFF) \
-	-DBUILD_PLUGIN_GO_ROUTER=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_GO_ROUTER_PLUGIN),ON,OFF) \
-	-DBUILD_PLUGIN_INTEGRATION_TEST=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_INTEGRATION_TEST_PLUGIN),ON,OFF) \
-	-DBUILD_PLUGIN_ISOLATE=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_ISOLATE_PLUGIN),ON,OFF) \
-	-DBUILD_PLUGIN_KEYBOARD_MANAGER=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_KEYBOARD_MANAGER_PLUGIN),ON,OFF) \
-	-DBUILD_PLUGIN_KEY_EVENT=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_KEY_EVENT_PLUGIN),ON,OFF) \
-	-DBUILD_PLUGIN_LAYER_PLAYGROUND=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_LAYER_PLAYGROUND_PLUGIN),ON,OFF) \
-	-DBUILD_PLUGIN_LOGGING=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_LOGGING_PLUGIN),ON,OFF) \
-	-DBUILD_PLUGIN_MOUSE_CURSOR=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_MOUSE_CURSOR_PLUGIN),ON,OFF) \
-	-DBUILD_PLUGIN_PACKAGE_INFO=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_PACKAGE_INFO_PLUGIN),ON,OFF) \
-	-DBUILD_PLUGIN_PLATFORM=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_PLATFORM_PLUGIN),ON,OFF) \
-	-DBUILD_PLUGIN_PLATFORM_VIEWS=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_PLATFORM_VIEWS_PLUGIN),ON,OFF) \
-	-DBUILD_PLUGIN_RESTORATION=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_RESTORATION_PLUGIN),ON,OFF) \
-	-DBUILD_PLUGIN_TEXT_INPUT=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_TEXT_INPUT_PLUGIN),ON,OFF)
-
-# Wayland backend options
-ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
-IVI_HOMESCREEN_DEPENDENCIES += libegl
-IVI_HOMESCREEN_CONF_OPTS += -DBUILD_BACKEND_WAYLAND_EGL=ON
-else
-IVI_HOMESCREEN_CONF_OPTS += -DBUILD_BACKEND_WAYLAND_EGL=OFF
+# libgbm is optional: without it, platform views fall back to GL
+# texture export.
+ifeq ($(BR2_PACKAGE_HAS_LIBGBM),y)
+IVI_HOMESCREEN_DEPENDENCIES += libgbm
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),y)
-IVI_HOMESCREEN_DEPENDENCIES += mesa3d
+# Wayland Vulkan backend, using the bundled Vulkan headers
+ifeq ($(BR2_PACKAGE_VULKAN_LOADER),y)
+IVI_HOMESCREEN_DEPENDENCIES += vulkan-loader
 IVI_HOMESCREEN_CONF_OPTS += -DBUILD_BACKEND_WAYLAND_VULKAN=ON
 else
 IVI_HOMESCREEN_CONF_OPTS += -DBUILD_BACKEND_WAYLAND_VULKAN=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_LIBDRM),y)
-IVI_HOMESCREEN_DEPENDENCIES += libdrm
-IVI_HOMESCREEN_CONF_OPTS += -DBUILD_BACKEND_WAYLAND_DRM=ON
-else
-IVI_HOMESCREEN_CONF_OPTS += -DBUILD_BACKEND_WAYLAND_DRM=OFF
-endif
-
-# "plugins with external dependencies"
-ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_AUDIO_PLAYERS),y)
-IVI_HOMESCREEN_DEPENDENCIES += gstreamer1 gst1-plugins-base
-IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_AUDIO_PLAYERS=ON
-else
-IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_AUDIO_PLAYERS=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_FLUTTER_SECURE_STORAGE_PLUGIN),y)
-IVI_HOMESCREEN_DEPENDENCIES += libsecret
-IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_SECURE_STORAGE=ON
-else
-IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_SECURE_STORAGE=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_GOOGLE_SIGN_IN_PLUGIN),y)
-IVI_HOMESCREEN_DEPENDENCIES += libcurl
-IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_GOOGLE_SIGN_IN=ON
-else
-IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_GOOGLE_SIGN_IN=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_GSTREAMER_EGL_PLUGIN),y)
-IVI_HOMESCREEN_DEPENDENCIES += ffmpeg gstreamer1 gst1-plugins-base
-IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_GSTREAMER_EGL=ON
-else
-IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_GSTREAMER_EGL=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_OPENGL_TEXTURE_PLUGIN),y)
-IVI_HOMESCREEN_CONF_OPTS += \
-	-DBUILD_PLUGIN_OPENGL_TEXTURE=ON \
-	-DBUILD_TEXTURE_EGL=ON
-else
-IVI_HOMESCREEN_CONF_OPTS += \
-	-DBUILD_PLUGIN_OPENGL_TEXTURE=OFF \
-	-DBUILD_TEXTURE_EGL=OFF
-endif
-
 $(eval $(cmake-package))
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
