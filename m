Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6F1CA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 11:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CEEC615F7;
	Fri, 29 Aug 2025 11:31:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3NKACWAyJOMx; Fri, 29 Aug 2025 11:31:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93BC561580
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93BC561580;
	Fri, 29 Aug 2025 11:31:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C5EFA69
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B776C41577
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:31:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GLwxpzS60bYp for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 11:31:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 33D6A41559
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33D6A41559
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33D6A41559
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:31:40 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.112.26]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MzhnN-1uVd5E1h8z-017G5e; Fri, 29
 Aug 2025 13:31:37 +0200
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 13:31:19 +0200
Message-ID: <20250829113119.2892270-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250829113119.2892270-1-fiona.klute@gmx.de>
References: <20250829113119.2892270-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:9BDfeJpZ/dMwQm3IBGsLLdu05B8X/VyJD6utZkgjoNWW7E0Pxnf
 w4dGP8cLCBd/tPh7vnS9xS7R3GiAfT2HGvMxn/BkoPr1adxBRsrsR7yBk9U1ch41a5CGQl2
 g4agG0Deiw4ZR3QxsVk2Aj/081bmtoXti10zuu+B6gmkQa9KPdfbbiLSObwvW+ODQxN84mu
 gITpL6UyqFVdkFG93tgrQ==
UI-OutboundReport: notjunk:1;M01:P0:deKXxe7ewQQ=;fRuWqOauL0pOLYHoGaREbe68bFH
 z2KlP0v5+fJRBC/NZbzxZJCcAOp9JVHbT1WIUhUqVRhe37OmwI/oVyKL+NcTpppPPi/f17iWl
 a7D3gGkkAbYKBSJOBAF3w3zBqe14MngDAPtTgsRcBd3UmPeM+IgdenTRflF+IHOeN/0nAPfMi
 iXM0u2tMjylhGCL3L1eXiND3DJf3ZnA1ppMO4FY1Bk25fc1a6C3g4ifXVEQeEMWESBfpqCwZI
 tCaiuiTY4DI0ezUEQ9OIqC6/HZO0a/AFBEPq9A2oEMBFjktaa698CpGrim31G/MdMR82OZo2h
 VHu6e6pDpFtdnYm1OGsp2RHKKT2VgyEkDH3Gf4q42zIchsUqPB9gInOoL5+p3J7voCU0bVZhl
 1YjXGVDS9WUEGlua4R3/EZcQ7TtOIG0yEUX46TwPSOJdMBRMrDj3aZai9FuotTYrukdJDkYdG
 O1dbwRb5Ll8l/cBYqIUFR/2B9k1nkAuQWmZuofVVSxZW9vjeYs7c7pqfMfQ6K6S/KO7Gste/R
 8qHsi2qlyIXtQeOd2LVc5hOaJbX4rg13RlVdf9F8QUeY1or2tKfzgoqZqX6w/fVFt9EbBeE0u
 3Fet7KyBfoCWOySTO5IXW5TC/bZwFtYoKmQS63to0YuYGfVwEog00CiG1hY925BUq/1bpisD0
 bXxIh2BQlH3ihPQKY0yh4d/WYRHEBGysoupmJVDHOq2MIyjxJOxrjXypTRfZ+vzL684WxOB5j
 KRmJFn1MtRmcAJg5RYW91Ae8q1vXgf2jv8fYEOKVWrYAZgQbcPuIz42uuwquiULzQToz96P8b
 KIF0deKlPmfVxuSmyM/OGXohNoN39kpnP39C1th4KkCGzy4IIWnneVcDdBpUN72GaEuXiRsee
 oVXIRKJ28Qvn6KtrCTJE1mzUyzwBS7g+ar3Z/nE2ywK2+Ppjf1wEmRGd8DSTFfCypCpgtwQuz
 LbzbXkfkZDd2aigMl8RzupEPRTDtjbXsG5d4f96c1wX6YMA4I33ELJiuueM7h7ZPDzAYbHdKi
 CvOtnEqB30e34dZYU7mB++UN1htSDct5bpi1D4rhsSW32Fms6kdQLovRDLqMxz+7dFVjm4v12
 znFKzZ+vSThU2Z0JtC04X6txZS1+KOkqkSxNXfcMoDefd53Irk8xWAU4gg4cNSlOs0NqcgELG
 73eeeJZNR9PScbxMyNJCqhtlT2F75x6BsRqFDH44JHSeqOCY1ISfmTSsrV3w+R0C1JsQJmm5v
 dlZ2pYsJ7v269PkLMzEYBxlJGzR0U7uiNnwK4MA09Fr7sWpPBBu+OWcCF1H7d4gZDFkT1rew1
 pwPkooblN2VTNPehXq4xBQMP5xEF8PCxlH3vjLcZGrl/IOfliY3hWcnXARclSU+VCHwBTw8NH
 bZjuI6bFWP1y9uXRbhllmlP0OMxPCAXEhejVbuwsiz1j+Z/0yzLOdBcXLQ8nFasFaLYVoXuQo
 jQjyuSbLTBfQoiZs1SAmrxNYnSebYUxI1Df8dYFmLraxDQExG1i4Nkn4gGzxZa8K20/FSjZuM
 UPZlCc6CTajj2nZ8nUgaKtykHoO5SZC+LYeHE+alvvF7I6IMpsc+6VCG9IoMKzYIE9EHKg0iF
 teW3N4budfhsWkMGArFqCFKb+F/Ea7IG4+bl52d9uVTmPKbwLMzrquHTVvqzAiqDhNayeE2kk
 yhS6mLFq6CIAAdCpMZkxEgBpub+8Jmswp6nrfmNy77tFzyZ7+CVgyKLpv4PCXQnuPy8dd/daE
 siFAK+/ZAC5dFaxavanPVKliTHRc7f6RTTFu4KPDFQaLoienC6Z0r5DCq+7g4APdYI0BJgkTo
 u5WqvGPQS4HrqPqWQBHif4WDMzAlNtv8mG1dNbgxVmTjUhYRLDjOZvjNC+JS8dOwRPBH9jtS3
 sp64OkTqooiRLtBgoPL23w//97/aib4qFD3iwl13PbqLMbYA+kqaei7aMiUmItMJdS0bxgzxF
 p7ZbA7vgpTqcNKStqLaTdfj5jgMDhVmE3BIFxVRTdl7mtV7yuPRCQrwlG16zPX0xxx+LsW/CW
 bUiWxWiLHbsYQPiGPCD4eQ+qosIpyI6iy+HTpbJ65d9nLlZQykdlokGEMXnaqX3faklinWmo5
 dVzBOT3neq4TJdj48JddD4vLJhKrE/8B3Oecnk7tRsXMOvvrHBXyPDvVPs/rC837MdHOm/wmN
 W6tOQu4IckCckskUDpwl7kU9DT23QwXFJ/GuUkxBmNkvXHn0DPx6JwMRKPB9a4Bw9/Rv9YqDI
 V7fRoRQ59XF2ybltJqKV6dlH/xERItK1kaEvBvtxmKaFDb0Ues/gPtRvv4ASxHQCPZxb8OxbZ
 PN8+3Mgt3hNVARabBowyop3VqVdO1bafMGaQLFHS3lt7J8nAtiKIG0QQJuCOfMGipmNbHbBOZ
 ZtsrcQ1XYJewDsaP6S9KIkAsqDl8gxlOFDrwsdiUfGfhcFn/rSM/GB3zjvy3cd8s+Act0ZyYm
 DyWBxtkQBUjtZEV2L4mfCfWiFNfPGsLzGltCnNyMEVFn8bXZmzw93EfGaBfI8ynEDL6mhOW4p
 8uiFgNxYzA8DI4UEe+0x5iWJMZPxGT2GPgF6bbVJlyvWMzqv7IqSy/jaTB+bWJwifBdUYFF1M
 BQADYy8JLK8PhB4SwW6TGASvSNMd74ArpKiAu1H+k61Q+KfNu08dd1yALusXZzHT6QlxbuGSZ
 hR0zb2t1ICFHn6bffzeELG6SpF6tXR+csc3Lujnb7MYDtk9lblZH0BROuPKjRegJhjvKu6O65
 fDwOeiR4HBL7KlzFdsJ9cuEpbApiM58xYsKkkytC7OV9M6RwH4LPcOwZB2y/AiHp7qUqXDp5f
 hyhg0LMk9E/piohY5bv33pMcv0mbOYk+mZLtKW1qsUDIuogvBPMQpm1PXBwwpXzi8HAjSaHty
 +0U8kBQ5xTuRfYHK/M4peEpX+Gr15aT55To45xV9zylMWDjttq//XL5yS2uXkz02bfreirLg1
 /qOazlCZWJVUZ+plqpETblUR0Ycy80e7bkSkAV4gDFhic3DtThkHOqj+n72iJRM1a7kV9ehfs
 yj7C1T0BRTPauEV0cV6Lx3Ri70Rgqhpjr7dCDGfOf9Gn9Prd8SgT0cjQfrLgCQd1WlJ0Csxto
 XxW+BrweWy3oi0m6ILxN+4zLDuE5NdHawC7A/+XM62QReSNLqOYCZgn3zJtDpNFwZszNRs+yp
 sQ35VvzhglGI9y3karO3ham9+HxHA8Sbqtypv7WOgJF/4TbM1uUuewB9GavssuhsZsLjaB93L
 QgYv+MFBTC89JFMjeOG7Wj69nuATue/lkUKN0nlXdTx6d0sQwm/3Rm3wQWkuxRRBGXf2FKQIm
 NfIu/ofglDtov1rtrStkDbo1wdYv1tARHXX2oJzLjl4W8umofs2JDgfhHazBpDI6OBLSfYKxI
 xryB80gZVMMIrombPWkOSUIpTSOrJ7eSHfEXsVKThsTcJkQ6aigelsTq0w4wcTy9mSeSUpsCJ
 I26v73tYA3kkIH4Z4wC3jEO/lcIrEwJORH0casXx/WvkiinfqEDhuDRCuJdISPABFRmBGAiR3
 wHlZ5tXSgLITzSO1p9Vh7j0bUkmt6xK+ldgdonTop31LPv2oiG8k9z0Bh9jDOMgLxlO15HT5t
 LAfo7lX7MJ6smhh06fUotlHcLqd7d1FO2oyxDb2/0qfi0wNl7mQfrZ1mRfei1u8BuaNFGc5J4
 aUiyYnwostIiNF8IszxODe2ojzC2bnTQ/A9HlDgIcYviiZZ28DXGOy11LrfXG0EuD3yJA28fA
 Qv7lc0nbBA8HdVWntokczSFpCRAJuFTbsi/Na8aQCxcjzC8G4ebiJdWll8mTjHh0HmqVQehna
 YWNG3hoQbujZf6bIDmt2fhAqMIobvOefFdjB077YGUGnqamS6egQl9VYKxFJjfFWExPKnaG0l
 Eo6cj3l5ZCuRmOcy8EMInTDeDm3zHNn8UIAkvb7sgaXC+9rFyOAjpy/dztTclCbNBMkZi4pJ1
 xt0hjUlh+1jjBUHVT+R026lv6jx15LxUBXqs4zU99UmC1AnsuH/ikMANF4PReXVeB+809D45G
 /89Ag8jVpSCUkxlNjCkVBrp0zIxKFSgc+wLr4C/xBFmYNUR0ac3khqU9F/96od4Luc01wDXMe
 XFQQ0ki4Yyqn7rv73uH+MsRBqy4DOXwIrVQ6mOn4hFFthvMyxa80wjTHozlHHjCVbT248Eh8U
 /K2fQE5fsz3pGb89n8rQy5wp2H7leRrgWdmfzyzKrupyFhdMQoQoeQ9+vXzZOa2YnWXeuaW5f
 dMz3cunTh09ehNWpMU/XTY3abSe4g9aSP3JEdweYOReRCxlCQ5iOKRIExjxYz7GZQ/d0HT95O
 3jqxQdY76WV3meT07KcN84WmBeh3V5vNos3mz/SZ4aja7g9R1TWngN+V0nbTs1fuHRNwxGUhO
 RHgrUW8QH8smOoINENfX1e9hWs7ioXA39juIv79vCi3nd++8mTbn/qCj0DZVySKq74PnNZPR+
 DrGOjEmBsJJ+tlDZs8nXBVoO403f/du7gtHcA3u7+uEC+jmyPQ2uoNzTqUCYpG4FemeKCdZqC
 SCru6di7Ku0NPRT0eiqBmKhGLZnbccpNrZw+4Ewahk54SQKpx5Xx4IU4P88afPFKpiNuUZWNz
 MoJGdVCwvN8VP18dX73WPScs97l74+mfgQ5NkO8p2Onc6tZDiuRSL9s+zvB368UGa2NroyZ82
 C2PFZfwQaky9t/6B3rS89XM51CLuU5fRJtS0ehsqhOFL8u1urDMudfpfhObrrzA6DAJuAekTA
 tARMsvMlwjHBQ0K0a4P7ehBJe+KzD7y5c5rJ+X41QpEASzPuszHvfCAoynuJEOE5HrNyrtPbC
 B52sEF8NDY
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1756467097; x=1757071897; i=fiona.klute@gmx.de;
 bh=ZRXQOf4Cmoe8o7iOTCB0rHDyRdd4lgOAkCDToOvlgwU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=YWb8WRIHkvQkl6srwrZiwThOXcjuaat0Z3PwLID/0UwOPmtyuOIwlwmtSf03cUKT
 459FDTRbEDbeM0G7VgknXUDFH5He+tjQHGL685uoCqIVoAHChBYhSffTuJO0IJGeU
 EDNUyGz9d5XAMtg0d8EzJc1FPTd+oYd6/pQ+k4x8YQ1vdg8cI62SWSjsItN/SryP1
 qmt9sOnc5xVLGiAindiDR0EgG8wuECdfZJr5jalStYKS1qa9ylixSdI0NesH2dSf+
 nljiuYhDGoqvXauSaw1ZhmSVBu3Wbgyvn9QqsQ1ZLgICStGFvXA+ZWbrUQ8N/YroQ
 TIzoQsDe++SJb0xdBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=YWb8WRIH
Subject: [Buildroot] [PATCH v3 2/2] package/docker-engine: depend on cgroup
 v2 and kernel >=5.2 without systemd
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>, romain.naour@smile.fr,
 Christian Stewart <christian@aperture.us>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Without systemd package/docker-engine requires another way to mount
/sys/fs/cgroup, so far provided by BR2_PACKAGE_CGROUPFS_MOUNT for
cgroup v1. Replace this with BR2_PACKAGE_CGROUPFS_V2_MOUNT for cgroup
v2 support. 5.2 is the minimum recommended version for cgroup v2
support according to the Docker documentation: "v4.15 or later (v5.2
or later is recommended)" [1].

Depending on the selected container runtime users may need to adjust
kernel configurations to enable options required by that runtime with
cgroup v2 (e.g. CONFIG_CGROUP_BPF for runc).

Propagate dependencies accordingly: The Docker btrfs filesystem driver
does not need a separate and lower minimum headers version,
package/mender-update-modules needs to apply the new "depends on".

[1] https://docs.docker.com/engine/containers/runmetrics/#running-docker-on-cgroup-v2

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v2 -> v3:
* Require headers >= 5.2 (minimum Docker recommendation) and select
  BR2_PACKAGE_CGROUPFS_V2_MOUNT instead of splitting at 5.4 (longterm
  kernel, and "stable" toolchain used in tests)
* Propagate "depends on" accordingly.
* @Christian, I've dropped your Reviewed-By due to the major
  changes. Of course you're welcome to re-add it.

Changes v1 -> v2: None

I haven't touched other packages that currently rely on
BR2_PACKAGE_CGROUPFS_MOUNT as I don't have a good way to test them,
but I'd recommend switching them to cgroup v2 as well.

 package/docker-engine/Config.in         | 13 +++++--------
 package/mender-update-modules/Config.in |  7 ++++---
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 6338eeeef1..ae07b5e19d 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -3,11 +3,12 @@ config BR2_PACKAGE_DOCKER_ENGINE
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # containerd -> runc
 	depends on BR2_USE_MMU # containerd
+	depends on !BR2_PACKAGE_CGROUPFS_MOUNT
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # libseccomp
-	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime dependency
+	select BR2_PACKAGE_CGROUPFS_V2_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime dependency
 	select BR2_PACKAGE_CONTAINERD # runtime dependency
 	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_IPTABLES # runtime dependency
@@ -22,13 +23,9 @@ if BR2_PACKAGE_DOCKER_ENGINE
 
 config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS
 	bool "btrfs filesystem driver"
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
 	help
 	  Build the btrfs filesystem driver for Docker.
 
-comment "brtfs filesystem driver needs headers >= 4.12"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
-
 config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_DEVICEMAPPER
 	bool "devicemapper filesystem driver"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
@@ -83,11 +80,11 @@ config BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_NAME
 
 endif
 
-comment "docker-engine needs a glibc or musl toolchain w/ threads, headers >= 3.17"
+comment "docker-engine needs a glibc or musl toolchain w/ threads, headers >= 5.2"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_TOOLCHAIN_USES_UCLIBC || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
 	depends on BR2_USE_MMU
diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index 76158ab6c7..e71309c3d6 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -79,8 +79,9 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_DOCKER
 	depends on BR2_TOOLCHAIN_HAS_THREADS # docker-engine, docker-cli
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # containerd -> runc
 	depends on BR2_USE_MMU # containerd
+	depends on !BR2_PACKAGE_CGROUPFS_MOUNT # docker-engine
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # libseccom
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2 # docker-engine
 	select BR2_PACKAGE_DOCKER_ENGINE
 	select BR2_PACKAGE_DOCKER_CLI
 	select BR2_PACKAGE_JQ # runtime
@@ -97,13 +98,13 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_DOCKER
 
 	  https://github.com/mendersoftware/mender-update-modules/tree/master/docker
 
-comment "docker support needs a glibc or musl toolchain w/ threads, headers >= 3.17"
+comment "docker support needs a glibc or musl toolchain w/ threads, headers >= 5.2"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_TOOLCHAIN_USES_UCLIBC || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
 	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_MENDER_UPDATE_MODULES_IPK
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
