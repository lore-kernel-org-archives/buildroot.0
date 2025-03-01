Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1061DC021B8
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 12:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D29936FC73;
	Sat,  1 Mar 2025 12:52:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LBmxg4MinO92; Sat,  1 Mar 2025 12:52:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F38586FC41
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F38586FC41;
	Sat,  1 Mar 2025 12:52:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FF6C181
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 12:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D263404F8
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 12:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8yxb5b03Mrai for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 12:52:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0848E40B29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0848E40B29
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0848E40B29
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 12:52:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 46BFEB0055A;
 Sat,  1 Mar 2025 13:52:14 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Mar 2025 13:52:14 +0100
MIME-Version: 1.0
Date: Sat, 01 Mar 2025 13:52:14 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Cc: buildroot@buildroot.org, Gary Bisson <bisson.gary@gmail.com>, Chris
 Dimich <chris.dimich@boundarydevices.com>, Refik Tuzakli
 <tuzakli.refik@gmail.com>
In-Reply-To: <20250205-imx-packages-bump-v1-1-2f11b86d2da5@armadeus.com>
References: <20250205-imx-packages-bump-v1-0-2f11b86d2da5@armadeus.com>
 <20250205-imx-packages-bump-v1-1-2f11b86d2da5@armadeus.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <06a9719a2eb955a091e37f2bf23c8112@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740833538;
 bh=m9c5xiNU21kshPbee9G1aNEPJfpzRm4OOYqTliOM7+E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Wgxm4dYu/t7pBIHKxFLodMyzgvClRYKTPDKM0aDMUKWAknFpoiE9Zt0K40/z9JkL4
 hg76zE2Q+EE+n5cKUHukO0imfcyspbLSpnDSV5HMRd82x6ecvgT9fc7ahjGcbeO8OM
 DScW4trMdQABooJM3wlKtr4w8bHSkHoJ5+T07usxwxdY1mbs2lt3EAypJYDrqehWkc
 ciMxOpkBVQBLNs6ix7ArkYjnO/OxPqrujeAsZE2GEbHA0Q7nDFjI4ChjpdCJlLsJgd
 TPmSbUQMeJPVnUoGibClB8LZgKX1QxgiNW7Ng3eMFrr7Z9ZG7Hhmqq/tOzGB3a+xVG
 dn44xeWX49YPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Wgxm4dYu
Subject: Re: [Buildroot] [PATCH 01/11] package/freescale-imx/imx-gpu-g2d:
 install the specific library for i.MX8MM
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgU8OpYmFzdGllbiwKCk9uIDA1LzAyLzIwMjUgMTI6NDAsIFPDqWJhc3RpZW4gU3p5bWFuc2tp
IHdyb3RlOgo+IEZvciB0aGUgaS5NWDhNTSwgdGhpcyBwYWNrYWdlIGNvbnRhaW5zIGEgc3BlY2lm
aWMgbGlicmFyeSB0aGF0IGlzIG5vdAo+IGxpbmtlZCB0byBPcGVuQ0wgYmVjYXVzZSB0aGVyZSBp
cyBubyBvcGVuQ0wgc3VwcG9ydCBvbiBpLk1YOE1NIEdQVS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBT
w6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+CgpJ
IGFwcGxpZWQgdGhpcyBzZXJpZXMgdG8gbmV4dC4KCkkgZml4ZWQgYWxsIG1lbnRpb24gaW4gY29t
bWl0IGxvZ3MgdG8gYmU6CiIiIgpUaGlzIHZlcnNpb24gaXMgYWxpZ25lZCB3aXRoIE5YUCBMaW51
eCBCU1AgdmVyc2lvbiAibGYtNi42LjUyLTIuMi4wIi4KIiIiCgpUaGVyZSB3YXMgbWVudGlvbnMg
b2YgImxmLTYuNi41NS0yLjIuMCIgb3IgImxmLTYuNi41Mi0yLjAuMCIuClRoZXJlIGlzIG5vIDYu
Ni41NSByZWxlYXNlIGZvciBub3csIG9ubHkgNi42LjUyLiBBbmQgaXQgaXMgLTIuMi4wCih0aGUg
LTIuMC4wIHJlbGVhc2UgaXMgYmFzZWQgb24gNi42LjIzKS4KClNlZToKaHR0cHM6Ly9naXRodWIu
Y29tL254cC1pbXgvaW14LW1hbmlmZXN0L2NvbW1pdC9kYjE4NjdiODE2NzZhMjUxM2I5MTI2N2U0
Yzg1MzY5ZGVlMjBhODAwCgpJJ2xsIHNlbmQgZGVmY29uZmlncyBidW1wcyBmb3IgYWxsIGFwcGxp
Y2FibGUgY29uZmlncy9mcmVlc2NhbGVfaW14KiAKc29vbi4KCkJlc3QgcmVnYXJkcywKCkp1bGll
bi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
