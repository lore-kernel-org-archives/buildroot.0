Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C665C433F5
	for <buildroot@archiver.kernel.org>; Thu,  9 Dec 2021 06:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9492480C21;
	Thu,  9 Dec 2021 06:18:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z8cVywP8a7Ls; Thu,  9 Dec 2021 06:18:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4D6480BF8;
	Thu,  9 Dec 2021 06:18:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E8A511BF476
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 06:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D819C80BED
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 06:18:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U4YBTBUxMuov for <buildroot@lists.busybox.net>;
 Thu,  9 Dec 2021 06:18:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5907D80BE5
 for <buildroot@buildroot.org>; Thu,  9 Dec 2021 06:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=mxidwutSlpKNOq+/J8BKMbsJL4jh/d/fds4oHtponSY=; 
 t=1639030723;x=1639636123; 
 b=L7gFHtp3R8+LgTE9ELySMXTunNz9jqNoNi2yA2HqCgaTp96qTgn5xrs1NqdLLjjfk0MOmm5cCzMdSssaVk+FZUxuXHvRuL5IG6PMkodFg3khn+YluOyrKWgx5cmbBhgyjAU71XLP1ZKY+tiLqohMdHz6veAZtzC7af7xH7ZM+P8OpSO9VLQ2W081RJoixbyU/x5sOKg9o5G6YnDQATNx+7y9hXCIdt2wOj2p2am3rH85YNFdXomgcCWH1EeKmzOgAiIgpl9w8MqOXMkZ5V0S8dCMRUiUoK8DetPboLJOEq4uGPMyRATY0GNwyaUPHDx4uhgYGm/EVkUiwfNBjvlKFg==;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1mvClK-0007sQ-QX; Thu, 09 Dec 2021 09:18:39 +0300
Message-ID: <f6cdf1a9-4823-8a9a-31bf-345ddc93ba26@inbox.ru>
Date: Thu, 9 Dec 2021 09:18:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org, Arnout Vandecappelle <arnout@mind.be>
References: <20211208232148.3694208-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20211208232148.3694208-1-giulio.benetti@benettiengineering.com>
Authentication-Results: smtpng3.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD99F281DB1F96F126D894741D47212D5535CC6C24F7A4372F700894C459B0CD1B94C7BCE0F3D58E864F8B859F232A73BB0A5C4B13E382D3B3358574C2FEBD6103D
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7370DF012C2F9ACE3EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006374F960C921106F05B8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8ACD655E960EFB64D7C1AB68F6E0117D06F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7BE1F02509D432EA69FA2833FD35BB23D9E625A9149C048EE9ECD01F8117BC8BEA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CFA80D66F452D417A43847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A529CA2764D83B16CF139E2F97F262AAF71659AAF9E830DC66D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75BFC02AB3DF06BA5A410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D343536C6A4332D8B8ADA992574936303B73F51CC0BC9794E1DBCF9D9E1B3D0459838001B92D7ED40BD1D7E09C32AA3244C2FBBD432B04E687A1E05F41C0A7247E930452B15D76AEC14FACE5A9C96DEB163
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioja3eBVivI1t0mvKGanCq3yA==
X-Mailru-Sender: 689FA8AB762F7393C37E3C1AEC41BA5D4F4B93D7C8216ECF4792F5C3881B00F298CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Subject: Re: [Buildroot] [PATCH] package/postgis: re-enable Microblaze
 architecture
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwOS4xMi4yMDIxIDAyOjIxLCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPiBXaGlsZSBhZGRp
bmcgdGhpcyBwYWNrYWdlIHdpdGggY29tbWl0WzFdIE1pY3JvYmxhemUgYXJjaGl0ZWN0dXJlIGhh
cyBiZWVuCj4gZGlzYWJsZWQgYnkgZGVmYXVsdCBwb2ludGluZyB0aGF0IGl0IHN1ZmZlcnMgZnJv
bSBnY2MgSUNFLCBidXQgdGhpcyBpcyBub3QKPiB0cnVlLCBpbmRlZWQgdGhlIGJ1aWxkIGVycm9y
IGlzIHJlZmVycmVkIHRvIGxpYmdlb3MgdGhhdCBpcyBwb3N0Z2lzCj4gZGVwZW5kZW5jeToKPiBg
YGAKPiAgICBkdXJpbmcgUlRMIHBhc3M6IHJlbG9hZAo+ICAgIC4uLi9ib290bGluLW1pY3JvYmxh
emVlbC11Y2xpYmMvYnVpbGQvbGliZ2Vvcy0zLjkuMC9zcmMvZ2VvbS91dGlsL0RlbnNpZmllci5j
cHA6IEluIHN0YXRpYyBtZW1iZXIgZnVuY3Rpb24g4oCYc3RhdGljIHN0ZDo6dW5pcXVlX3B0cjxz
dGQ6OnZlY3RvcjxnZW9zOjpnZW9tOjpDb29yZGluYXRlPiA+IGdlb3M6Omdlb206OnV0aWw6OkRl
bnNpZmllcjo6ZGVuc2lmeVBvaW50cyhnZW9zOjpnZW9tOjpDb29yZGluYXRlOjpWZWN0LCBkb3Vi
bGUsIGNvbnN0IGdlb3M6Omdlb206OlByZWNpc2lvbk1vZGVsKinigJk6Cj4gICAgLi4uL2Jvb3Rs
aW4tbWljcm9ibGF6ZWVsLXVjbGliYy9idWlsZC9saWJnZW9zLTMuOS4wL3NyYy9nZW9tL3V0aWwv
RGVuc2lmaWVyLmNwcDoxMjg6MTogaW50ZXJuYWwgY29tcGlsZXIgZXJyb3I6IGluIGdlbl9yZWdf
cnR4LCBhdCBlbWl0LXJ0bC5jOjExNTUKPiAgICAxMjggfCB9Cj4gICAgICAgIHwgXgo+IGBgYAo+
IAo+IFRoaXMgYnVpbGQgZXJyb3IgaGFzIGJlZW4gd29ya2VkIGFyb3VuZCB3aXRoIHRoaXMgY29t
bWl0WzJdIGFuZCBJJ3ZlIGp1c3QKPiB0ZXN0ZWQgdGhpcyBidWlsZCB3aXRoIE1pY3JvYmxhemUg
Z2NjIDkuMy85LjQvMTAuMyBhbmQgMTEuMiBhbmQgaXQgYnVpbGRzCj4gc3VjY2VzZnVsbHkgc2lu
Y2UgdGhlIGJ1ZyBhYm92ZSBpcyBnY2MgYnVnIDkwNjIwWzNdIGFuZCBpdCdzIGJlZW4gaGFuZGxl
ZAo+IGluIGxpYmdlb3MgYWxyZWFkeS4KPiAKPiBTbyBsZXQncyBhbGxvdyBNaWNyb2JsYXplKGVs
L2JlKSB0byBidWlsZCB0aGlzIHBvc3RnaXMuCj4gCj4gWzFdOiBodHRwczovL2dpdC5idWlsZHJv
b3QubmV0L2J1aWxkcm9vdC9jb21taXQvP2lkPTliYjEwMzQ0NTVkZTI5OTg3NmRmZDAzYzUwNzRk
OGJiOTYyMmY4NzM5YmIxMDM0NDU1ZGUyOTk4NzZkZmQwM2M1MDc0ZDhiYjk2MjJmODczCj4gWzJd
OiBodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9jb21taXQvP2lkPTg0N2I0NDFi
MWNhMjIzMGM0ZjI2YTQ5YWFlZGU2OWVjYTVlN2U3YWQKPiBbM106IGh0dHBzOi8vZ2NjLmdudS5v
cmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTkwNjIwCj4gCj4gU2lnbmVkLW9mZi1ieTogR2l1
bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+ClJldmll
d2VkLWJ5OiBNYXhpbSBLb2NoZXRrb3YgPGZpZG9fbWF4QGluYm94LnJ1PgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
