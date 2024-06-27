Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF3FC2BD09
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 07:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BE44400A4;
	Thu, 27 Jun 2024 07:57:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id poZWVvVF827r; Thu, 27 Jun 2024 07:57:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20B9C40114
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20B9C40114;
	Thu, 27 Jun 2024 07:57:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B14DF1BF3D8
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 07:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB4CE80EC3
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 07:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 34jd0TERL-Ya for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 07:57:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 90E7580EBC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90E7580EBC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90E7580EBC
 for <buildroot@busybox.net>; Thu, 27 Jun 2024 07:57:08 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([82.135.81.119]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWzfv-1rpXnl3Hkf-00IWT9; Thu, 27
 Jun 2024 09:57:04 +0200
Date: Thu, 27 Jun 2024 09:57:04 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240627095704.280dc858@gmx.net>
In-Reply-To: <20240627095029.2d1fa5c0@gmx.net>
References: <20240612135727.11811-1-ps.report@gmx.net>
 <20240612135727.11811-5-ps.report@gmx.net>
 <ZnqUPBAcDbB7ND64@tl-lnx-nyma7486-2>
 <Znql0FCAPG8jP+Lx@tl-lnx-nyma7486-2>
 <20240626103623.7d7412c0@gmx.net> <ZnxsxFK_KDUDM652@landeda>
 <20240627095029.2d1fa5c0@gmx.net>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:YqKsKjbipNrfosWZRXiPlWilFNrJSra786LwtVRoCD1I+wZbstC
 hrE15utBn9H+CYZIREr/E3WvCFIeuEu+91WRmtqTrkzZL2ZY3qwKNY8FabRhYgi8Qv3EUDX
 T5uObINGhlrfVVjTLS3s2cNFFFYu3k0DCO0/+ukKti3n2SvOJ2tcPRXH0uq4Rz3taOdbrmv
 s1pfPon2LUdPr7Xt1cSUg==
UI-OutboundReport: notjunk:1;M01:P0:9/jDyY5O3KQ=;Vk7HUSMymvJJtHihRIJMB3Uf21G
 2TZkn8AtLDcpava047p9OgS2p2PUcSk89+u82v+om+Kg1TCDzcGR4T7zKdKWbg0WGH55dYNvU
 6W/aMeQc+RJCFHL+Uudn71/ITny3HaXGd2mZjIMjKGNsmIwO9lBc4573LYXmjOBdq1dbgVaG1
 4c0XdadSRHGG4+UWq18RbaAH0UEKn0c+KhX0JfDSsjfdoSKLAb4nZAMdbYh8/+yON31CzspsP
 IGR6Mvd0f7uHLQX8Bj3VSHuQo+Vow5YC+U3vg+pt9WkDhiPcnFgVPSzHfT7G9YCO+ygO83AEX
 6rNklZqpNvxSfRnamlLVmog3P+zyVXFm6ZUjr8EFCupPzN0BkzJ/u4KujfbASi1RxAudFBL9E
 WK52ci/tCrHScc1oIN1I60O6zs1X4SQPCF7AP5075LxgZPwWDPyzlnBLkpweVK6Lezy7QFmlt
 KMnHQQzr359s+LAeH1M4T9OGa+1m/nE3L6m7Darwwkduebyps5jdjyMYdLWysDabUYdC5eebq
 70UGNoshmrXcnPIs2Tw0hK76tLkrnKzmoCD+bps+Z3lBigleTUnebifkEKKJBfbd3Gk5fXhjb
 HwDMPCu4V6d6AAZ02an81AgVakP0wILDckCMKzQxa0Ni2sioSaPPWT7amoMsKQDfmiwVh5xhU
 U1VUbN1Z6D+4Oh8I4pGPclVBhQ1/ObwBJ4XiqjwS1BLKnQOVc4T7+ksxIqgFNwtCyKo015WGc
 skgpd/lAJ/QvUStHzV/sZjkBfjP7nTzEO2PIFljpiMeKPxLpyLiBpVicaoXkuYILdR1Qm+O/G
 CTz4JbJ69MmOi5PFdlMq8XVQ1lQgRgSP6/6wXNXq0aGks=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1719475025; x=1720079825; i=ps.report@gmx.net;
 bh=23cbKtNyskkaNEgIshQzfRcH/AuDUT4MvuBlNdQVpJc=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Tkw0CsGKQhSTcXbuq1DA+bTj2wc5Sbcc7misX2HL00/wYUFsAoykwlZ0FFZxjmUJ
 RoO3+S6SfZdMvwfDBQiCJ+ovgT98LicQ46MhkjkwbhjbE5iP4rXavlGVBCGviiOr6
 cuYzXDmFWb2kj97u09tzdIUYXD4heQiZlIQ/+tg7NL+8Z1EWbDXbCvfJOvdUknibq
 Akny0ta8rdxqGp25l8gPfthN3e2jzndHYj8LHsw1pvwY2B6Y2Abx6K6h082KCjZWM
 LwHWRLqPOmX+2AJhzS4ikZ5pHcDRAJPM3p9NLgxcbSz3u0pATmLBqCw93miiYIebi
 HoZ8qKQADvPtQA7Bjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Tkw0CsGK
Subject: Re: [Buildroot] [PATCH v2 5/5] package/xz: convert to cmake build
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@busybox.net, yann.morin@orange.com,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAyNyBKdW4gMjAyNCAwOTo1MDoyOSArMDIwMCwgUGV0ZXIgU2VpZGVyZXIgPHBzLnJl
cG9ydEBnbXgubmV0PiB3cm90ZToKClsuLi5dCj4gRmFpbHMgb24gbXkgc2lkZSAodXNpbmcgcG9k
bWFuIGludGVhZCBvZiBkb2NrZXIpOgo+IAo+IAk+Pj4gaG9zdC1wa2djb25mIDEuNi4zIERvd25s
b2FkaW5nICAKPiAJbWtkaXI6IGNhbm5vdCBjcmVhdGUgZGlyZWN0b3J5IOKAmC9wa2djb25m4oCZ
OiBQZXJtaXNzaW9uIGRlbmllZAo+IAoKUHJvYmxlbSBmaXhlZCwgbXkgbG9jYWwgJ2RsJyBkaXJl
Y3Rvcnkgd2FzIGxpbmsgdG8gc29tZSBvdXRzaWRlIGxvY2F0aW9uLAp3aXRoIHRoaXMgbGluayBy
ZW1vdmVkIHRoZSBjb21tYW5kIHdvcmtzIGFuZCBJIGNhbiByZXByb2R1Y2UgdGhlCnByb2JsZW0u
Li4KClJlZ2FyZHMsClBldGVyCiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
