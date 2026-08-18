Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B024CC5DF80
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 08:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 624F580FFE;
	Tue, 18 Aug 2026 08:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dxEoxRJ7ABRR; Tue, 18 Aug 2026 08:32:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78A9680FFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787041923;
	bh=7o2goSuX4k6GzrgqnPozW2Hq8siw2jM87/yAhfgcwU8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MhkBTgenQxaQqek7fagwy/0u2E8FpwVqOXb0Odjmvn4TQbVjsV8OpaIV4E9HaxHkM
	 dlj2lJCnNpNtTQLyWi5L6g0j0gkf2WdxAx8TSFwR2vZUpr3sSI1I3PqzO/9p9gi2a/
	 ZlmdNUWzQ+k2FSPEqaFIlNPN2UWR4pnveUW1gxy+KeJo+fgTVKFa+1WNyBVkHqYgI5
	 zHP6sfVOBq03wtukAZC+jr2KH+kvDcjZj+Wy5Jcf3xkKs2WvNcRPjE5HZMDYYK7u1h
	 ZWjYxMCeU7Gj97mZZr9ccO6wH2+UjJ3nmsbfI2qUprE55eAKId3oAYOENfTt407BRE
	 sJJWSFTI3Q1kw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78A9680FFF;
	Tue, 18 Aug 2026 08:32:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A250C333
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 08:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93CFA40680
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 08:32:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 839LhkQkBEXe for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 08:32:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.153;
 helo=send58.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CA28F40651
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA28F40651
Received: from send58.i.mail.ru (send58.i.mail.ru [89.221.237.153])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA28F40651
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 08:32:00 +0000 (UTC)
Received: by exim-smtp-848884f6cb-llhg8 with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1wwFEi-0000000055F-1skw; Tue, 18 Aug 2026 11:31:56 +0300
Message-ID: <f5f829f3-e6cd-455c-977d-26ba96880984@inbox.ru>
Date: Tue, 18 Aug 2026 11:31:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
References: <20260818082809.952856-1-raphael.melotte@mind.be>
Content-Language: en-US
In-Reply-To: <20260818082809.952856-1-raphael.melotte@mind.be>
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9CA2E9CC3AD529C5017C616D5D567498A06F8E63B833323DA1313CFAB8367EF908E2BE116634AD74DE37901DE3837E387D27678DDAA806314DA315DBF805793E2B7E2DFFE458898F2988925F93B33D006
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5259CC434672EE6371C2A783ECEC0211AD4AD6D5ED66289B524E70A05D1297E1BBAC83A81C8FD4AD239742502CCDD46D0D5C553DABC76643498638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B25B362ED61306225C2E070BE324C7D3C48D570FEDE2879F0EBB0A4F435E46E6718B35066C979671628AA50765F7900637F6B57BC7E64490618DEB871D839B73339E8FC8737B5C22490417BEADF48D1460CC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C06CDB2E15ACB7FB748941B15DA834481F9449624AB7ADAF372E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C30AE2CC35261D99CA75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A5CA35B047EBE872D85002B1117B3ED696B521AE8BDA23F06730E4A65F242F58983610D81D389A125CDE35189EBF2DEA28FEA14CD2CD220BB99C5DF10A05D560A9880EC71AF561E0AAD9143641EC25BB39E5B54556E8E649B5
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34C77DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D659DC6E5C486C6181287676FA2C7E2063B7271D4EC7473C95427AA4BA55D488A70852CAD6177B553F62B8341EE9D5BE9A0AD432EAA7F25145B962F98144A6150CB7E5D82F694AE546026536EB022892E5344C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVd9Ysz+d4RqWHBLEnMi4+Uw=
X-Mailru-Sender: 689FA8AB762F7393520AF17B8A65FDE2442E0E943AFBC4B8124DBEC816D995B8923A8CB6DD7656F990DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/postgresql: security bump
 to v17.11
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

MTguMDguMjAyNiAxMToyOCwgUmFwaGHDq2wgTcOpbG90dGUgd3JvdGU6Cj4gRm9yIG1vcmUgaW5m
b3JtYXRpb24gYWJvdXQgdGhlIHJlbGVhc2UsIHNlZToKPiAgICAtIGh0dHBzOi8vd3d3LnBvc3Rn
cmVzcWwub3JnL2RvY3MvMTcvcmVsZWFzZS0xNy0xMS5odG1sCj4gCj4gRml4ZXMgdGhlIGZvbGxv
d2luZyB2dWxuZXJhYmlsaXRpZXM6Cj4gCj4gLSBDVkUtMjAyNi02NDcxCj4gLSBDVkUtMjAyNi0x
NDY2Mwo+IC0gQ1ZFLTIwMjYtNjQ2NAo+IC0gQ1ZFLTIwMjYtMTYyMzkKPiAtIENWRS0yMDI2LTE0
NjY5Cj4gLSBDVkUtMjAyNi0xNDY2NAo+IC0gQ1ZFLTIwMjYtMTgwMjQKPiAtIENWRS0yMDI2LTE2
MjM4Cj4gLSBDVkUtMjAyNi0xNDY2OAo+IC0gQ1ZFLTIwMjYtMTQ2NjIKPiAtIENWRS0yMDI2LTE0
Njc5Cj4gLSBDVkUtMjAyNi0xNDY4MAo+IC0gQ1ZFLTIwMjYtNjQ2OQo+IC0gQ1ZFLTIwMjYtMTU3
NDEKPiAtIENWRS0yMDI2LTY0NzAKPiAtIENWRS0yMDI2LTE0NjY2Cj4gLSBDVkUtMjAyNi0xNDY4
MQo+IC0gQ1ZFLTIwMjYtMTQ2NzIKPiAtIENWRS0yMDI2LTE2MjQxCj4gLSBDVkUtMjAyNi0xODQw
OAo+IC0gQ1ZFLTIwMjYtMTkzODUKPiAtIENWRS0yMDI2LTE0NjcwCj4gLSBDVkUtMjAyNi0xNDY3
Nwo+IC0gQ1ZFLTIwMjYtMTQ2NzMKPiAtIENWRS0yMDI2LTE1NzQyCj4gLSBDVkUtMjAyNi0xNDY3
Ngo+IC0gQ1ZFLTIwMjYtMTQ2NzgKPiAtIENWRS0yMDI2LTE0NjcxCj4gCj4gQXNzaXN0ZWQtYnk6
IENsYXVkZTpjbGF1ZGUtc29ubmV0LTUKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0
ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+CgpSZXZpZXdlZC1ieTogTWF4aW0gS29jaGV0a292
IDxmaWRvX21heEBpbmJveC5ydT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
