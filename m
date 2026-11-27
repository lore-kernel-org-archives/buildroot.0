Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77FC606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 11:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SgJ2ixOx;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Z5e0CUR/
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9050081205;
	Fri, 27 Nov 2026 11:25:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PJGYApKWX5b3; Fri, 27 Nov 2026 11:25:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 910D88122A
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795778724;
	b=eqJ7t3fE7zlWH9HIDeHuPy9JYkxPeMbDrJjs6hN6qJXF8shJnaUtAnI3/KugiQT6+Y8u
	 NzL47UGoDJYfWDKs0On1FwOK1oKWGb1/vCv8TuDK7C6KUIDJDuzdO12K/Ua3JCmsTjp0C
	 4PmsmkJoCaHRVYpRoSuf0tXefCzN+sl07ToUsvzbvdD7o+NmoY1PfMcR4B+OKCzZ1/QYV
	 RViCPHG8US2yAKC/Qmlz1TYyXwPM0Ca7vKtdDlp8HmMVtnt3KBcozpGgC54PnmIC2ryLt
	 5C/hvhAjcTZCAlH/CWpZPZqCrr1GHdzYS2g0ll82BXSRSt+EvF8D0t3r9OkisWtDGHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795778724;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=qCARnYQHP+065VWHAiuRWRymMTkOz29A1N7w6pKhJPA=;
	b=qfQIZU+5huxh4mX1Xdu0N76880aio7bx0Ifz/1YqABEujzc/SLWnzzr9ukr6juV7qT13
	 pn8hG6HWbLv4BTz7ZcglOrTiV3Epb/9Plwb9nYRflN0Di5UbGKsNLppVMVH/XuyMG/Sem
	 SVam1LvvqAVEd0fFxNjrh7N4AkA49n9F2tLJ4B1Mx60X45w+X73J3c3tLr6KtKQnP4552
	 gRFnueUPksCRYR9Nej/40hVNaShiyEr1l/BNV2BFYKDoJHKF+5sQymoTSxPW3F9fbZcVz
	 wmCMcG1+jY/R5EowCfLLKiSIHHP3GRkNx7hMPBoFg4sNREQCQWbUDnA/JxcFI6B9o8g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795778724;
	bh=qCARnYQHP+065VWHAiuRWRymMTkOz29A1N7w6pKhJPA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SgJ2ixOxWxTADXDboNa2IF6NymXK0MlfsicINnwzCBcCBjXie0Un38c5IZaMYvpbh
	 wlWkpqXLuQDJwO30gM253oUzBKrs1zn/ie9no2QUI9QKjLozGWafIJHRguoJ3Xq3tf
	 ENexTcMRUQB3Kl6yFpkJdZA0uPAgYiA6KfDlXR/2b5SyMyY2YxZDPuo65P/ab4JCaf
	 WY1+k3KgISj2BzyNcgJ/vFxNe75eL+Awd1GJx0i8YiRkbQS5mgW+JiKC+Jg2gUkRa8
	 w5CQJqlBY4YWRQub5EVjWTMNvvZ8r29s2ytuleJxzMCV5aiB7AUyUEp1V73SuXSQ5O
	 Fgd+kDjpnKSKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 910D88122A;
	Fri, 27 Nov 2026 11:25:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E4E22BD
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 11:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53620408C7
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 11:25:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9m3qHg0aJQdq for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 11:25:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1E072408A8
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Z5e0CUR/
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E072408A8
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 11:25:14 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-c499b5be0f1so111311766b.0
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 03:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795778713; x=1796383513;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=u8s4/Hq4F5vM0B78/NGaKV7YIJGa/OT5lvndIrnd968=;
 b=Z5e0CUR/x74ssefpQiF4OhpuW2HdgIZrKIKEo646ZtcsJ2YBpD7pUYuhjFW3UoPJsA
 Ljx7HfeBPYmN7zXyefupQrtnA0W3y30/OEONVcq/7zsCnGVBv/tYZrgbvR4V/xzeHd8e
 3FXTP7+J3Z44LsmL+4ZHVR+fqpysn+bru9+DI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795778713; x=1796383513;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=u8s4/Hq4F5vM0B78/NGaKV7YIJGa/OT5lvndIrnd968=;
 b=BO/jVFQVc7BkLLa7zJ1Y8ZIXlgBFtVA8W6DZWL53ZaEGSXGdlSzKUQp8vrO999Bvtu
 NNbjrD5PhHP4pBgUakS5CQ64ZaZdZo//owvMa2RWoYDRC8iTYy6OkDBT+GWtjudbxSyK
 q6LgZJzlzivtn+a9JsLgH5k4HDqTMLs983cT5iMddmL5FkVHynRgsiirfVpKKjESNJiz
 AIYfhVSFA+5KO953efF90ORysY70MJIMm1khKhXIpJT5m/ccy1O+5ASKRDVEXWRgYRRl
 SmrTQbNT/4EyuxRJgAomNfrWYyVymzXjJp45qGnKFlipnGX/UZ6JM6ZsSfutJopKFhGl
 zLzg==
X-Gm-Message-State: APuU4Z8aOrsf/SVVM7mdaDVFGARR0UJB4GCGqFRJD79ADHEaugxn8xK9
 kcCEJ4TvZun+9yzMnpDyVPrsKAEr8MuJpAD01EstzQXTvr7CG6Xc2hU2zjG4EJQ3X7+itgCjxe/
 McV+I6VA=
X-Gm-Gg: AZFdTZccBYs7w01BzuEXWjEvhx2hnqeTZkE4n3YWAEVUrW6OBzPEawR4fRPO1B0kBg2
 M4p5xp4kHyuCSRzi/Ma5d5x1pYbBA/GqA131gh8jM7S7I8IMsJYRBgZX+H4lNh1vJxPtxUGeVF4
 +o+acTwNzmd9gt1VeDqCWPLTB/45yO4rHtooIyqs4BcS0gzEeymlficOkr/ZfrQUqajfyQ4zgQn
 l4lCVh2yZHH+DZupriycmeaf3O9r26lPnY/3NP7UTGCAwyzbbeR6dDq4Pp8ZK6UbcX+Yk5+R1A9
 Q6t7TMitWb4YeRxHCrPB2SR+TNgwX2c7MfWNjmVzVfmtem7yfLQW0s7yq89B0S2PnyG6dByxp3T
 jdcX3rhpp9IpGeylwpwS7k3EsCNiGZvE7N0wYv+SCzR14dZQbOPXepez/HFngqQSvL9+U8TAfP/
 RzUjqgnMEUTsvMoEp4qin7WX7r8HuiRZ/butkcgq74ZrFf4AdbFHSUetrSgr25opvFSKc7zGEHV
 lafd0k24+p2AHAtya0+LbsQkw/nItfsCXlgoihBT7HmbjKE9sNbyWJT/t7OHlLqPOursZ1SanwB
 2pPOQ1rbWAbg91guiWg/uS65IIthI2w6VEIc2KJUl9uMsTCybrfpqyojAjoYn8oLB6QY6dVHTYI
 RwL5mooQRNkVsInwVViFWBUno5nrtQ2C6QKxpCt1fBS0NW6KzeBjDa3iGI+vjvTMJEEynZ7oEEw
 p4Vpg4brzZmsaiIfRirgIArGgk2ZSM74rXmh8/se1EvMtn7+QFkKzNt9UCompmmJBrQ7brTSQYg
 qKfos3ga1ylXBhA0eB/rjV9PvdQv0khXs00NDyq1yBUzzdpmL6d9c2Qq3OjWYPglxiGS+3SpQ==
X-Received: by 2002:a17:907:8f03:b0:c51:26dd:3037 with SMTP id
 a640c23a62f3a-c513a1dd552mr1622680666b.0.1795778712580; 
 Fri, 27 Nov 2026 03:25:12 -0800 (PST)
Received: from adam-linux.arnhem.chello.nl
 (2001-1c00-8181-e800-dc0e-c162-ac5f-4bbe.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:dc0e:c162:ac5f:4bbe])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513aea3701sm885808166b.48.2026.11.27.03.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2026 03:25:12 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Nov 2026 12:25:07 +0100
Message-ID: <20261127112507.2594905-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127112507.2594905-1-adam.duskett@amarulasolutions.com>
References: <20261127112507.2594905-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 6/6] package/ivi-homescreen-plugins: new
 package
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
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
Co-Authored-By: Claude Opus 5.5
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
index cc28f6f67a..2a9590fbbc 100644
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
