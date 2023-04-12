Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B87BC7619A
	for <buildroot@archiver.kernel.org>; Wed, 12 Apr 2023 22:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12AE683CE7;
	Wed, 12 Apr 2023 22:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12AE683CE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NpqCAa_-v34p; Wed, 12 Apr 2023 22:26:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50C3A83CD0;
	Wed, 12 Apr 2023 22:26:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50C3A83CD0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E5BD1C3D5F
 for <buildroot@lists.busybox.net>; Wed, 12 Apr 2023 22:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76A1641B8C
 for <buildroot@lists.busybox.net>; Wed, 12 Apr 2023 22:26:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76A1641B8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1PSaT36Pzdvs for <buildroot@lists.busybox.net>;
 Wed, 12 Apr 2023 22:26:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D6E941B72
Received: from mail.ott.net (mail.ott.net [77.109.144.132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D6E941B72
 for <buildroot@buildroot.org>; Wed, 12 Apr 2023 22:26:50 +0000 (UTC)
Received: from relay.zh.ott.net (relay.zh.ott.net [IPv6:fd53:c48b:8ee5::17:1])
 by mail.ott.net (Postfix) with ESMTPS id 70A044801005;
 Thu, 13 Apr 2023 00:26:45 +0200 (CEST)
Received: by relay.zh.ott.net (OpenSMTPD) with ESMTPS id 52b07b38
 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:YES); 
 Thu, 13 Apr 2023 00:26:45 +0200 (CEST)
Received: from localhost (mort [local])
 by mort (OpenSMTPD) with ESMTPA id a50614f3;
 Wed, 12 Apr 2023 22:26:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Apr 2023 00:26:40 +0200
Message-Id: <20230412222640.109345-1-stefan@ott.net>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ott.net; s=onbz5; 
 t=1681338405; bh=dna0ocelnoJR4SwdGERpGbioy94S+XGcoVY6l2ru76k=;
 h=From:To:Cc:Subject:Date:From;
 b=H6iyB/BrtMKMGro4OssXXOWh66QRMzI8ww4GwMeKZXiMWTQSxCLxhASzkzgBaXPR0
 qXUcEjiYVxlzlBwxIGbdaIKbC9wKI0aRt6B86YPierZZgWTwppOHMU85ooUA2Wj4ed
 T4Y754+v8bIPCsbRRKzEtYOMOxsTTUFpCT6i8cxSGxl2AvKnXRRwGWzJfSnG8sLJ2J
 q2NZKf//8G912fDCpRWHK1gXpOlUuA/bEX1MHr/A4wdQ06ed+8LrwOn43Dmz8YO1lZ
 xrRMxJ1jrcQS0+rwIF2Z3LVmhD243ai90XDPeQDT5JyGhgt284QY8uZMIrxb9fqLUH
 vG9adom1Bollg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=ott.net header.i=@ott.net
 header.a=rsa-sha256 header.s=onbz5 header.b=H6iyB/Br
Subject: [Buildroot] [PATCH 1/1] package/libgtk3: Remove atk-bridge from .pc
 file
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Stefan Ott via buildroot <buildroot@buildroot.org>
Reply-To: Stefan Ott <stefan@ott.net>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The dependency is supposed to be optional but it always ends up in the
.pc file. This leads to issues when building packages that depend on
libgtk3 and are unable to find atk-bridge:

> output/build/gcr-3.40.0/meson.build:57:2: ERROR: Dependency lookup for gtk+-3.0 with method 'pkgconfig' failed: Could not generate cargs for gtk+-3.0:
> Package atk-bridge-2.0 was not found in the pkg-config search path.
> Perhaps you should add the directory containing `atk-bridge-2.0.pc'
> to the PKG_CONFIG_PATH environment variable
> Package 'atk-bridge-2.0', required by 'gtk+-3.0', not found

This change modifies the original patch so that the dependency is only
added to the .pc file if atk-bridge is present.

Signed-off-by: Stefan Ott <stefan@ott.net>
---
 package/libgtk3/0001-disable-atk-bridge.patch | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/libgtk3/0001-disable-atk-bridge.patch b/package/libgtk3/0001-disable-atk-bridge.patch
index f3e9bff2ba..8127b97253 100644
--- a/package/libgtk3/0001-disable-atk-bridge.patch
+++ b/package/libgtk3/0001-disable-atk-bridge.patch
@@ -39,3 +39,14 @@ Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
  
    backend_immodules += ['xim']
  
+@@ -588,7 +588,9 @@
+     x11_pkgs += ['xdamage']
+   endif
+
+-  atk_pkgs += ['atk-bridge-2.0']
++  if atkbridge_dep.found()
++    atk_pkgs += ['atk-bridge-2.0']
++  endif
+
+   cdata.set('HAVE_XDAMAGE', xdamage_dep.found() ? 1 : false)
+   cdata.set('HAVE_XCURSOR', xcursor_dep.found() ? 1 : false)
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
