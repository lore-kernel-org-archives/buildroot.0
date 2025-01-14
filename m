Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965CFE77188
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 11:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B54C60EA1;
	Tue, 14 Jan 2025 11:32:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id flKEdLrkgKEv; Tue, 14 Jan 2025 11:32:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3592D60EA2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3592D60EA2;
	Tue, 14 Jan 2025 11:32:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D8FF694B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 11:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA72180407
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 11:32:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xBbPymyRzlUl for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 11:32:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4FABE8088F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FABE8088F
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4FABE8088F
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 11:32:27 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.119.28]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXXuB-1u3GFD2uJL-00XcWE; Tue, 14
 Jan 2025 12:32:24 +0100
To: buildroot@buildroot.org
Date: Tue, 14 Jan 2025 12:32:09 +0100
Message-ID: <20250114113212.1791033-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250114113212.1791033-1-fiona.klute@gmx.de>
References: <20250114113212.1791033-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:U9mVJ/L8gPfhGy/IGjNCdFKjDTOjvX+V7bLsp3dpl9awlUUBokH
 puJ7AJDyQhSMx1hYf617ux2mjEy2u5QT6+PbILtxu71oH4vxZJ+tCiorTjH8N0pK6AXr6D7
 PXxUEQCJR25sISCvdwnQY7Wk/P/PndQ8VYWUymGW1YY5F+1i8NgjpM+/FMdRKv/srjArn3q
 gz4OQWC6nCM/yqiXZ7OLw==
UI-OutboundReport: notjunk:1;M01:P0:C2gY3GO/4FE=;VPkXz34TaIFKG3yzzhGm5GF5W2g
 917ZmybsntPXYdH9c20O6ozo3dLdEiyQamGKxi+dCnm0RFkPCyZLUNQr7B21lWyYakyp7dxtk
 hBNZqmqC4DuhZb/ulichoINcN08gzs52QfTunuElmBxMJjyY7NHjk42CvByc7hshIlxlSSbKY
 ecfr1VvV/rSIxz2rY9m524Xa5fE8cuiC1oeJbRgtT3EA4hOpQXEFerfFhxUKTOz+GAPhmIE6k
 V46OjLBbtz7T/xLBI9rx2xBAeCAR4LhUFcp1ieBFGkq77RDHs3z2o20JKjNHPl/Py+YrqpDsC
 GCdMLr+ELQlYEXaUxKjcwunoJAMgC47XDFtneu0zUtjiuYD2QuFj20xWZUB/GFWhpN+XXjfHk
 ByhUSjXTMP/H0FTuinBflScvLMcywuvvKqGbBbon33YK6uYacm7YnnhUg7QwO/vYNWMP3TbmK
 xZZm1ylCo8ek6L46ZojeZWaz7FiOapmZ46Vdt1Xh3gaKvwJcEY2IIReVCLnOzZk91ixVDhwrO
 qFSA0YLy1+v9wkKP9LNUt5TMl+2mhsC6u2FkiBTyauaPgk9r/Mfnyi3nfcxTMII3qfzH1UIcN
 IjpsZ9GQDlbn9lno/w9hwZSijIUCQPy5dFplOuH4W3SDWFwEnJmbpkmus9IIUimo196NdJRIj
 KnicPCYZD7BnHvxum49zfW6F0EAzgo6/jeNED9Zs7wWlIWZXcCnCEH30J8LGYeLHcSDhnP7aZ
 Ai7wLrvPsZ5Bp/UvvIsQh+hxqbMsrbFUL55nyVgPVikPS/mUJynbDX1oGRzyT4vaakoR9qlHX
 NJEfTESshSa8LnQhWDFYBFzUWXIcmsj6CpbanPlP2yAK52thbAIFzkSqGx5Cvda8dwvZRDW1c
 K3L+t1fp4CLXZN08IyGqUakwdaPGbQwuAyd11778tglmDBk+ca/lZOSPRAxSqyhDfCx7HWAjn
 l2E0uLFGF7flSawui/1/kjxpsPf6qlYuzGR84uHnlG2Le3NaJ4DI+JCs15YSV72EoNLejSZz2
 7f2hz/M5zKNgszI//+Z6gd1Y0K0fa5/HQ8senscR6zpqeXmK8FC1YU3HGTvPu+OoOqqkru0Sx
 AdbO90XNmiQCdiZEJdzjnX0eXEIsr4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1736854344; x=1737459144; i=fiona.klute@gmx.de;
 bh=vqw6D5wbXbZnEDcVhsbVe6z0Da5QV1DyPgVq/ZA8o38=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=TMOjcLuKIjgLtoVT3KQX+r8Ez++7w7i19/dBeD0K63cTxAwMDqFwocseyzpz6gpZ
 cZVVqI1UBMMT/KhEiaRlp+6ALkMS4G2YmQpNmJ29Jyj7TGPzqLMFPRHlzA9KZkovG
 jdE151/SHFhm/KEHRTMX2GOpOfhU6mBGiALp23sgarQLXgVItO+BWec9Tsf/Qa8m+
 cUNjzbbGHE+l7gw4a18SzLIuEAOPhSvsema3VgRs4kk/Mk9b5ekHp/38jHETXb6Z3
 JWJ8kbp1yPCM6lvaAlrzszoloLC21NREFYVmzgDtCdpn9t8IvyNJUf83q2Pmm7Lmc
 vzLII6M+CC/0PEM6ow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=TMOjcLuK
Subject: [Buildroot] [PATCH v8 3/6] package/gobject-introspection: works
 with musl now
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Current versions of gobject-introspection build with musl (Alpine
dropped the last compatibility patch with the update to 1.80.1 [0]), so
relax the dependency on glibc.

[0] https://gitlab.alpinelinux.org/alpine/aports/-/commit/528c4ee63970fe6ee733b6ea99ef7a59a8f108ff

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
[yann.morin.1998@free.fr: split off to its own patch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gobject-introspection/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
index 7b47c9561e..54a33d8666 100644
--- a/package/gobject-introspection/Config.in
+++ b/package/gobject-introspection/Config.in
@@ -19,7 +19,7 @@ config BR2_PACKAGE_GOBJECT_INTROSPECTION
 	# can be verified.
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_HOST_GCC_AT_LEAST_8 # host-qemu
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
 	# gobject-introspection does not require python3 to run on the
 	# target; however, because the tools run in a qemu wrapper, a
 	# cross-compiled python3 must be installed to staging. As there
@@ -48,9 +48,9 @@ comment "gobject-introspection needs python3"
 	depends on !BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 
-comment "gobject-introspection needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
+comment "gobject-introspection needs a glibc or musl toolchain, gcc >= 4.9, host gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_HOST_GCC_AT_LEAST_8
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
