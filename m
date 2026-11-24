Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26BD606A32E
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 12:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=N389aca7;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=UXmMJ8+3
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1EBB40603;
	Tue, 24 Nov 2026 12:05:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mi02svC3NRlW; Tue, 24 Nov 2026 12:05:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AD42D40656
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795521905;
	b=Tygpk4alVpj5aSn3pfaMXk/mnjcXtPeg1go/2OW1dSTft98QedIw+k/cL8htA8j08Us5
	 HeMx3uoYZCQcrDY4/1mCmKw9N59fEtja8+MJW+EqahptAaBs2Uk+G1lgAb+vihDPCqV9q
	 BzWEc7Vw7UuiDVjQdvlVXyCbroSPcN0hA3t5sy/XZltMgNuS9eyUoDPcGzPmiI8JrptY9
	 GIPUZ1m9M/mtmsti/8gnhwZ+rpsLkyVOqMbkY72TsuhC0rGbbLj+WCrU37mdAPUx7bMEZ
	 i4I5VCh6gvPkrro+92tt2c0fkLWgC4NU7GhHHUTbA2/NRrnh2jf99igGpvh+6/7SGwQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795521905;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=t2PBDUO0FOm/UdTH5tnYXh9iTA14AfY9ULFDcOi96wc=;
	b=GXTJbvBklxOclNYt5vwcRo7aEoemC+sRXCCRjd2crP33/3DIsw3OkZbmX8jZxOsjikSn
	 wzvdHEhc2VMR4lZCHx9ftusucM0/5Mps8gnYy4jzJ3tTmf6uBDPyXCaq4BS/OTrzuGqP7
	 1lUET9vrFKD0sKhplVd/Vtc0w6AG/aHKnmZXeEwxcTzDBlvDwAAiMFUFsgxUnAyXJ8gR9
	 D6/nTSHNFYmc9S7oeJy4oweHHVtmrmoAKtZvq9Rl/yPr+gg1Uvsz2yo0gpTQZo5kA2L+V
	 eM7I9pqe4fw5el/2QSQ1B2JBfgng4qWcJHYEX6cX5H7T7Izx7/f2FKrjo5sWOxHjq6w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=UXmMJ8+3;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795521905;
	bh=t2PBDUO0FOm/UdTH5tnYXh9iTA14AfY9ULFDcOi96wc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N389aca7TskYcPYWR20s3btZ0M0RaeE9a6evVzQb/NUADF4+37KVr/yYe0GXVoCP0
	 ZqJdsSrQ5PWvtV/RTCYZhMvpMulgLjkQdkDWpdiFfZC2stqw1V7Dhm/1DQ8oxwffsE
	 7TV/qJWPgV5f7sd3ROy9qi5/7XJlNLTxIaEmnXL18XO1VGge0qXAJ6oTJyVi8H+oeh
	 +QnNQKqa5DxIZm3DafjvD0QAlmaneJ4lNYeeR+Eb1t9dkGXOCrXC1UyQuAcpgPbRVu
	 tIQHofVgyOu7Whm/z5aHA457QoakrDlxdy/hOtck1eliKuvCz/gzF9e+Qg7PtigIkS
	 NdnWmTr6wgeng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD42D40656;
	Tue, 24 Nov 2026 12:05:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 19B833A8
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 12:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B68440655
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 12:04:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5MV5DEhjlNRT for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 12:04:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4BA05405C9
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::631"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=UXmMJ8+3
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4BA05405C9
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 12:04:52 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-c505994e5f5so69689666b.1
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 04:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795521891; x=1796126691;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=plMjDnAXCCx9+ZpYdq45dCrLB9q7c1QxWblanM1eGbY=;
 b=UXmMJ8+3bw2Ra+gRaJIyLM8dr2AzULgQ7psNZwPZdxSZEtqyAALX8ZoeAiqVP/ctKv
 apsgthEn0tCgohDzE9plan2u3mL7YtiIolqCkkf2MzsxG7sKVZul8cLBWVRoq0roFJkB
 TZGyBT0VcbdgpI5oVWZ2ThRoCBXfFhrxO/nZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795521891; x=1796126691;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=plMjDnAXCCx9+ZpYdq45dCrLB9q7c1QxWblanM1eGbY=;
 b=a3NHdUN2eneBHSjsT2fd/hPtjgvV6uejReeo7JqUKIixBfCFi/RlIPG+93kfnmB04J
 ANC4HTWP8sAp5KpdleA1EB0Ryrm7VucuhHKmGAVkXmiwNi5d+ijml1NVjn33oP0SLsD3
 zu3YZBS6+j3a1Df5XqedbPIdpFpZto1WlWE5fGTNhizx8uqz1hzqeB3gGPGzh2PtL731
 VEG0vHhrdR5cv6Bham3zHEcVUBCetanf+j1UWi7KxH3Ign+T4bEKJEMnGsnQrDzht89k
 kYvIlgAkMKantK7U2KxTQLQ3opMu+pLy8bSO8Haqcnq157krDZVMgK8Er9/H3vPomu4H
 z0Ug==
X-Gm-Message-State: APuU4Z/vw4q6/AFgCf6SpMixStCyvpKG9g/fYl3edVYGKm5XhzDvR7tf
 BoQjrOAZDDikYLLezi/V6EVLjw2PynwJfL0RmwmS0/9NdjkoPJZa2RnwS+r1SGObeW8uWnSbO0J
 bU8+bJWY=
X-Gm-Gg: AZFdTZcV4DvbQ6+vNkVyk4CV3zMIhWYGrbR0gWnq+w31JaYgnyUi544KLwVoXhXChua
 3WgLIviyCQlT9Ddbm82NRr5VvMkEV7A1mW9xtzpvB/JYAdV46Ba6Ec+3QQfadzxgyPsaeIr/nar
 ad1HqaHcPCiAqxhgbkeZMWg2ueZx/YW9haGnspOktYxQRZfP20EZD/GW62htM98IRBXEK3Dnqiw
 l8++c93pMrSW7I1YttHCNNFck/cx529iR/ozemYW6tml/47auoXDqK9Qz/TsWsxk19kcd+qpStL
 cxEHPReTbgBZF4fW8G3x9YsDNIDpTgn9Pog3wtcRv+JiYkZcuN6C4vbDWPPCM2HaE/+cWuUWhCO
 1O+FklWU54Z3V7tCN3ZGZCLncl2WE0N8qFsmd3R0/EZLhsbs9PwRZHxDkEVI92VbrPGQ3MljhVh
 FmUE8IN388Z2R4/pKWOcslD6sJ3xQqtweC7TrP13gCKDmPWAvOwY+Y6ERCWp7o7Ao4EhC6QwezX
 wNnzIxF8QQB2oHKpAcPJjp7H/GK+Fay/BVmnhluILAGX02hRPWgGHfoTLjTjsXUuabqMOopjL7s
 PRNDMmWaqrqyNDG8ilsOlnLaSChSSYNeMwqoYB+TveczkuL2eSVjMUdx9bHqkF3BXlb8JSc5lZ2
 qWrncP+FAfyLzSvOT9Wwkt9FrsmUtwGIpCQnT93WH9/IO4458Xwn18sTEFG6uCNcmJskjjuWvXm
 eP7yJOOJauGK8D9fudkhZnphoTg0s28nOIcLkr/0k4EUQ9kQ2KgjnJmn+sSGwEawbKrfuHDNlQb
 kKbU27SKHbM16TSDx0fWQ==
X-Received: by 2002:a17:906:26c5:b0:c51:3b84:6fb8 with SMTP id
 a640c23a62f3a-c513b84886cmr1022996666b.4.1795521890878; 
 Tue, 24 Nov 2026 04:04:50 -0800 (PST)
Received: from adam-linux.amarulasolutions.com
 (2001-1c00-8181-e800-dc0e-c162-ac5f-4bbe.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:dc0e:c162:ac5f:4bbe])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513ae67bd3sm499466766b.27.2026.11.24.04.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 04:04:50 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Claude Opus 5.5" <noreply@anthropic.com>
Date: Tue, 24 Nov 2026 13:04:43 +0100
Message-ID: <20261124120443.1909297-9-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124120443.1909297-1-adam.duskett@amarulasolutions.com>
References: <20261124120443.1909297-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 9/9] package/ivi-homescreen-plugins: new package
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

Since version 3.0, the ivi-homescreen plugins live in a separate
repository. They are not built on their own: ivi-homescreen compiles
the plugins source tree into its binary, through its PLUGINS_DIR CMake
option. This package therefore only provides the source tree, the
plugin options and the dependencies of the selected plugins, and
ivi-homescreen builds with plugins enabled when it is selected.

The repository has no v3.0 branch; ivi-homescreen v3.0 is built
against the plugins v2.0 branch, which is what upstream CI uses.

The always-built common plugin vendors sdbus-c++, which needs an sd-bus
implementation: use libsystemd when systemd is available, or basu
otherwise.

The following plugins are supported: audioplayers, desktop_window,
go_router, google_sign_in, integration_test, layer_playground_view,
nav_render_view, flutter_secure_storage, url_launcher and video_player.
The other plugins are disabled for now: camera, camera_pipewire,
flatpak, file_selector and gamepads are untested, and pdf, rive_text,
webrtc and webview_flutter_view need dependencies that are not
available in Buildroot.

Point the legacy entries of the former in-tree plugins to this package.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
---
 Config.in.legacy                              | 176 +++++++++---------
 DEVELOPERS                                    |   1 +
 package/ivi-homescreen-plugins/Config.in      | 117 ++++++++++++
 .../ivi-homescreen-plugins.hash               |   6 +
 .../ivi-homescreen-plugins.mk                 |  80 ++++++++
 package/ivi-homescreen/Config.in              |   2 +
 package/ivi-homescreen/ivi-homescreen.mk      |  11 +-
 7 files changed, 304 insertions(+), 89 deletions(-)
 create mode 100644 package/ivi-homescreen-plugins/Config.in
 create mode 100644 package/ivi-homescreen-plugins/ivi-homescreen-plugins.hash
 create mode 100644 package/ivi-homescreen-plugins/ivi-homescreen-plugins.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index d941d62b5e..bd452b350d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -158,220 +158,220 @@ config BR2_PACKAGE_IVI_HOMESCREEN_ACCESSIBILITY_PLUGIN
 	select BR2_LEGACY
 	help
 	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
-	  moved to the separate ivi-homescreen-plugins repository,
-	  which is not supported yet. Built-in functionality such as
-	  text input, logging, mouse cursor and platform views is now
-	  part of the core embedder.
+	  moved to the separate ivi-homescreen-plugins package
+	  (BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS). Built-in functionality
+	  such as text input, logging, mouse cursor and platform views
+	  is now part of the core embedder.
 
 config BR2_PACKAGE_IVI_HOMESCREEN_COMP_REGION_PLUGIN
 	bool "ivi-homescreen Compositor Region plugin removed"
 	select BR2_LEGACY
 	help
 	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
-	  moved to the separate ivi-homescreen-plugins repository,
-	  which is not supported yet. Built-in functionality such as
-	  text input, logging, mouse cursor and platform views is now
-	  part of the core embedder.
+	  moved to the separate ivi-homescreen-plugins package
+	  (BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS). Built-in functionality
+	  such as text input, logging, mouse cursor and platform views
+	  is now part of the core embedder.
 
 config BR2_PACKAGE_IVI_HOMESCREEN_COMP_SURF_PLUGIN
 	bool "ivi-homescreen Compositor Surface plugin removed"
 	select BR2_LEGACY
 	help
 	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
-	  moved to the separate ivi-homescreen-plugins repository,
-	  which is not supported yet. Built-in functionality such as
-	  text input, logging, mouse cursor and platform views is now
-	  part of the core embedder.
+	  moved to the separate ivi-homescreen-plugins package
+	  (BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS). Built-in functionality
+	  such as text input, logging, mouse cursor and platform views
+	  is now part of the core embedder.
 
 config BR2_PACKAGE_IVI_HOMESCREEN_DESKTOP_WINDOW_PLUGIN
 	bool "ivi-homescreen Desktop Window plugin removed"
 	select BR2_LEGACY
 	help
 	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
-	  moved to the separate ivi-homescreen-plugins repository,
-	  which is not supported yet. Built-in functionality such as
-	  text input, logging, mouse cursor and platform views is now
-	  part of the core embedder.
+	  moved to the separate ivi-homescreen-plugins package
+	  (BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS). Built-in functionality
+	  such as text input, logging, mouse cursor and platform views
+	  is now part of the core embedder.
 
 config BR2_PACKAGE_IVI_HOMESCREEN_GO_ROUTER_PLUGIN
 	bool "ivi-homescreen Go Router plugin removed"
 	select BR2_LEGACY
 	help
 	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
-	  moved to the separate ivi-homescreen-plugins repository,
-	  which is not supported yet. Built-in functionality such as
-	  text input, logging, mouse cursor and platform views is now
-	  part of the core embedder.
+	  moved to the separate ivi-homescreen-plugins package
+	  (BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS). Built-in functionality
+	  such as text input, logging, mouse cursor and platform views
+	  is now part of the core embedder.
 
 config BR2_PACKAGE_IVI_HOMESCREEN_INTEGRATION_TEST_PLUGIN
 	bool "ivi-homescreen Integration Test plugin removed"
 	select BR2_LEGACY
 	help
 	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
-	  moved to the separate ivi-homescreen-plugins repository,
-	  which is not supported yet. Built-in functionality such as
-	  text input, logging, mouse cursor and platform views is now
-	  part of the core embedder.
+	  moved to the separate ivi-homescreen-plugins package
+	  (BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS). Built-in functionality
+	  such as text input, logging, mouse cursor and platform views
+	  is now part of the core embedder.
 
 config BR2_PACKAGE_IVI_HOMESCREEN_ISOLATE_PLUGIN
 	bool "ivi-homescreen Isolate plugin removed"
 	select BR2_LEGACY
 	help
 	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
-	  moved to the separate ivi-homescreen-plugins repository,
-	  which is not supported yet. Built-in functionality such as
-	  text input, logging, mouse cursor and platform views is now
-	  part of the core embedder.
+	  moved to the separate ivi-homescreen-plugins package
+	  (BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS). Built-in functionality
+	  such as text input, logging, mouse cursor and platform views
+	  is now part of the core embedder.
 
 config BR2_PACKAGE_IVI_HOMESCREEN_KEYBOARD_MANAGER_PLUGIN
 	bool "ivi-homescreen Keyboard Manager plugin removed"
 	select BR2_LEGACY
 	help
 	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
-	  moved to the separate ivi-homescreen-plugins repository,
-	  which is not supported yet. Built-in functionality such as
-	  text input, logging, mouse cursor and platform views is now
-	  part of the core embedder.
+	  moved to the separate ivi-homescreen-plugins package
+	  (BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS). Built-in functionality
+	  such as text input, logging, mouse cursor and platform views
+	  is now part of the core embedder.
 
 config BR2_PACKAGE_IVI_HOMESCREEN_KEY_EVENT_PLUGIN
 	bool "ivi-homescreen Key Event plugin removed"
 	select BR2_LEGACY
 	help
 	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
-	  moved to the separate ivi-homescreen-plugins repository,
-	  which is not supported yet. Built-in functionality such as
-	  text input, logging, mouse cursor and platform views is now
-	  part of the core embedder.
+	  moved to the separate ivi-homescreen-plugins package
+	  (BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS). Built-in functionality
+	  such as text input, logging, mouse cursor and platform views
+	  is now part of the core embedder.
 
 config BR2_PACKAGE_IVI_HOMESCREEN_LAYER_PLAYGROUND_PLUGIN
 	bool "ivi-homescreen Layer Playground plugin removed"
 	select BR2_LEGACY
 	help
 	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
-	  moved to the separate ivi-homescreen-plugins repository,
-	  which is not supported yet. Built-in functionality such as
-	  text input, logging, mouse cursor and platform views is now
-	  part of the core embedder.
+	  moved to the separate ivi-homescreen-plugins package
+	  (BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS). Built-in functionality
+	  such as text input, logging, mouse cursor and platform views
+	  is now part of the core embedder.
 
 config BR2_PACKAGE_IVI_HOMESCREEN_LOGGING_PLUGIN
 	bool "ivi-homescreen Logging plugin removed"
 	select BR2_LEGACY
 	help
 	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
-	  moved to the separate ivi-homescreen-plugins repository,
-	  which is not supported yet. Built-in functionality such as
-	  text input, logging, mouse cursor and platform views is now
-	  part of the core embedder.
+	  moved to the separate ivi-homescreen-plugins package
+	  (BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS). Built-in functionality
+	  such as text input, logging, mouse cursor and platform views
+	  is now part of the core embedder.
 
 config BR2_PACKAGE_IVI_HOMESCREEN_MOUSE_CURSOR_PLUGIN
 	bool "ivi-homescreen Mouse Cursor plugin removed"
 	select BR2_LEGACY
 	help
 	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
-	  moved to the separate ivi-homescreen-plugins repository,
-	  which is not supported yet. Built-in functionality such as
-	  text input, logging, mouse cursor and platform views is now
-	  part of the core embedder.
+	  moved to the separate ivi-homescreen-plugins package
+	  (BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS). Built-in functionality
+	  such as text input, logging, mouse cursor and platform views
+	  is now part of the core embedder.
 
 config BR2_PACKAGE_IVI_HOMESCREEN_PACKAGE_INFO_PLUGIN
 	bool "ivi-homescreen PackageInfo plugin removed"
 	select BR2_LEGACY
 	help
 	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
-	  moved to the separate ivi-homescreen-plugins repository,
-	  which is not supported yet. Built-in functionality such as
-	  text input, logging, mouse cursor and platform views is now
-	  part of the core embedder.
+	  moved to the separate ivi-homescreen-plugins package
+	  (BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS). Built-in functionality
+	  such as text input, logging, mouse cursor and platform views
+	  is now part of the core embedder.
 
 config BR2_PACKAGE_IVI_HOMESCREEN_PLATFORM_PLUGIN
 	bool "ivi-homescreen Platform plugin removed"
 	select BR2_LEGACY
 	help
 	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
-	  moved to the separate ivi-homescreen-plugins repository,
-	  which is not supported yet. Built-in functionality such as
-	  text input, logging, mouse cursor and platform views is now
-	  part of the core embedder.
+	  moved to the separate ivi-homescreen-plugins package
+	  (BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS). Built-in functionality
+	  such as text input, logging, mouse cursor and platform views
+	  is now part of the core embedder.
 
 config BR2_PACKAGE_IVI_HOMESCREEN_PLATFORM_VIEWS_PLUGIN
 	bool "ivi-homescreen Platform Views plugin removed"
 	select BR2_LEGACY
 	help
 	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
-	  moved to the separate ivi-homescreen-plugins repository,
-	  which is not supported yet. Built-in functionality such as
-	  text input, logging, mouse cursor and platform views is now
-	  part of the core embedder.
+	  moved to the separate ivi-homescreen-plugins package
+	  (BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS). Built-in functionality
+	  such as text input, logging, mouse cursor and platform views
+	  is now part of the core embedder.
 
 config BR2_PACKAGE_IVI_HOMESCREEN_RESTORATION_PLUGIN
 	bool "ivi-homescreen Restoration plugin removed"
 	select BR2_LEGACY
 	help
 	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
-	  moved to the separate ivi-homescreen-plugins repository,
-	  which is not supported yet. Built-in functionality such as
-	  text input, logging, mouse cursor and platform views is now
-	  part of the core embedder.
+	  moved to the separate ivi-homescreen-plugins package
+	  (BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS). Built-in functionality
+	  such as text input, logging, mouse cursor and platform views
+	  is now part of the core embedder.
 
 config BR2_PACKAGE_IVI_HOMESCREEN_TEXT_INPUT_PLUGIN
 	bool "ivi-homescreen Text Input plugin removed"
 	select BR2_LEGACY
 	help
 	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
-	  moved to the separate ivi-homescreen-plugins repository,
-	  which is not supported yet. Built-in functionality such as
-	  text input, logging, mouse cursor and platform views is now
-	  part of the core embedder.
+	  moved to the separate ivi-homescreen-plugins package
+	  (BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS). Built-in functionality
+	  such as text input, logging, mouse cursor and platform views
+	  is now part of the core embedder.
 
 config BR2_PACKAGE_IVI_HOMESCREEN_AUDIO_PLAYERS
 	bool "ivi-homescreen Audio Players plugin removed"
 	select BR2_LEGACY
 	help
 	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
-	  moved to the separate ivi-homescreen-plugins repository,
-	  which is not supported yet. Built-in functionality such as
-	  text input, logging, mouse cursor and platform views is now
-	  part of the core embedder.
+	  moved to the separate ivi-homescreen-plugins package
+	  (BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS). Built-in functionality
+	  such as text input, logging, mouse cursor and platform views
+	  is now part of the core embedder.
 
 config BR2_PACKAGE_IVI_HOMESCREEN_FLUTTER_SECURE_STORAGE_PLUGIN
 	bool "ivi-homescreen Flutter Secure Storage plugin removed"
 	select BR2_LEGACY
 	help
 	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
-	  moved to the separate ivi-homescreen-plugins repository,
-	  which is not supported yet. Built-in functionality such as
-	  text input, logging, mouse cursor and platform views is now
-	  part of the core embedder.
+	  moved to the separate ivi-homescreen-plugins package
+	  (BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS). Built-in functionality
+	  such as text input, logging, mouse cursor and platform views
+	  is now part of the core embedder.
 
 config BR2_PACKAGE_IVI_HOMESCREEN_GOOGLE_SIGN_IN_PLUGIN
 	bool "ivi-homescreen Google Sign In plugin removed"
 	select BR2_LEGACY
 	help
 	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
-	  moved to the separate ivi-homescreen-plugins repository,
-	  which is not supported yet. Built-in functionality such as
-	  text input, logging, mouse cursor and platform views is now
-	  part of the core embedder.
+	  moved to the separate ivi-homescreen-plugins package
+	  (BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS). Built-in functionality
+	  such as text input, logging, mouse cursor and platform views
+	  is now part of the core embedder.
 
 config BR2_PACKAGE_IVI_HOMESCREEN_GSTREAMER_EGL_PLUGIN
 	bool "ivi-homescreen GStreamer EGL plugin removed"
 	select BR2_LEGACY
 	help
 	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
-	  moved to the separate ivi-homescreen-plugins repository,
-	  which is not supported yet. Built-in functionality such as
-	  text input, logging, mouse cursor and platform views is now
-	  part of the core embedder.
+	  moved to the separate ivi-homescreen-plugins package
+	  (BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS). Built-in functionality
+	  such as text input, logging, mouse cursor and platform views
+	  is now part of the core embedder.
 
 config BR2_PACKAGE_IVI_HOMESCREEN_OPENGL_TEXTURE_PLUGIN
 	bool "ivi-homescreen OpenGL Texture plugin removed"
 	select BR2_LEGACY
 	help
 	  ivi-homescreen 3.0 no longer has in-tree plugins, they have
-	  moved to the separate ivi-homescreen-plugins repository,
-	  which is not supported yet. Built-in functionality such as
-	  text input, logging, mouse cursor and platform views is now
-	  part of the core embedder.
+	  moved to the separate ivi-homescreen-plugins package
+	  (BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS). Built-in functionality
+	  such as text input, logging, mouse cursor and platform views
+	  is now part of the core embedder.
 
 config BR2_PACKAGE_FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE
 	bool "flutter adaptive scaffold example has been removed"
diff --git a/DEVELOPERS b/DEVELOPERS
index 3367c5e36b..8de83e356f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -36,6 +36,7 @@ F:	package/flutter-packages/flutter-rfw-local-example/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
 F:	package/ivi-homescreen/
+F:	package/ivi-homescreen-plugins/
 F:	package/mender-update-modules/
 F:	support/testing/tests/package/test_flutter.py
 
diff --git a/package/ivi-homescreen-plugins/Config.in b/package/ivi-homescreen-plugins/Config.in
new file mode 100644
index 0000000000..91e80c1c5d
--- /dev/null
+++ b/package/ivi-homescreen-plugins/Config.in
@@ -0,0 +1,117 @@
+menuconfig BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS
+	bool "ivi-homescreen-plugins"
+	depends on BR2_PACKAGE_SYSTEMD || \
+		(BR2_ENABLE_LOCALE && BR2_TOOLCHAIN_HAS_SYNC_4 && \
+		BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17) # basu
+	select BR2_PACKAGE_BASU if !BR2_PACKAGE_SYSTEMD # sd-bus
+	help
+	  Plugins for the ivi-homescreen Flutter embedder. They are
+	  compiled into the ivi-homescreen binary.
+
+	  https://github.com/toyota-connected/ivi-homescreen-plugins
+
+if BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS
+
+config BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS_AUDIOPLAYERS_LINUX
+	bool "audioplayers"
+	select BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOCONVERT
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PLAYBACK
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  A Flutter plugin to play multiple audio files
+	  simultaneously.
+
+	  https://pub.dev/packages/audioplayers
+
+config BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS_DESKTOP_WINDOW_LINUX
+	bool "desktop_window"
+	help
+	  Flutter plugin to change the window size.
+
+	  https://pub.dev/packages/desktop_window
+
+config BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS_GO_ROUTER
+	bool "go_router"
+	help
+	  A declarative routing package for Flutter that uses the
+	  Router API to provide a convenient, url-based API for
+	  navigating between different screens.
+
+	  https://pub.dev/packages/go_router
+
+config BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS_GOOGLE_SIGN_IN
+	bool "google_sign_in"
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBCURL_FORCE_TLS
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Google Sign In support.
+
+	  https://pub.dev/packages/google_sign_in
+
+config BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS_INTEGRATION_TEST
+	bool "integration_test"
+	select BR2_PACKAGE_LIBCURL
+	help
+	  Flutter integration test support.
+
+	  https://docs.flutter.dev/cookbook/testing/integration/introduction
+
+config BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS_LAYER_PLAYGROUND_VIEW
+	bool "layer_playground_view"
+	depends on BR2_PACKAGE_HAS_LIBGBM
+	help
+	  Platform view example, compositing GL and dma-buf layers.
+
+comment "layer_playground_view needs GBM"
+	depends on !BR2_PACKAGE_HAS_LIBGBM
+
+config BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS_NAV_RENDER_VIEW
+	bool "nav_render_view"
+	help
+	  Navigation render platform view.
+
+config BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS_SECURE_STORAGE
+	bool "flutter_secure_storage"
+	select BR2_PACKAGE_LIBSECRET
+	help
+	  Store data in secure storage.
+
+	  https://pub.dev/packages/flutter_secure_storage
+
+config BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS_URL_LAUNCHER
+	bool "url_launcher"
+	help
+	  Flutter plugin for launching a URL.
+
+	  https://pub.dev/packages/url_launcher
+
+config BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS_VIDEO_PLAYER_LINUX
+	bool "video_player"
+	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PLAYBACK
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TYPEFIND
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERTSCALE
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  Flutter plugin for playing back video, using GStreamer.
+
+	  https://pub.dev/packages/video_player
+
+comment "video_player needs udev"
+	depends on !BR2_PACKAGE_HAS_UDEV
+
+endif
+
+comment "ivi-homescreen-plugins needs systemd, or a toolchain w/ locale, sync_4 and headers >= 3.17"
+	depends on !BR2_PACKAGE_SYSTEMD
+	depends on !BR2_ENABLE_LOCALE || !BR2_TOOLCHAIN_HAS_SYNC_4 || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
diff --git a/package/ivi-homescreen-plugins/ivi-homescreen-plugins.hash b/package/ivi-homescreen-plugins/ivi-homescreen-plugins.hash
new file mode 100644
index 0000000000..555566d0c2
--- /dev/null
+++ b/package/ivi-homescreen-plugins/ivi-homescreen-plugins.hash
@@ -0,0 +1,6 @@
+# Locally calculated
+sha256  aecc68388bf2eb113fa823256e97714536c24489e7038a2bf705f67e43ade7fb  ivi-homescreen-plugins-19f03e2d36faea4a64167d4dbd913e296f878eca-git4.tar.gz
+sha256  6b96fa0a3def85caaf466caa2bd82d4ca4f22d106ff88f97a00c537c00cc714b  LICENSE
+sha256  7da994e7ddfee17ff8e1169684dda7062da79dd68fa912ec9cfa9f7a14a1239d  plugins/common/uuid/LICENSE
+sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  plugins/common/sdbus/third_party/sdbus-cpp/COPYING
+sha256  a1c9e75e25d8f2ce18017c88978edab2f0dbc7814ad0697d4ff2e5e59959f657  plugins/common/sdbus/third_party/sdbus-cpp/COPYING-LGPL-Exception
diff --git a/package/ivi-homescreen-plugins/ivi-homescreen-plugins.mk b/package/ivi-homescreen-plugins/ivi-homescreen-plugins.mk
new file mode 100644
index 0000000000..db30697024
--- /dev/null
+++ b/package/ivi-homescreen-plugins/ivi-homescreen-plugins.mk
@@ -0,0 +1,80 @@
+################################################################################
+#
+# ivi-homescreen-plugins
+#
+################################################################################
+
+IVI_HOMESCREEN_PLUGINS_VERSION = 19f03e2d36faea4a64167d4dbd913e296f878eca
+IVI_HOMESCREEN_PLUGINS_SITE = https://github.com/toyota-connected/ivi-homescreen-plugins.git
+IVI_HOMESCREEN_PLUGINS_SITE_METHOD = git
+IVI_HOMESCREEN_PLUGINS_GIT_SUBMODULES = YES
+IVI_HOMESCREEN_PLUGINS_LICENSE = Apache-2.0, MIT, LGPL-2.1+ with exception (headers)
+IVI_HOMESCREEN_PLUGINS_LICENSE_FILES = \
+	LICENSE \
+	plugins/common/uuid/LICENSE \
+	plugins/common/sdbus/third_party/sdbus-cpp/COPYING \
+	plugins/common/sdbus/third_party/sdbus-cpp/COPYING-LGPL-Exception
+
+# The plugins are not built on their own: ivi-homescreen compiles the
+# plugins source tree into its binary. This package only provides the
+# source tree, the options and the dependencies of the selected plugins.
+IVI_HOMESCREEN_PLUGINS_INSTALL_TARGET = NO
+
+# The always-built common plugin vendors sdbus-c++, which needs an
+# sd-bus implementation.
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+IVI_HOMESCREEN_PLUGINS_DEPENDENCIES += systemd
+IVI_HOMESCREEN_PLUGINS_CMAKE_OPTS += -DSDBUSCPP_SDBUS_LIB=systemd
+else
+IVI_HOMESCREEN_PLUGINS_DEPENDENCIES += basu
+IVI_HOMESCREEN_PLUGINS_CMAKE_OPTS += -DSDBUSCPP_SDBUS_LIB=basu
+endif
+
+# Optional helpers of the common plugin, required by some plugins
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+IVI_HOMESCREEN_PLUGINS_DEPENDENCIES += libcurl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+IVI_HOMESCREEN_PLUGINS_DEPENDENCIES += libglib2
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS_AUDIOPLAYERS_LINUX),y)
+IVI_HOMESCREEN_PLUGINS_DEPENDENCIES += gstreamer1 gst1-plugins-base
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS_SECURE_STORAGE),y)
+IVI_HOMESCREEN_PLUGINS_DEPENDENCIES += libsecret
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS_VIDEO_PLAYER_LINUX),y)
+IVI_HOMESCREEN_PLUGINS_DEPENDENCIES += gstreamer1 gst1-plugins-base udev
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS_LAYER_PLAYGROUND_VIEW),y)
+IVI_HOMESCREEN_PLUGINS_DEPENDENCIES += libgbm
+endif
+
+IVI_HOMESCREEN_PLUGINS_CMAKE_OPTS += \
+	-DBUILD_PLUGIN_COMMON=ON \
+	-DBUILD_PLUGIN_AUDIOPLAYERS_LINUX=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS_AUDIOPLAYERS_LINUX),ON,OFF) \
+	-DBUILD_PLUGIN_CAMERA=OFF \
+	-DBUILD_PLUGIN_CAMERA_PIPEWIRE=OFF \
+	-DBUILD_PLUGIN_DESKTOP_WINDOW_LINUX=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS_DESKTOP_WINDOW_LINUX),ON,OFF) \
+	-DBUILD_PLUGIN_FILE_SELECTOR=OFF \
+	-DBUILD_PLUGIN_FLATPAK=OFF \
+	-DBUILD_PLUGIN_GAMEPADS_LINUX=OFF \
+	-DBUILD_PLUGIN_GO_ROUTER=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS_GO_ROUTER),ON,OFF) \
+	-DBUILD_PLUGIN_GOOGLE_SIGN_IN=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS_GOOGLE_SIGN_IN),ON,OFF) \
+	-DBUILD_PLUGIN_INTEGRATION_TEST=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS_INTEGRATION_TEST),ON,OFF) \
+	-DBUILD_PLUGIN_LAYER_PLAYGROUND_VIEW=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS_LAYER_PLAYGROUND_VIEW),ON,OFF) \
+	-DBUILD_PLUGIN_NAV_RENDER_VIEW=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS_NAV_RENDER_VIEW),ON,OFF) \
+	-DBUILD_PLUGIN_PDF=OFF \
+	-DBUILD_PLUGIN_RIVE_TEXT=OFF \
+	-DBUILD_PLUGIN_SECURE_STORAGE=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS_SECURE_STORAGE),ON,OFF) \
+	-DBUILD_PLUGIN_URL_LAUNCHER=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS_URL_LAUNCHER),ON,OFF) \
+	-DBUILD_PLUGIN_VIDEO_PLAYER_LINUX=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS_VIDEO_PLAYER_LINUX),ON,OFF) \
+	-DBUILD_PLUGIN_WEBRTC=OFF \
+	-DBUILD_PLUGIN_WEBVIEW_FLUTTER_VIEW=OFF
+
+$(eval $(generic-package))
diff --git a/package/ivi-homescreen/Config.in b/package/ivi-homescreen/Config.in
index ecdc15a3f0..c2b8099ef1 100644
--- a/package/ivi-homescreen/Config.in
+++ b/package/ivi-homescreen/Config.in
@@ -108,6 +108,8 @@ config BR2_PACKAGE_IVI_HOMESCREEN_EGL_MULTISAMPLE
 	help
 	  Default --msaa-samples to 4 instead of 0
 
+source "package/ivi-homescreen-plugins/Config.in"
+
 endif # BR2_PACKAGE_IVI_HOMESCREEN
 
 comment "ivi-homescreen needs a glibc toolchain w/ wchar, C++, gcc >= 8, dynamic library, host gcc >= 9"
diff --git a/package/ivi-homescreen/ivi-homescreen.mk b/package/ivi-homescreen/ivi-homescreen.mk
index 7fa971a404..3c44503da6 100644
--- a/package/ivi-homescreen/ivi-homescreen.mk
+++ b/package/ivi-homescreen/ivi-homescreen.mk
@@ -88,12 +88,21 @@ IVI_HOMESCREEN_CONF_OPTS = \
 	-DBUILD_MCP=OFF \
 	-DBUILD_UNIT_TESTS=OFF \
 	-DBUILD_WATCHDOG=OFF \
-	-DDISABLE_PLUGINS=ON \
 	-DENABLE_OSGI=OFF \
 	-DENABLE_STATIC_LINK=OFF \
 	-DWAYLAND_CXX_IME_BACKEND=$(IVI_HOMESCREEN_IME_BACKEND) \
 	-DWAYLAND_CXX_SCANNER_EXECUTABLE=$(IVI_HOMESCREEN_HOST_SCANNER_BUILDDIR)/src/wayland-cxx-scanner
 
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_PLUGINS),y)
+IVI_HOMESCREEN_DEPENDENCIES += ivi-homescreen-plugins
+IVI_HOMESCREEN_CONF_OPTS += \
+	-DDISABLE_PLUGINS=OFF \
+	-DPLUGINS_DIR=$(IVI_HOMESCREEN_PLUGINS_SRCDIR)/plugins \
+	$(IVI_HOMESCREEN_PLUGINS_CMAKE_OPTS)
+else
+IVI_HOMESCREEN_CONF_OPTS += -DDISABLE_PLUGINS=ON
+endif
+
 # Wayland shell clients
 IVI_HOMESCREEN_CONF_OPTS += \
 	-DENABLE_AGL_SHELL_CLIENT=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_AGL_SHELL_CLIENT),ON,OFF) \
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
