Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DAAC021A0
	for <buildroot@archiver.kernel.org>; Sat, 15 Feb 2025 04:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B49F60BE0;
	Sat, 15 Feb 2025 04:54:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g_a-5M0Rkgic; Sat, 15 Feb 2025 04:54:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1437760B0A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1437760B0A;
	Sat, 15 Feb 2025 04:54:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ED35672
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 04:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC775424EF
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 04:54:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l6MkErCqVbqL for <buildroot@buildroot.org>;
 Sat, 15 Feb 2025 04:54:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.137.243.76;
 helo=fallback20.i.mail.ru; envelope-from=fido_max@inbox.ru;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 10C03424D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10C03424D2
Received: from fallback20.i.mail.ru (fallback20.i.mail.ru [79.137.243.76])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 10C03424D2
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 04:54:26 +0000 (UTC)
Received: from [10.113.26.74] (port=49560 helo=send123.i.mail.ru)
 by fallback20.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1tjAC8-00Gkd2-Fx
 for buildroot@buildroot.org; Sat, 15 Feb 2025 07:54:24 +0300
Received: from [10.113.81.18] (port=37014 helo=send106.i.mail.ru)
 by exim-fallback-c85fcfddd-fggg2 with esmtp (envelope-from
 <fido_max@inbox.ru>) id 1tjABx-0000000040Q-2foE
 for buildroot@buildroot.org; Sat, 15 Feb 2025 07:54:13 +0300
Received: by exim-smtp-844687bc8-b5fzd with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1tjABl-000000001JL-0AAR; Sat, 15 Feb 2025 07:54:01 +0300
Message-ID: <7536e6e2-dab4-4d77-a41b-c1c92460392a@inbox.ru>
Date: Sat, 15 Feb 2025 07:54:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20250214181607.40248-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20250214181607.40248-1-bernd@kuhls.net>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD93899CACFFF273C592410AF6BC9A94DB4F79A225EC2EDD32B182A05F538085040CB6CD0709968D6223DE06ABAFEAF6705800BFAC15598C12CFE5915F065F2C4AF71713673A8881951
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE758E3775C3D7FDEE4EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006375080A183704825A98638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D84EDE641AC40F9EF78B3C4BF96D0E6746F37E522D8238803120879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C045A75973B56231AD8941B15DA834481FA18204E546F3947CCF7CD7A0D5AA5F25F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006370A2DD59B67EFEE27389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735D2D576BCF940C736C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A5513D9317458A82055002B1117B3ED696FD161B0546FBFF7DBFF4097FFC9E796F823CB91A9FED034534781492E4B8EEADC3194D76C41E9723BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF635A2E6C543C408DBF23E57ECAE18FF5C67193BB044F4FA382F1688659FEBF83A7F6D8DEE3A50DD4F7DAF9EE0634D236DD5D4AEE0F0ECDC86A02CBC6BAADE14C3681CE6E4E4C3DC6111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JLyxlCMHyJC27TEfSK/c0LobNf6AY0J5lg==
X-Mailru-Sender: 689FA8AB762F739381B31377CF4CA2193FCA6C5E313CC761DFF9BCC1BEB996E6DF1165D989E4713090DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4BA09097AEF4FF40FD82BE83A5A2F87B7812FFB60188A9958049FFFDB7839CE9EAA552FCEFCAD8FCC68138FA0F2DBA89BB7D7BEEE7A233CEEFE60D77565D94293E65BDB7471ED2259
X-7FA49CB5: 0D63561A33F958A5F53CF7E7ECFD56905002B1117B3ED6962A89495671D62D2A8DB33178460FA33B02ED4CEA229C1FA827C277FBC8AE2E8B8264E996A69068A8
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga57kClu9qEisZhJbvzqFipoNyqHyU9iLcO
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4BA09097AEF4FF40FD82BE83A5A2F87B7D4531E66AC6DE876049FFFDB7839CE9EAA552FCEFCAD8FCC5CBE715D2B78DE4B73CB6373B0657CCFFC7C32A5BD84C28B
X-7FA49CB5: 0D63561A33F958A573E948AC2ED7812E36B9BF678A48A79CABF71F7B2E5C369ECACD7DF95DA8FC8BD5E8D9A59859A8B6A096F61ED9298604
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga57kClu9qEisaNooMvoD4wlbRFuIOw5Q1i
X-Mailru-MI: 20000000000000800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=AtxtMbBFbg0GoR1dRP7KzzYv3Da8vzPdY7sqD5yGufY=; 
 t=1739595267;x=1739685267; 
 b=B+vTE/fGAJeZgfUhi6FUe9exX6h2mJXS+/4B7rcRCGdZVGvaFOIJ7U2bSC0VDCYZ7psI5Kukj4SNBO53YB4qfcKxk9BvQD+LlYNBOGQ5NqjFmj4lnZ/WGJjGMEWf2yNimVWwatWI+1mro/HBFXT6Kplu+qrtAShh8/5D08WM2mDmx5NqFquzfuC0tMRkYXzH6C5hxCbawvOVY4F2xzDywZlF/AIZ8zfRHoXLpYCVKHOkxloJFrXmOZNGN1t+qZiN4LFjUgO1S7HmfKlXCREvwTfpWVYwd29sqvPg+16nO9r8dINEgBW1+UBpMYIM50NvCaY3FWpnNESCzMAhgtFAQA==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=AtxtMbBFbg0GoR1dRP7KzzYv3Da8vzPdY7sqD5yGufY=; t=1739595264; x=1739685264; 
 b=EoDmx/u3mg6hN6Je1uVDVAXEWGTs2zGCTDVLd1xlpV/USHP3tesZzJRyI96gPrBmdtyPEJZifPu
 zLZz2TkAuFG8+gUvAwEcjZjBEZ/0a35KgbJdeRiHGKc9IvFY16pjbuqQXyg79gLbz1n91tez2V4YC
 KaGf7EHDBImISYUH9WYnJR4kVIrlYybfZiyw3ES56MhNNi49av7hwdb2DqumAsmcdxmbx8I4vAd65
 xPwaPbM9gI3vXCa+V19n4s9RZ/v4gw22zLRp6nfajdQ+8L5BrnXOGNqQYQ2jGTW4oXqyhDltG5san
 z7G351SuRvqUqZ4FR87Wlzg3KIZgHMcB2u5A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=AtxtMbBFbg0GoR1dRP7KzzYv3Da8vzPdY7sqD5yGufY=; t=1739595253; x=1739685253; 
 b=LYFhv9T01Ldh0KCqvmrdosJtwB+9622D2oVUNntnWNHdgGnM1pljLCIeNNV7RVKuhNRQYf2nvIG
 87q4+YkZ3eD/nc4JhxQRBji+EO/aeiXeqNzp4pqnMG2eQgpW1yJ64AQRLYGIoPKYornD8wlrf+C6j
 OHV+PO8YDQNfODCG/34ig4GKTPff5svdR0XzIqoqwgxKbtdkps23jJBeZFzMAjrPcgWvgogH7BlLb
 cZLtCOqT+dXKZfOyKEPQnIb2xSj3OqXkZPZZHJ1osp6FPrWBcNvLdFid4i5+qt81/Qp5ARwHJIte4
 TfY86LigL+n8qMUHVZDwTFHaiTCbreaLd0ww==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=B+vTE/fG; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=EoDmx/u3; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=LYFhv9T0
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: security bump
 version to 17.3
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

MTQuMDIuMjAyNSAyMToxNiwgQmVybmQgS3VobHMg0L/QuNGI0LXRgjoKPiBSZWxlYXNlIG5vdGVz
Ogo+IGh0dHBzOi8vd3d3LnBvc3RncmVzcWwub3JnL2RvY3MvcmVsZWFzZS8xNy4zLwo+IGh0dHBz
Oi8vd3d3LnBvc3RncmVzcWwub3JnL2Fib3V0L25ld3MvcG9zdGdyZXNxbC0xNzMtMTY3LTE1MTEt
MTQxNi1hbmQtMTMxOS1yZWxlYXNlZC0zMDE1Lwo+IAo+IEZpeGVzIENWRS0yMDI1LTEwOTQ6Cj4g
aHR0cHM6Ly93d3cucG9zdGdyZXNxbC5vcmcvc3VwcG9ydC9zZWN1cml0eS9DVkUtMjAyNS0xMDk0
Lwo+IAo+IFVwZGF0ZWQgbGljZW5zZSBoYXNoIGR1ZSB0byBjb3B5cmlnaHQgeWVhciBidW1wOgo+
IGh0dHBzOi8vZ2l0LnBvc3RncmVzcWwub3JnL2dpdHdlYi8/cD1wb3N0Z3Jlc3FsLmdpdDthPWNv
bW1pdGRpZmY7aD03NTk2MjA3MTZhZGIzNDdjMWQ4YzhiMmU2ZjdkODhiOTQ3YTU0Yzk4Cj4gCj4g
U2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KPiAtLS0KPiAgIHBh
Y2thZ2UvcG9zdGdyZXNxbC9wb3N0Z3Jlc3FsLmhhc2ggfCA2ICsrKy0tLQo+ICAgcGFja2FnZS9w
b3N0Z3Jlc3FsL3Bvc3RncmVzcWwubWsgICB8IDIgKy0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3Bv
c3RncmVzcWwvcG9zdGdyZXNxbC5oYXNoIGIvcGFja2FnZS9wb3N0Z3Jlc3FsL3Bvc3RncmVzcWwu
aGFzaAo+IGluZGV4IDk4MjQ2Y2E5YjYuLmU1ODI1MTA4MzIgMTAwNjQ0Cj4gLS0tIGEvcGFja2Fn
ZS9wb3N0Z3Jlc3FsL3Bvc3RncmVzcWwuaGFzaAo+ICsrKyBiL3BhY2thZ2UvcG9zdGdyZXNxbC9w
b3N0Z3Jlc3FsLmhhc2gKPiBAQCAtMSw0ICsxLDQgQEAKPiAtIyBGcm9tIGh0dHBzOi8vZnRwLnBv
c3RncmVzcWwub3JnL3B1Yi9zb3VyY2UvdjE3LjIvcG9zdGdyZXNxbC0xNy4yLnRhci5iejIuc2hh
MjU2Cj4gLXNoYTI1NiAgODJlZjI3YzBhZjM3NTE2OTVkN2Y2NGUyZDk2MzU4MzAwNWZiYjZhMGMz
ZGY2M2QwZTRiNDIyMTFkNzAyMTE2NCAgcG9zdGdyZXNxbC0xNy4yLnRhci5iejIKPiArIyBGcm9t
IGh0dHBzOi8vZnRwLnBvc3RncmVzcWwub3JnL3B1Yi9zb3VyY2UvdjE3LjMvcG9zdGdyZXNxbC0x
Ny4zLnRhci5iejIuc2hhMjU2Cj4gK3NoYTI1NiAgMTNjMThiMzViZjY3YTk3YmQ2Mzk5MjVmYzU4
MWRiN2ZkMmFhZTRkMzU0OGVhYzM5ZmNkYjhkYTc0YWNlMmJlYSAgcG9zdGdyZXNxbC0xNy4zLnRh
ci5iejIKPiAgICMgTGljZW5zZSBmaWxlLCBMb2NhbGx5IGNhbGN1bGF0ZWQKPiAtc2hhMjU2ICA5
YmYyMGVlNDkzOTI2YTdlMTdhNzRiYzdmMDUwODlmYmMwMTQyNjk2NjdiMTU0MGJjMzVhNmIxOTRh
NDBjOWRlICBDT1BZUklHSFQKPiArc2hhMjU2ICBlMzgyMmM0Nzk3ZmFkY2FiMzFhM2ZjNzNmNzVj
MjhhYzIwYzczZDcyYjU2NWRhOTFlOTk3NGNmOTM5OGVmNGQyICBDT1BZUklHSFQKPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9wb3N0Z3Jlc3FsL3Bvc3RncmVzcWwubWsgYi9wYWNrYWdlL3Bvc3RncmVz
cWwvcG9zdGdyZXNxbC5tawo+IGluZGV4IDhlMGVkNDVjMjIuLmE5Y2E5ZjRlZTEgMTAwNjQ0Cj4g
LS0tIGEvcGFja2FnZS9wb3N0Z3Jlc3FsL3Bvc3RncmVzcWwubWsKPiArKysgYi9wYWNrYWdlL3Bv
c3RncmVzcWwvcG9zdGdyZXNxbC5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAgIwo+ICAgIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKPiAgIAo+IC1QT1NUR1JFU1FMX1ZFUlNJT04gPSAxNy4yCj4gK1BP
U1RHUkVTUUxfVkVSU0lPTiA9IDE3LjMKPiAgIFBPU1RHUkVTUUxfU09VUkNFID0gcG9zdGdyZXNx
bC0kKFBPU1RHUkVTUUxfVkVSU0lPTikudGFyLmJ6Mgo+ICAgUE9TVEdSRVNRTF9TSVRFID0gaHR0
cHM6Ly9mdHAucG9zdGdyZXNxbC5vcmcvcHViL3NvdXJjZS92JChQT1NUR1JFU1FMX1ZFUlNJT04p
Cj4gICBQT1NUR1JFU1FMX0xJQ0VOU0UgPSBQb3N0Z3JlU1FMCgpSZXZpZXdlZC1ieTogTWF4aW0g
S29jaGV0a292IDxmaWRvX21heEBpbmJveC5ydT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
