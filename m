Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F661C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 14:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA01840705;
	Tue,  4 Feb 2025 14:32:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oceX-YuZPlVt; Tue,  4 Feb 2025 14:32:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61F1E4071F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61F1E4071F;
	Tue,  4 Feb 2025 14:32:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1498D12A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAE81413F0
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:32:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ACRQKGaAJsjS for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 14:32:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2A235413ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A235413ED
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A235413ED
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:32:37 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.121.123]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2wKq-1ticph3Ir6-002Yat; Tue, 04
 Feb 2025 15:32:33 +0100
To: buildroot@buildroot.org
Date: Tue,  4 Feb 2025 15:32:27 +0100
Message-ID: <20250204143227.1233163-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:9m4Wzl0FxWcb8f36aN3vn7pR5DX/8zfQdghxztTP1y0oiLBPLhs
 rQljwlH3FLHB03QPKxh8WfKNWwoMXXD9kkynSYtSbuxPdhlezg2olG35ni3esx+oHpDgdoM
 sWDWPg4Hi9P+p5yP4Hdmmkgulw6syNaR5Ssq5ZegeXlHbPvr37yw3aCDjcBBSAMXedCqEhp
 ULx7mg8JopJ4hUEnOGxeg==
UI-OutboundReport: notjunk:1;M01:P0:H5urTX3IJik=;+Kwh7eZR4CdYfrhkOd5rDuEIbBX
 TkuvYYP6MJ1Ytu7z/X16PZLrWsvzIn7MzwE7iW3s+0dIgZRDqpBAr4VYb+3mu24BgAbEh0Zlw
 E21UD69+1whgxgJil1/hjVqiLCjL1oSgnR5rsXFdlegnYyLjEgHIiUqTpnt3/dCki17dEYgNr
 ViELCjAHtvEKLg7Wanv2waB12cLPsm73lPFIxdRC4rYQ3g4pMCAxnQsBK72QlNlN/xTNX0qw1
 hbDeraOEFY/+UOF/tzc11NXsUg1jMhl3xkCTwFfQTwAHg48uNUwjf6VH4Bq6n7v897FdwqS/D
 +XzzK7mI7R1OuMmtf2W7qfnCIvunzSwgckOHAUXJHSjQdkl0ARFzffksveX6HibVdnZ1Y0CCU
 ahq4LIL0B03vj1WL/bMocK0KWzGNl2oCWPNNaDm+gXyZS5hRPMIQqx1PEyWMCaYPLwQi6h8CK
 UoOXezP605dMxe1d925E9kEkHpwclzyGvLhFbzzATQ6D2A+e9LOOtCVsdIdkQN4hoEliF9wln
 FBNDYPNfr4W8HS18OtjxD6USR3pwJHg6QHfWPh75SZuq8bSXwDe5FYkV75EyzoNIpVY6Q1Hzw
 IaI1HribyauoaMqvDFk2gEqvnm5xy/m9c6UCqfk28PUYETK3D20RGA44DNNWt7VyxxqZ4+FIf
 q7wTFqKLu6UZ96fRwdDig9u+/c04gr0UFmawVEVzYRoQqdQ1XURaZTbq3S0u6He0AVRevkhQq
 hBEVZQByp0pDLOCI2T16jSl9XhOGKPzMmY/A4oUMOhyUzqwOhM1C5RpnAyLdEZ461GnlNTbHZ
 SRHKzd9sfR8mBcXx51SSta4uGsczSGKsNvLy8GfaufdtUFfvgwwtkusbRKjrw9z1rbbmnD3el
 s8yT8Ee4REVvYeTocEUmfXeFIeNFpu2aZYPK/56rGvawDzhfgqTlEw8oiIJYFfaWO+T/RrKTI
 aUN2LjaMyT4jfpnI3Lj0vpJIBtQ+cgSM7CLsK+/w7DZGyPBhuEohTxVFn/oFLwAcRaId4PwhV
 5P/Ft0kf81REdIzAlLf+uv2NrsCEclP50oVK3WDqBiQAx/Lz+tN7BqDvJ8KF8k9uxuzze4xGl
 MebSE0JZt4HKxq/TFwEmcQAJhi1ACzF78ymcAPwr/c3lNoPCihG5d+YDXB4mdIeY2msxV7a9z
 m7eY50t0nvySAaDuVqXtRPROBNMEtfSGniMQCdL/M9SX7CP6hM2bbVCAERhgySOyNCwFtGLL9
 lOnIhTp1Z6CNrlaZaLqXuTW5QUO8uYJ9BN4jm+FzV9wr+bCgHedbOEWPOoVMWLJk3eV0fxQba
 PGrru99QeN8pthIaL3rQSjlCjvtdTYRZotYW9IS/T+IaCKIZENRu0IHbXehnfy24nzkdqcOWG
 DFl/FUG2eRqmIoUfdHnBhk8NhFzk8oufsws64=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738679554; x=1739284354; i=fiona.klute@gmx.de;
 bh=beq1GDQOEXmtGxJ6AWkzaD/4ACc+1eO+tcT0qUGH4e4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=qu4ruM8RHhXeU0gO5SDLMAf04uPQHp6PyZ60+Tvy+kuGm68z7OWQSTJq8Gpt0em6
 XdvxzuqMeNL/Ffex0Ue3H9yTDlBPj9M+AbyWcjCm18omOZ4HhbORKUzq2JhiywJIb
 PwOaibQw5PxFJ+WdKApwWpxqWjU6dOQglj+sDzz4Ldm3KF22TwDAnuhVYYbypI3/a
 +VwUpaqxs0HRVvjWDYX3zg4mbHqmXKONk24RBNT4uGZVggEnIdp/Cv3/akgtbkgwp
 N/9Fy11pmM8RKEGySPavTJfesNyqUXuHGmoD4Ox3cN0VPShBrpAuMtCFUQh/7LFIT
 jG4JaQlYhegLTT4vqw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=qu4ruM8R
Subject: [Buildroot] [PATCH 1/1] package/containerd: fix build with
 toolchain without Gold linker
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: yann.morin@orange.com, Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Go forces use of the Gold linker on aarch64 due to a bug in BFD (the
default GNU linker) that is fixed in Binutils >= 2.41 [1]. All
toolchains provided by Buildroot have the fix, and none of them
provide Gold, so the forced setting breaks dynamic linking in
Buildroot. Set EXTLDFLAGS to use BFD instead.

Additionally disable PIE on musl to fix "read-only segment has dynamic
relocations" errors during linking [2].

[1] https://github.com/golang/go/issues/22040
[2] https://github.com/golang/go/issues/17847

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
This patch requires Yann E. Morin's patch that introduces
PACKAGE_EXTLDFLAGS:
https://patchwork.ozlabs.org/project/buildroot/patch/876f3a7bb6a2375193fc8f06ab856d2449f83727.1699547993.git.yann.morin@orange.com/

Based on the linked issue the --no-pie linker flag should be needed
only for musl, but I'd be grateful if anyone could test with glibc.

 package/containerd/containerd.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index ee07c22495..cb648f87a9 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -49,6 +49,20 @@ ifneq ($(BR2_PACKAGE_CONTAINERD_CRI),y)
 CONTAINERD_TAGS += no_cri
 endif
 
+ifeq ($(BR2_aarch64),y)
+# Go forces use of the Gold linker on aarch64 due to a bug in BFD that
+# is fixed in Binutils >= 2.41 (so all versions provided by
+# Buildroot). Forcing Gold will break with toolchains that don't
+# provide it, so override the flag and use BFD.
+# See: https://github.com/golang/go/issues/22040
+CONTAINERD_EXTLDFLAGS += -fuse-ld=bfd
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+# Go exe build with PIE doesn't work with musl.
+# See: https://github.com/golang/go/issues/17847
+CONTAINERD_EXTLDFLAGS += -Wl,--no-pie
+endif
+endif
+
 define CONTAINERD_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 $(@D)/containerd.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/containerd.service
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
