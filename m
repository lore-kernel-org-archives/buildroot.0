Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EB2CF11F8
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 13:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80FC241025;
	Thu, 10 Oct 2024 13:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VRrqK7jXFDkm; Thu, 10 Oct 2024 13:54:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE97F41044
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE97F41044;
	Thu, 10 Oct 2024 13:54:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11EC01BF427
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 13:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02295810F6
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 13:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Thkv3LdsoF95 for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 13:53:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9388A810F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9388A810F1
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9388A810F1
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 13:53:55 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.249]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mt79P-1trP6v1UxF-00scls; Thu, 10
 Oct 2024 15:53:52 +0200
To: buildroot@buildroot.org
Date: Thu, 10 Oct 2024 15:53:11 +0200
Message-ID: <20241010135318.3064224-5-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241010135318.3064224-1-fiona.klute@gmx.de>
References: <20241010135318.3064224-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:HStWARAaO6RLiFKMuWQf1gQBHDA4tMtmIuVs5jWsyuysfxKqN+s
 GcFBjq14IfSTFL3xmdkyPsGWhCPsAMLbMa3w4UpY/SGWqoVwM64tfIo1FBNKK5sp0EO7ulF
 djvKR1U1fKrZOu5QCKmT3A75JzttuKCag5hdNdX7VPttRl8m1nIeQI0akTL+lzVyWiENmUp
 C4Yz800AAYxBQG3f1rj+A==
UI-OutboundReport: notjunk:1;M01:P0:6SAabpc0Jq8=;BEZAq7jeji4K+1yeTkhCermxYAS
 E1impWejXV2idHKZyZ4u2DyEvfQok5xdX0oY9qUph0sFPrLzhDE3r6OKjbRXpBmHkzoitwdRp
 EHSClTXfeJle4a2V5SFh584LT1MoQS3ybFGMs/QlWpQhA8SmdiateIVp+PzTtBLoaLuLmohj0
 sG7gJJMSAi5yqt4xXU5wnVb1IpSEKMyNK9IyTRFad393oC6J1XEaDMNU73FHxAisgSEv3t9aP
 7F7w0op8I3cUJs9M8LmfKhI9hOeLIqETzfxeus9p/Sm0f90VvUm7JG/JNSJBgejh8izudyAqM
 ENaN03y1OMBkPqiUe9t8LMaNvcBEworVl3bF23dR4OrN4phXf0PyZHY4Duv6ttkNvvKKSLIPr
 Z+3QdvsEXwQPr8Fophij8CC9XkxGorgf2aTra2ollf/rS+QYrQYnrI+JW28x0rU3UecLTlA88
 /lrz+Eh2FP7wHBHmw7q6nBTgyGiqrmwJIKAsRsECZZIJoKFNU3I+orYrsUcUpB9vyapSiNFxl
 kjn9RGODexU6gmnoiVwRr6b1OedPYEXdusyjQII8cD1OKQnu+CoA8NJQp8c7LFen+Ht5p3Ruf
 q67ROtGl4g4cq4JQa2sooDs5KWHq6j263hyZeQsg2ps6wQGwzLL9Bt3e+CVhqGhg9CwgW9rBS
 zm588aje9XSlUnLwVJKCFSH/kVmnYzIu+ad5twSPREHNYJXglQqb6Gon4pyGJ5wWBlSPQWx+g
 JJ0ix14/CnC9ny1r9No26tCO/bp41t34T5+OeNLmL8x2DmQ3n06vZeSBRP3NF+ERSYTxztC23
 eMQ0c4fcwE82t/FelMyZYbQi8U3qA4ZHBi9weQ5ykTPTk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1728568432; x=1729173232; i=fiona.klute@gmx.de;
 bh=m4XkB+4IF2szZ/IC1W/BaEqEIf4/gGRfl71gHHiF4bQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Bd5qQhW5r8wxFyDUMprf9PNtJzcjQBjgAaezAxZgRFpfzt9jEB2bVvbyS7zAwuc8
 uB1EKdzW6rJewdT+GbteFLNTIrnwlag3Q6KwzP/0Tm4rX/fQyYvrSJuKUJGCR2Kse
 OOZ88zjJWrIByhUK5wnVr1iXYxhYKY9N1JdpMydemqnTMDx4jeFPclofmnLZ4uw4i
 BHNpV0HKG++fVKz63hfCUkReJXCGU2GstzC8PulpWRGUpuLU9ya9fgaFqOoUWlGkQ
 6EZGrspUohVV+D9RijnHrrg+21psWJinCgt3koyS7dJ5vurfDGhjzu80rTvL7EMVN
 yRKqj3cWLuvqoSSCPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Bd5qQhW5
Subject: [Buildroot] [PATCH v5 4/7] package/gobject-introspection: works
 with musl now
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Fiona Klute <fiona.klute@gmx.de>
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
index b8a9e244a6..042760b430 100644
--- a/package/gobject-introspection/Config.in
+++ b/package/gobject-introspection/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_GOBJECT_INTROSPECTION
 	# can be verified.
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_HOST_GCC_AT_LEAST_8 # host-qemu
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
 	# gobject-introspection does not require python3 to run on the
 	# target; however, because the tools run in a qemu wrapper, a
 	# cross-compiled python3 must be installed to staging. As there
@@ -42,9 +42,9 @@ comment "gobject-introspection needs python3"
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
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
