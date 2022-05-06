Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA79AC433F5
	for <buildroot@archiver.kernel.org>; Fri,  6 May 2022 15:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57B1283386;
	Fri,  6 May 2022 15:14:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HiO9xW4wyRU8; Fri,  6 May 2022 15:14:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8170A83366;
	Fri,  6 May 2022 15:14:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 014D61BF299
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 15:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1F2C416BC
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 15:14:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=163.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zjaB1Jwd4bIi for <buildroot@lists.busybox.net>;
 Fri,  6 May 2022 15:14:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from m12-14.163.com (m12-14.163.com [220.181.12.14])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DB8D415EC
 for <buildroot@buildroot.org>; Fri,  6 May 2022 15:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Message-ID:Date:MIME-Version:Subject:From; bh=G41BM
 Ubz6V3+g0KVN7R/cZva86XAMxh52thIfefUdl8=; b=kinYTtDcnH8zGNb1VsN7w
 NV716Y2MBiL2tN5erzJh7q7V0Xhw+dkZVzav1tbXHq0ym14Ydq6v/65c89ZfgdDR
 TDymMuPUwnIQ8X/ApwOJW5XXCY0KkFerUUfbqL35w+wyJ6aFqBzcrDa5DP94WUC6
 ye50vZD+M4MLOjTW2NpdZ0=
Received: from [192.168.31.190] (unknown [123.185.180.235])
 by smtp10 (Coremail) with SMTP id DsCowAAnTQY8O3ViU_mlBA--.32375S2;
 Fri, 06 May 2022 23:14:05 +0800 (CST)
Message-ID: <83d40c0d-c9f5-27e2-4e4c-14fa1d1f4507@163.com>
Date: Fri, 6 May 2022 08:14:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Luca Ceresoli <luca@lucaceresoli.net>
References: <20220418142855.3489541-1-tianyuanhao3@163.com>
 <bf3aa2a8-54d4-0b1f-a70c-5966b1e6e2d7@mind.be>
 <886d75d1-b878-f521-3c07-df7ceee8040b@lucaceresoli.net>
From: TIAN Yuanhao <tianyuanhao3@163.com>
In-Reply-To: <886d75d1-b878-f521-3c07-df7ceee8040b@lucaceresoli.net>
X-CM-TRANSID: DsCowAAnTQY8O3ViU_mlBA--.32375S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr4kZF45XFyfZFWkuw4UJwb_yoWktrXE9F
 Z8Cr9xGw4YqrZ29w40vr4furyq9as0vrW3trWj9r1SkrykA34DCrnrur97JF1jvFs7W3yx
 uFyavF9Fvr1jqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUHqcUUUUUU==
X-Originating-IP: [123.185.180.235]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiXB74jVXl2rgg3AAAsZ
Subject: Re: [Buildroot] [PATCH] package/rtl8188eu: bump to 903b6fc
 (v5.2.2.4 branch HEAD)
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTHVjYSwKCk9uIDUvNC8yMiAwMjo0NCwgTHVjYSBDZXJlc29saSB3cm90ZToKPiBIaSBUSUFO
LAo+Cj4gT24gMTkvMDQvMjIgMjI6MzUsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Pgo+
PiBPbiAxOC8wNC8yMDIyIDE2OjI4LCBUSUFOIFl1YW5oYW8gd3JvdGU6Cj4+PiBUaGlzIGFsbG93
cyB0byBidWlsZCBhZ2FpbnN0IG5ld2VyIGtlcm5lbHMgKHVwIHRvIDUuMTgpLgo+Pj4gVGVzdGVk
IG9uIGtlcm5lbCB2NS4xNS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBUSUFOIFl1YW5oYW8gPHRp
YW55dWFuaGFvM0AxNjMuY29tPgo+PiAgwqBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgo+IFdl
IGFyZSBzZWVpbmcgbmV3IGJ1aWxkIGZhaWx1cmVzIHNpbmNlIHRoaXMgcGF0Y2ggaGFzIGJlZW4g
YXBwbGllZC4gQ2FuCj4geW91IGhhdmUgYSBsb29rPwo+CkNvbmZpcm1lZCwgdGhlIGJ1aWxkIGZh
aWxlZCBiZWNhdXNlIHRoZSBrZXJuZWwgY29uZmlnIHdhcyBtaXNzaW5nIApDT05GSUdfQ0ZHODAy
MTEuCgo+IFRoZSBmdWxsIGxpc3Q6Cj4KPiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcv
aW5kZXgucGhwP3JlYXNvbj1ydGw4MTg4ZXUtOTAzYjZmY2I4MjE0NjVmZTljNjNlODM0MTYwODBk
ZjcwYzFjM2M5MAo+Cj4gU29tZSBleGFtcGxlczoKPgo+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRy
b290Lm9yZy9yZXN1bHRzLzk1MS85NTE0NzA0ZDZkNDRmYzFiNWRkMTg4ZWFjMDZiMjY5NDI3ZDNk
ZWUyLy8KPgo+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzllYS85ZWEw
NjBjYzM1ZTg1OWViYzczYzY1ZmUyZDFmNzQ3OGY5YjRmYThkLwo+Cj4gaHR0cDovL2F1dG9idWls
ZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvNjU4LzY1OGMwNmY4MTI1NjEzYjU2NTExZDMzNTFjZGZk
M2Q4ZTE5ZDQ4ZGEvLwo+Cj4gRllJLCBhdCB0aGUgZW5kIG9mIHRoZSBodHRwOi8vYXV0b2J1aWxk
LmJ1aWxkcm9vdC5vcmcvIHBhZ2UgdGhlcmUgaXMgYQo+IGxpbmsgdG8gYSAiU2NyaXB0IHRvIHJl
cHJvZHVjZSBhIGJ1aWxkIiB0aGF0IGlzIHF1aXRlIGhhbmR5IHRvIHJlcHJvZHVjZQo+IHRoZSBw
cm9ibGVtIGxvY2FsbHkgaW4gb3JkZXIgdG8gZGVidWcgaXQuCj4KPiBUaGFuayB5b3UhCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
