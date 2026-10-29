Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777D1606A31C
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 20:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LP7FRzlQ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D25A60A87;
	Thu, 29 Oct 2026 20:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4nru153v1gRQ; Thu, 29 Oct 2026 20:23:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3FB2760A78
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793305409;
	b=lXyjyXBRS8BukLRZC8U9Q5ix3WMzb0y7h+Sy09gczUwHfnAb/gok7Z1Wtu9cW3nktOo2
	 OQ0/tN2eBgcGs2f32QuP9kfyJvl9E2NZiEbHVoF2eBFjlQzTPlOEGFpTbtOJCsdcmlhqc
	 nTILzqBojnzGbJjvimBTPt4GyBSorO+XuHI0wZa/5uqB/tW71mlfFe25sIhlNgUW1ijZr
	 bodMIfJ0NTj40Yr41AWrWZt8SG8P3jwDkje/Sde77w1p78vPupKROFnrKxf45jqcyI0iB
	 UuA2AR/pNGyRGZ7sHjJg/Psm6GfT/YErBK5IuzMOBpe4Tp7taCQYCsKftuiIpxvc2GQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793305409;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=k6lJg8U1F2mxQEGfsoo/hO0+E1cfdCfdHovLprkoHWs=;
	b=hqm9dYSswyJtTKaIL/t2OiNnqTGed5HYpnQg0ptsRkxhWf4be6jfzOq8Am/5idkfbvWZ
	 GgHHRA1/jr8Tn0zD0KreDdin//jPsBepgbv2KAqhVCfZefft42943Z1v4hZrCBGJmau9d
	 u6Shnms34XZrjqQOBTzVabFSKcgEXQ1gEV7mhP6ZFg/py1KhpZ6nawvOiC1L2QYEeXcGS
	 FGfytf37BDipsya6ZbPlm0pz70ndZUB0mLjcNrAv8owhagZnD6YQqAeXUJx2K/Sq8uic2
	 f4lw9H3ylnz25Yj/2SwAsGGf1A1etT9ekP3TRWuXP1WHayrdrG3PcA6JXYCTPJKF8IA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793305409;
	bh=k6lJg8U1F2mxQEGfsoo/hO0+E1cfdCfdHovLprkoHWs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LP7FRzlQOHNJFcLjPtAO8q4Gy0k4Qfo+ycPlRRl+7S0ft9Nry7iOXgYC7c4Sputg5
	 DZ2kGEz3N9Ak/SJNq9k5VXrHsBCQRAiQZc2fVI+CSSIkn8rOocSpiD/5EaAygVTzWi
	 dHKWU9lcN+Q/8HiG2r/bFjyLKJf9kfAmISUJwC112VoNduLqEFmH3f/iBp3MvZgD9r
	 eEvKqSRtS7Ur1Mx6gsSXd3WfjdYGHT4Xmc9kM3+FJyb/jdNy9dtb3n7MJ8GaViIywN
	 oNqp6KtTAVreLIN9C6LjQBvtqabwv9Tsv7pHhGYGzME6tU/tFL5919vLsPn7Mqxh26
	 PcYkwBOQCyoEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FB2760A78;
	Thu, 29 Oct 2026 20:23:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85B33D38
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 767AD40506
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id shzJxmQP-nXY for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 20:23:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BBBB5404FF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793305400;
 b=L4RnJRolWXdKSBZ4ClMqIHFubOqyRpIaICZhDyYoU3h5KUAOrbON9A9DxoF6IwDLsqVk
 KVtPicIN3yLDXAuABWNxM/LXCiBZ63CicsrG67dee0TSQN1F817m+mYTGzBpcZZPoW6JR
 G8ap7BR4fSl6n+J9MwipJgZKBZOkeUT0LCIXgSfYBEgVleZdxxZyUdCb/3g1NK2FXTtPk
 pRyZ23+rNS7tAHSU2WwXxe/1GqBPGkMqEkhDvGTeYyK76fSS13SJtxe6nz/MQQD/WA0uC
 0iHU6Sr4iHnmDsw0Fj+R5y/AzaZMxRm/Jj79PQMZjAg+uHG0M/pr1d0h8pFH2KqoCKw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793305400;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=CEhv+YFLuK88qo1Q8ukfn0vIRtC27j+V7jKimPzqejA=;
 b=P40e8NKTDwh60Ptyvu5EojjsjKkJG/2bCctx4i34Hm82XUUQeRwOPiuqHa5gjV5W8cCu
 oA4k2AZ0fUGCIkPzaBCF9uB8mvG5GmhOrfa2xp6U+/2VeOT5t0Qe70KMHxS+3XVNPjbWS
 hd3HbvEcyDpGMwv6g0x31+sBpjkDQStMkcTlS+hKMUX1fcAAMxPee8WJYlvZMXexv5C4n
 BzHUzsjfn0iyt6n7LO8T9cL6/MibXZ56otcH45AWk6K6Sh2E9JA8h++8wt0tNvKhzwubj
 ybdmccONCwom1Cb4WFjc4rGR7OOFb8Mhz7PvotREhP0GmaKms4FAoKHz20L18IChhsg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBBB5404FF
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D97A9D2E2; Thu, 29 Oct 2026 20:21:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 20:26:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5def659d99f73a2e879eb612f087456d9c14f3f0
X-Git-Newrev: 14e2f2c9894fc2dd699276cf7c12c0959f7e9808
X-Patchwork-Hint: ignore
Message-Id: <20261029202153.3D97A9D2E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-peripheral-*: mass version
 bump to Piers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/14e2f2c9894fc2dd699276cf7c12c0959f7e9808
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash | 2 +-
 package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk   | 2 +-
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash   | 2 +-
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
index 3be4eef39b..e57e020ca0 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7392c30a9e49b0cd219cdca14f5b20ffce9f4a52c349c2cdf37cb603dd21f516  kodi-peripheral-joystick-21.1.23-Omega.tar.gz
+sha256  cf79e4bb8d413d930fc0821200144a22fb3c0e38a58c04119e4e4134a848b0cf  kodi-peripheral-joystick-22.0.12-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
index 698b918266..73c8a675e8 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_JOYSTICK_VERSION = 21.1.23-Omega
+KODI_PERIPHERAL_JOYSTICK_VERSION = 22.0.12-Piers
 KODI_PERIPHERAL_JOYSTICK_SITE = $(call github,xbmc,peripheral.joystick,$(KODI_PERIPHERAL_JOYSTICK_VERSION))
 KODI_PERIPHERAL_JOYSTICK_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_JOYSTICK_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
index 833905b9a3..2791ce3074 100644
--- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5f74b0493e0f17e297f271b0befd01406dcaae121305bc7cb9d0ece6200cc675  kodi-peripheral-xarcade-21.0.2-Omega.tar.gz
+sha256  ca391349b0184083ee76918ae37359f2df541597812476c4a18b0c5e0b3d62d1  kodi-peripheral-xarcade-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
index a46c616323..0fda4dbdfa 100644
--- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_XARCADE_VERSION = 21.0.2-Omega
+KODI_PERIPHERAL_XARCADE_VERSION = 22.0.3-Piers
 KODI_PERIPHERAL_XARCADE_SITE = $(call github,kodi-game,peripheral.xarcade,$(KODI_PERIPHERAL_XARCADE_VERSION))
 KODI_PERIPHERAL_XARCADE_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_XARCADE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
