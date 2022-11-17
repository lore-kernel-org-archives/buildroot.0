Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B9AC4332F
	for <buildroot@archiver.kernel.org>; Thu, 17 Nov 2022 19:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6EF681ECB;
	Thu, 17 Nov 2022 19:24:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6EF681ECB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YCLXNd7LGX-k; Thu, 17 Nov 2022 19:24:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AB4781E70;
	Thu, 17 Nov 2022 19:24:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AB4781E70
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D99CC1BF3D7
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 19:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B505781E70
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 19:24:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B505781E70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j1BriuSFqw1M for <buildroot@lists.busybox.net>;
 Thu, 17 Nov 2022 19:24:46 +0000 (UTC)
X-Greylist: delayed 00:05:05 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D4B481E68
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D4B481E68
 for <buildroot@buildroot.org>; Thu, 17 Nov 2022 19:24:45 +0000 (UTC)
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MYNaE-1oQWQu3QLC-00VOvb; Thu, 17 Nov 2022 20:19:34 +0100
Message-ID: <4418d046-678f-912c-8c44-348cc82c9f06@vivier.eu>
Date: Thu, 17 Nov 2022 20:19:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: fr
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, buildroot@buildroot.org
References: <20220904095237.1401885-1-laurent@vivier.eu>
 <20220904095237.1401885-3-laurent@vivier.eu>
 <10716f6f-5738-5dbb-d0e7-6711331835d1@kaod.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <10716f6f-5738-5dbb-d0e7-6711331835d1@kaod.org>
X-Provags-ID: V03:K1:2+0ZExuDOjDlCoCvyutfai2G2ovN5CIiIqJ1jgh0DXdduQmnMy2
 SZS86MhdPZYS3exDEFcmb746+14ueFUVdogIgR9cY1d/ujhIimnUsQF2MWRPD1DscNeU1h2
 p7vp8uiczuW4qi6bL5vXgqnHHNFzf8CMs92axAqu+egIm7pHeV2s+JGsYt2oZ35g3IRhdav
 m+uzKvwjHoE+QfZMBqCgw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2kcsp+CiCaA=:uAMaoNVWlO25YB1JCwTkxF
 ZQFBrpEI3Zipz3DRcKR/+u8yWTpmqUBraHcHQbUzSRuRPyv6k6AE5pyaO5b5/oVyLn6Dm27dw
 c2nihUiZ/kpEHtgZ2A7PvI7v5QQFGxgDbnzHBST8Ns+HPRgBQqztXfDy6+Mo0Owds/LYdr9i1
 rgLi7JFjY+XQILh8cYB5kGQ9Efd3nEFnv71V6NihF29WW6fqf7Bid+ePMbeM2bU3muYR4HQBG
 66lAedW+KgoIr05qeMjG7fWEUWRmncmztkMhlrTgKNV5/md8TqFcC2c82ppUBx7OUO2EswN80
 qItSjzojVB60neoMFUpVyfsPsqL75CcLcryPa/AGbQ3Ma9QjqKReI3As5/X6MjEC0+Brd2CQG
 nBXjtDpF2TQF+fcXFZNnyUVTHRe+0i3Ev00xgN2W7cIo+4maL3Q02eQVIwAau37dGs8ZRZxHc
 ykzHDxPbcOxbGY1qJwwgm0Q/I/+AC3y6al8hYUeZvjczkik8KfurN75FxkpOPxX6lt0Rna4w+
 U8a2OGSOIsa6rxwmzETPASepI2FcGJMkGr2sExh5IijnJQk0YS0gPowV+hfVJCrQPBl3mLtN1
 +gB6pV3czd+vf0D67V4lK7PeQWeE9nGe1bwB6DrXlN539kBPhQKZOcDzUTE05CYKJCd+avJwq
 pv/FWus+Z7xCldCbqDokaUhBcFkfjVjd4gX6lQnSsdiq5BeeEJBnL9eUvZw0fXAWlyIe7LWUt
 1FswdTNF1w7NOZsiZ6VrtE92Nsh/rrNXZc39iu97cl6r9Fpt1uScNdabFU4uBO0XO0pXF8P77
 hd4TNNX
Subject: Re: [Buildroot] [PATCH v5 2/2] board/qemu/m68k-virt: Add virt-m68k
 linux config
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
Cc: Thomas Huth <huth@tuxfamily.org>, Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMTcvMTEvMjAyMiDDoCAxOTowMCwgQ8OpZHJpYyBMZSBHb2F0ZXIgYSDDqWNyaXTCoDoKPiBI
ZWxsbyBMYXVyZW50LAo+IAo+IE9uIDkvNC8yMiAxMTo1MiwgTGF1cmVudCBWaXZpZXIgd3JvdGU6
Cj4+IEJ1aWxkIGEgNS4xOSAoZmlyc3QgdmVyc2lvbiB3aXRoIHRoZSBtNjhrIHZpcnQgbWFjaGlu
ZSkga2VybmVsCj4+IGZvciAicWVtdS1zeXN0ZW0tbTY4ayAtTSB2aXJ0IiBtYWNoaW5lLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFZpdmllciA8bGF1cmVudEB2aXZpZXIuZXU+Cj4+IC0t
LQo+PiDCoCBERVZFTE9QRVJTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArCj4+IMKgIGJvYXJkL3FlbXUvbTY4ay12
aXJ0L2NvbmZpZy5saW51eMKgwqDCoMKgwqDCoMKgwqDCoCB8IDg5ICsrKysrKysrKysrKysrKysr
KysrKysKPiAKPiBXaHkgbm90IHVzZSB0aGUgbGludXggdmlydF9kZWZjb25maWcgPwoKQmVjYXVz
ZSBpdCBkb2Vzbid0IGhhdmUgYWxsIHRoZSBuZWVkZWQgb3B0aW9ucyB0byBrZXhlYyBhIGtlcm5l
bCBhbmQgdG8gdXNlIFJBSUQvTFZNL0RldmljZSBNYXBwZXIKClRoYW5rcywKTGF1cmVudApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
