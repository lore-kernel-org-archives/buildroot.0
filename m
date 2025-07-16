Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95482C83F27
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 14:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D3A0413DF;
	Wed, 16 Jul 2025 14:33:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z511tt4yemKf; Wed, 16 Jul 2025 14:33:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ACF14148A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2ACF14148A;
	Wed, 16 Jul 2025 14:33:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D90D41514
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 14:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D69AA60E52
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 14:33:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ea9e5oRUv8f5 for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 14:33:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C842E60AE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C842E60AE5
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C842E60AE5
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 14:33:01 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.122.179]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MybGX-1upzCY1vbB-00qog2; Wed, 16
 Jul 2025 16:32:59 +0200
To: buildroot@buildroot.org
Cc: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Wed, 16 Jul 2025 16:32:40 +0200
Message-ID: <20250716143240.1354630-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250716143240.1354630-1-fiona.klute@gmx.de>
References: <20250716143240.1354630-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:hl+SA0vvf1yAAbreqvx/wFVq02mM9r0M/ojZPT4AJvrgj5xPRmt
 BHtXrDbdlAEvTQykXWYZORq2WRrOlgBbqLk2iak/8QHvtTGKnDM94nYHHFXgGhfRA6nspqm
 l9WdiqVWiHLFrJ6gpfN1rmt4EK2v8zJfR/6Z3dE8GTKGPDoydtLFrb7iFIMVWwYaC/GVmFN
 xvXBpYGS6kyVA8CwftZuw==
UI-OutboundReport: notjunk:1;M01:P0:a0RpJhFn+pk=;wXk13zpU8lglMtx+WBzR8nQVzf4
 64Z7UYGYAVtztgvNVynj7RRKVpvVbK8aE9o04ECk1nGqbE3AIhD1QI/vgBPCaPMZGPGvx2NjO
 UFN2/NarFMTcg582NX2e4g6mjVuVdcRQBP4V2UW3ZoxLV9JnOr4UZrYXBrGjeybR9khksYDLw
 nWiKqZ+S7oLejiqCC3XfwXEcNODXCm1JpgVo7bxcO3uh1xO/1PAPfXEMhJ2vUbmI6Yi1+ukIV
 m2TMWZ7kC6j9ryrFIPojb+e4r8suJJCoBkyCjGTvRS9SDYabpL04thLh4CPUc5wd0mOq3pphZ
 OAppmnnVKW8odu9okRTD3Ru61BGiiUctMB5fzg16+E5GDUlx0z0hSPN4NFLb/PPF6R2z1CFLf
 GaCJ/PO+T6Cvo6XZrNXuyMYUkb+rVXzRIx1E7JNZU7tQDPyh9644c3yZV95LTFD2RC2i1Wp9U
 aqeWIgM/AJk9FWiiE6bQrhg7TH6dQLn3LuxCmgvnAh1j+MCha1PT928Ydj8KZEG+eKVypYAU8
 08qW8yabbSz6IrwIab5SLVWgtwlEM1LcVyyj1eJ8F2jt1MrVnO/RFssi018hSpsJ1A5MgPLXa
 pCHOE9WI9quZPXIOK4WRXcA3aAwjIwIUzORYGq5Ldd8e2Szb3IkfxmpFx64BoBqObgg/hUjIz
 VhxZaQc4z1YJ9VJcSx42k+qSifjGx4SRTqcpkqO7V8INDuo7bVIjXvuTb9pkzYL6XXpWx/Myq
 VKra0VXiyMQuLkZO8CxUhsmvPUnFFYqB6P26zQC4U35iYqPQ1evRBNBiIhWo2ofTWLtdJCVQ9
 blK7RwQiqRvzvI96Q41O7M5yfe3S+F4Gj62+rtBq9G0gVv1Rxv/yzmgun4BxV8yXenXfq0VeS
 VGWMj8ZETFBU0CjVjmPnL8c3DkYa5e/1efbtRsaqNCTqCxvK9XOdtjNcoJxB6ghenLKA8EhRi
 IFtgdjbXkOXi1UL5dmMoaMdpfLOJkeTSiWrpCXzph4OAOAD2swGSd1giRmnCGx7nv8ifKYDa+
 fWxVe6wnbrimMG1fDTc4hSYRjO1yrr5kUa/AcG9TvhRmvcJt/MWW8lu7X+PbZ4I0zh0j+eJIC
 ejKkMttZyrKoxoR+GtNH6aV7AxzuGNaQ3H3le+lVHBcS9BkKszd05c/qdAT9ef8iG1BikPqiJ
 h0S0aDZGw/ptQXPahOq1z5VZs7HSZIH/vihc6ImfzPvwrtD/5h94/TCRbtsoQiZcA1dXR0B9u
 jS1EMrNlLhraMokTgg6YBkBDhzFK1E7h3GS2vNRwLHcz99RVtm+9vYyl0tWE9G7uVGz553NUE
 eKuKvaEsuS+kcEFmd5tXoMF2iHLSGwQ34bwcbRgmXykLBl56otNyGh+//ckMdKfij02DNByuP
 SHDxMyuYU+8Vysy43uxLRfnBZsiTOPzdVrt1VdCVIJYCZx55swBpklqvuetik8XHrN77JGchz
 v2AaGkHycTjUnpxBtCrYdhLVaH/W3RiVBSFtSHqB885EjlwIlycMywQ05eFSdrx2dvbTH5p8J
 4wuN3S5svqoBsqtYU7D4GES8+u817vR5PIeVx+khgswL5Lef/ppYb/5EPn0ZS8OSCW/6gAkRq
 S1uWDrcSSohLc6steBYmnFEdYk/QLKl+bJUg+PhZZsWtro46fJLpD70h+8QwbogIMj3UE9jps
 UfoqBab/up2zfFHmrNPk1zcnl+3ERqJGPMeiH0F+lo3lQHCB9phC5pDSIYg+gSAZef6s8vOvP
 bZRRWjOC9X++SeV8tp7vz3zKETCyy2SyCDRLBxwO90CyRYA21+STck0M3fOwp5nINfx0ikp64
 hSVaIsvGncUHDFiDDxmOiNGC+0WYIs8L/IchPNMmZ+ymmGYyrzmp1v3OYjD3P2C5sX5Vedx/u
 hx0fAggngUrj9dRgygMI3pG9hQLwmRAUA8orYiGjZi7KiOyXu9dq3kk0mO0m0oQrF4Uhbqwkn
 A8oBOKuQqa5s69fMrgB3OCrHVMJGaaoEG5cdjKnt7c9STEG7eEk2414wtPVejuPNWusPQbuUp
 AFNZAr3Y5FDVwXIayiHvnid2CadGA9Y8nOjHn13AFN8Oz5Xpa/bTufPvE3rMK38m0W2rvct+y
 jEttcwojcH09mWF27onAeH7mS5K/lwjZtNzNf4PPIRuXZYVBj6ftJeGiSIxNV1SQTYDZY09QJ
 54VRFgIbv/ceEDXpTw1EJEAsCGP+He+Fz7ECC/5jKu6ULWPuhcITD9SdzRCP33/d1lkTAmC8S
 bJw42IFTBMDDRfMtATx3Rnp/jTipoUDPJ4BAsBdA1vheSvzTdY42WBtEGep0+w4mWo0RUiMi3
 fuKoR3hYglYMwX5I7ss+vWBplanCaA2ZHnsg0+zFY1kIbMtYh241GyE8YCHL/TGEaSmZnzQqM
 p10SIERQ9mWsYuie2VHZqZW4LvohhS7PItGwjH5467cUo7QZlnEDd9U1zceA9GhMkNqps5c55
 OIxQexli51nKqugnZaJ30GjOSe0gvZnctBCfz5/sxgtiWQpWsd9pThsfyN1f+KeYGO/xp+joP
 qbmZpzzTmDU/S8qfBshjtcwDvrmArG63/F7nRpok95LGDSVwVOjCkSG/fl/eaXrDhj9myNm59
 Ryl665821MDFz+gN7d4FsWZjWWei+M6ZoEYMWlambsVZFTFhdBqGztwQFb0j+M/ZO6MpFxps1
 fgujknrHOmOOibFWi3/R5R1qW8oy3Yg87WRbRpwDaiHtksOQMxSNFCa/ggJPzhkK6e5EW9m43
 gsFmGgb5NK5dITAce6FKU7Kme/smpf1I9+S6Te7qZaglWDC16o1XpsAKzZPpIL1eQ05qG8WCw
 qoEym0rKS4sOC25u/mm3qGL4KzZXvBzmBsl9PrZnlj5eZGXCHcH6Rn+xwh29bRK02KJ6kJh5N
 VyeJyrzA3tjLviEffjk4MIY2U0vo8x+ddiwSxhs0D3v4LSVKrROupCMotk6nDvwecfkKrZzry
 +Kf6WyKo8ifNccbcH8o2yVyyHkyIQ92ijQJ8Ph0H90pOfCsODHAXgckZZWa/v7IeI/jKpSyEP
 xG+MJQT6/ed6/XZpptGUjQTBaaLo8ehx9HPqyuIq5PD8IrH/s8AdaF1XruNI8HOJYCaxb+LOj
 JQeCnG58dfedEprOmOTtlAHNgp6hjACr6JBURj/7TfE4M8p9GqDVWJon6LFJGlizpZAa37pbm
 P7E/8gOc+SRAA5dLk2cfkStLbe3WLsT+pRlz+20ApGd5Hp69lZyyU3f3pnsJV7DVx6f8Lww7P
 AJfvY/MvrJs11iaVkuJ7ODN0FRNaMgbfZchFCtB7y5LQhhBs3lh+7SOcdQ9R5/TNgCbKfV7Ts
 Nr4+9D6N6mmK31tWzqVxV8n67uO9RYdLgz9INyP+CpdBmTqvN7jVq9RZU2fgwtTmGcPcWVHcP
 H6qJeE36YHTzbSos/wlwvWbZ+3NmlbMVT6EKMOcWN2mlodnFtYjxnN79qSaE9VIEdQQwYcopu
 FlBkd3sYh500+nYQWOP7ceVWN3JDw70KOdTwIr9T3+CFFCdHCk3/T4FykmaZ7IXnNX44+pzBM
 51dfcJrONkPfoIggAgVvq4iH1lqw6iCE92vsz/av3S9AJ2jS6SLKPpw7L5yiFAXyuh/qDiJ5L
 ZLJIJKLCYBCeKBrJ6PGT2NNNAUiV7ti/O/UieGhmIbV/wmVQc+cv7+Xy10wTJfccpb/laj0j4
 Zowvui5Z9zTV2UkDa1qc5xmt9eQJY8vgUs16OqjZimwSEhRcgWNdMaPvfbInyMmAX3Uwg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1752676380; x=1753281180; i=fiona.klute@gmx.de;
 bh=io3js0BBpsnY1j+hMTk8NFvHHCwJQkxhYsrEFRuS9aM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=U1dTDwpK2Q7CHwxHddWUcJDvQYmQa22PMr0sf2YWtc8+TR5aGJon8brzS/w5h8MM
 S7fHtuJGcNeL9kt5FdYfcYBMPoreQk5OVwsYAOao9AV7dxRMCccQml0fPZ0CutrMT
 q/PRRLpKXnR8LZapF0GR7V7Jm6E8/GJQtz8vaSqGIHrB3blZLdmSnEIo7EkDfaK7x
 wBsMgRcx8Lo+3Pj5RtTgXVf0fT9yIi3xQDdWf5fLg5f10gI8vqECc1fZZia/MwwCF
 HlzwKO89D8evn/LUEVfVSuu3ZNIooWImv0qBSObMDJx8e4CSpffmZhRqGyEeeXt6F
 2GYzkoMCWuiURlMOrA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=U1dTDwpK
Subject: [Buildroot] [PATCH 2/2] package/network-manager: set "nft" path if
 BR2_PACKAGE_NFTABLES=y
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Nftables should be preferred over iptables if available, which
NetworkManager will do if both paths are set.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/network-manager/network-manager.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 8c517c49e6..1bec053c54 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -131,6 +131,10 @@ else
 NETWORK_MANAGER_CONF_OPTS += -Dnmtui=false
 endif
 
+ifeq ($(BR2_PACKAGE_NFTABLES),y)
+NETWORK_MANAGER_CONF_OPTS += -Dnft=/usr/sbin/nft
+endif
+
 ifeq ($(BR2_PACKAGE_OFONO),y)
 NETWORK_MANAGER_DEPENDENCIES += ofono
 NETWORK_MANAGER_CONF_OPTS += -Dofono=true
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
