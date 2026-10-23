Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E06606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 15:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Oj44wQoV
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 609FD409C8;
	Fri, 23 Oct 2026 15:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FC5QSNDzawWQ; Fri, 23 Oct 2026 15:28:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D788F4097D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792769320;
	b=Vl81N076yX6jZhmJh5wVzkahizdkU0ZISSM3ULHkC2fbPJFXHEChuugwon6wlIsGeoR0
	 DSCdQyBLdcyyzuENzOlkJmDK2l2O6r2wNx6P8gXyeTsg8WmzeerxIBoVS3aKRHwLjYr7T
	 d5IBdfnE0i0/PA9SLq6PuOqRt0VcDihyPS0AbgB0IIiDpES0j1WmHlL94yZCdWVL0c+V+
	 RA82lcxVAA/uTfdTLZAb5TFjrGjcSc7zmR/tNKz8fAXZTvyxxWV4GCsGMLcsv5VVFpFKp
	 7Y4KlX2MUJ5aSD1N4S68LcUOgBlbfWpL2f4L809fn3ZOwzI/k7RVQ9cLGl/H+8z4i9w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792769320;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=eY5+IgB2Qlm+wmR7bpwfHC3yfug7I/Oz+trAT0c2bTU=;
	b=YVb/W56T/QW1/QWjPbP/hBykM8BrRAiHVb6Q9Rn7UUckBoUXOMLDnJqtaxoZQ19WfX9F
	 eRhtwKp3x6z/dV1wZbXpBswJNVnfe9B/LTSWfg7o2xIxcrZLj+sefsWi7k5gfIWSPSTNV
	 Sdx1yuz1Ch2EWhrD1OWEiQT+BaPL2ceH18AkxDLHZ0Fv7rHwMKtvScI/xw5D5hkJh82xA
	 tereQfmJOZ/xsMXnHU3j2eu0NUhgmArSh7DD9xmlJQBse6lZrAR+Msnfn7PAFqN+y02qy
	 CmrzQMEQGZHPIReiF8+6CJkJ6yMu2VslKF6ScUpHBvNB1GJI4BZkvPZtNHSj7rLhTkg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792769319;
	bh=eY5+IgB2Qlm+wmR7bpwfHC3yfug7I/Oz+trAT0c2bTU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Oj44wQoV6pLpT9fVgjPol9fvFKcy0EiAlqMpWPkCy+oT9rMvNnrOz3kVuJ9BRGX3n
	 ioNjdtj/An1mFbP6eSFoC2heCPdLvytMBsN+6wUVIdhN/j7nN6fobdAD3M66s2GwI+
	 bW+fKm7wA+VSLYHEiG6jN8RF97vyYI1GuTtdabF1QQD6kKe39R7Onjl3kLF5ppZfkf
	 t4PUi1BNOaw1ogxHLCVmKWNBvxU5kJ6YRRcA5yaraf7g8OPcuRRVZges4o3oqAfZuq
	 B3n5b/h1c3sKs2/0ilZZAlL19/bXQI2XUtmGQEDOqeU0jdTUq7Vjq8R/QGeRceSz1B
	 dP10kMGHIMbzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D788F4097D;
	Fri, 23 Oct 2026 15:28:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC38212C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 15:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE00A811FB
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 15:28:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z1O3XzL9Pnip for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 15:28:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A9105811CD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792769317;
 b=kk2I1xzoomWkXSvEDK4SH1uYWHavV3bX1w89aTHQJnugMvdApKsPK1rn/NPMSNeO5L4x
 ZCpOkO8HZf9nd1lKE2NEEGomjhH9Lpw2B02p8fBh3AANT4FxBsr7n+DaLutCEeo3bdNT+
 Q674raiHyosznzCtopcxPBHYGlBOn4+BLEVjuTtB53egrlBTpK0JmnXpQqGS1A8Eg/yw8
 5PpcK62/iGX6/ZvFksQf2MnaqsvVMk59k5WYWa0qsHVw51r2Nd367bLZxrZaCPIsohFkP
 panFKDoN00uoJ1kupBX87zE9FVSW7hOV1ARxg/+OYyKBjv1L7OJxeJVEAWH0NdH7l7Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792769317;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=I3XhhVb/OWV0kFeBsr8Kf3idiyLzMMSx57qO0yovyhM=;
 b=J/GKfR2GlvNULwyvPKlz2ntBtRU9066clN/CZB2ZFWZaYLpuxob9dIcCuqtYXvPs988u
 4xAUkhpxIYjiifLN0Mt3tUF6o9MZaVETf2cHVCN+VquiBI3UofOazYk6Txdgz3SfjwxAA
 GhAI2MFrPC/uZdtH4NtfeIuzYEn83796nbr+TsojBAT9kCIotXzFIXnnkULG/47fkDahq
 lYsuN3H3i5Yghnd81zBH2112XmULs725UU+rcPfmoeAECs29bP0oKIgNuhZ/3RxiJ6wLj
 tJ1ZXbuWvxpxivinezbpbFdNEfnlgeHqQOQyi2WtIdoMOtB2KNdTO5QDBkF2X8ccxVQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=FgBpmIT8; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9105811CD
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 15:28:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 29BD1B0055E;
 Fri, 23 Oct 2026 17:28:33 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 23 Oct 2026 17:28:33 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 23 Oct 2026 17:28:33 +0200
To: =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20261023143640.1742726-1-raphael.melotte@mind.be>
References: <20261023143640.1742726-1-raphael.melotte@mind.be>
User-Agent: Webmail Free/1.6.20
Message-ID: <657bdf3671f48c101552324488e0eaa6@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-botocore: security bump
 to version 1.43.118
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMjMvMTAvMjAyNiAxNjozNiwgUmFwaGHDq2wgTcOpbG90dGUgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBDb21taXQgMGE2YzdiNmIzZTc5NGU4NjUxOTNkZWUyM2M2OGFkZmFkYjZiOWMwNCwgYXZh
aWxhYmxlIGZyb20KPiB2ZXJzaW9uIDEuNDMuMTE3IG9ud2FyZCAoc2VlIFsxXSksIGJsYWNrbGlz
dHMgdGhlIHJvb3RzIHRoYXQgc2lnbmVkCj4gdGhlIGNvbXByb21pc2VkIGVNdWRocmEgaW50ZXJt
ZWRpYXRlIENBcyAoWzJdKS4KPiAKPiBbMV06IAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9ib3RvL2Jv
dG9jb3JlL2NvbW1pdC8wYTZjN2I2YjNlNzk0ZTg2NTE5M2RlZTIzYzY4YWRmYWRiNmI5YzA0Cj4g
WzJdOiBodHRwczovL2VtdWRocmEud2UtaGF2ZS1hLXByb2JsZW0uY29tLwo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KCkFwcGxp
ZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
