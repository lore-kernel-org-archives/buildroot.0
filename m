Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A26ACCFA02
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 13:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D59B66F47C;
	Sun,  2 Nov 2025 13:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JBu73ChpeL8J; Sun,  2 Nov 2025 13:06:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D81086F538
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D81086F538;
	Sun,  2 Nov 2025 13:06:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 69274222
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 13:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51DCE6F538
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 13:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id szZ2MuMQeQGx for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 13:06:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6D8066F47C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D8066F47C
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D8066F47C
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 13:06:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id C1516780371;
 Sun,  2 Nov 2025 14:06:16 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Nov 2025 14:06:16 +0100
MIME-Version: 1.0
Date: Sun, 02 Nov 2025 14:06:16 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251102111011.1390948-2-bernd@kuhls.net>
References: <20251102111011.1390948-1-bernd@kuhls.net>
 <20251102111011.1390948-2-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <b53e88b6bbee3afc7ef3c56b57e5f5a2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762088777;
 bh=/YC7UqhLE4QMcy208P0sjiTqcLl04hcdPRplv6evU6c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JSQukZA3rbWElm9c1M03/aK/QrJ9iaUtoI/23Qv1324cpt+1LC8DLRh1gm2sPivNc
 mFCf+RBBcp3UYWzbE+PZOV7TrdZIqx53O1ZLnSaXtOe9m2WqYmbHHP1DRrqhJNYcB1
 /o3oZkYZB9EsQF6tMvMx4xiBPCPm3F0yvdGSVJ0Mz9ODf72bCXd+RR1pigDfmOzdYC
 umdIINm+u9pGToB5LjgyCq69GHJxPQ/ZZRd+86c3KHjck3uPyOgq1ng2z3vQwGifEt
 SqexGKV82CFbX02PPQ7dVURXZg0afauA7FukPui2Cnx6x5J64bjbZSd4SckSy2w0h5
 +wSQaSQGsX85g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JSQukZA3
Subject: Re: [Buildroot] [PATCH 2/2] package/live555: bump version to
 2025.10.13
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQmVybmQsCgpUaGFua3MgZm9yIHRoZSBwYXRjaC4gSSBoYXZlIGZldyBjb21tZW50cywgc2Vl
IGJlbG93LgoKT24gMDIvMTEvMjAyNSAxMjoxMCwgQmVybmQgS3VobHMgd3JvdGU6Cj4gQWRkZWQg
LXN0ZD1jKysyMCB0byBlbmFibGUgc3RkOjphdG9taWNfZmxhZzo6dGVzdCB3aGljaCB3YXMgaW50
cm9kdWNlZAo+IGluIGdjYyAxMS4xOgo+IGh0dHBzOi8vZ2NjLmdudS5vcmcvb25saW5lZG9jcy9s
aWJzdGRjKysvbWFudWFsL3N0YXR1cy5odG1sI3N0YXR1cy5pc28uMjAyMAo+IChzZWUgUDExMzVS
NikKPiAKPiBGb3Igb2xkZXIgY29tcGlsZXJzIC1ETk9fU1REX0xJQj0xIGNhbiBiZSB1c2VkIHRv
IGVuYWJsZSBhIGNvZGUgcGF0aAo+IHdpdGhvdXQgc3RkOjphdG9taWNfZmxhZzo6dGVzdCwgY29w
aWVkIGZyb206Cj4gaHR0cHM6Ly9naXRodWIuY29tL0RyYWdvbkZseUJTRC9EZWx0YVBvcnRzL2Nv
bW1pdC9jZmMzODhlNmE2YmYwMTFlMjhmMGNiZWJhZWFlNzRkMmJiNTE2YTAyCj4gCj4gU2lnbmVk
LW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KPiAtLS0KPiAgcGFja2FnZS9s
aXZlNTU1L2xpdmU1NTUuaGFzaCB8IDYgKysrLS0tCj4gIHBhY2thZ2UvbGl2ZTU1NS9saXZlNTU1
Lm1rICAgfCA5ICsrKysrKysrLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGl2ZTU1NS9saXZlNTU1
Lmhhc2ggCj4gYi9wYWNrYWdlL2xpdmU1NTUvbGl2ZTU1NS5oYXNoCj4gaW5kZXggZDRmYTkzZDAy
OS4uZjBhNTZiZGEzMiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpdmU1NTUvbGl2ZTU1NS5oYXNo
Cj4gKysrIGIvcGFja2FnZS9saXZlNTU1L2xpdmU1NTUuaGFzaAo+IEBAIC0xLDUgKzEsNSBAQAo+
IC0jIEZyb20gaHR0cDovL3d3dy5saXZlNTU1LmNvbS9saXZlTWVkaWEvcHVibGljL2xpdmU1NTUt
bGF0ZXN0LW1kNS50eHQKPiAtbWQ1ICAzYzE5OTJiMGU5Yjg3MWJjYWQ3NDkxYTNkYTU0MTc4MSAg
bGl2ZS4yMDIxLjA1LjAzLnRhci5nego+ICsjIEZyb20gaHR0cDovL3d3dy5saXZlNTU1LmNvbS9s
aXZlTWVkaWEvcHVibGljL2xpdmU1NTUtbGF0ZXN0LXNoYTEudHh0Cj4gK3NoYTEgIDQ4MzE0NmIx
NWM1ZmRiOTczYjg4ZmMzMThmMjc3MmYwMjIyNTM1NjMgIGxpdmUuMjAyNS4xMC4xMy50YXIuZ3oK
PiAgIyBMb2NhbGx5IGdlbmVyYXRlZAo+IC1zaGEyNTYgIAo+IGFlNzMyNDFmOWNjNGFiNzQwZDYw
NzM3YzA0MzhkNjJhNzYzNWFmMzgyMmRlNWQ4NGFjZjI3NTc5M2RlNDIwMjkgIAo+IGxpdmUuMjAy
MS4wNS4wMy50YXIuZ3oKPiArc2hhMjU2ICAKPiA0NGViNmFlNGFlMDJlZjY4YTUwMjhkOWZjOGI3
MGM0NWI5YmE0NWMwNThmODQ2YjY4YmM0ZDMyYzc0MzU1ZjQ5ICAKPiBsaXZlLjIwMjUuMTAuMTMu
dGFyLmd6Cj4gIHNoYTI1NiAgCj4gZGE3ZWFiYjdiYWZkZjdkM2FlNWU5ZjIyM2FhNWJkYzFlZWNl
NDVhYzU2OWRjMjFiM2IwMzc1MjBiNDQ2NDc2OCAgCj4gQ09QWUlORy5MRVNTRVIKPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9saXZlNTU1L2xpdmU1NTUubWsgYi9wYWNrYWdlL2xpdmU1NTUvbGl2ZTU1
NS5tawo+IGluZGV4IDFlMTUzMWVlNTMuLjk4ZTExNWFiMjEgMTAwNjQ0Cj4gLS0tIGEvcGFja2Fn
ZS9saXZlNTU1L2xpdmU1NTUubWsKPiArKysgYi9wYWNrYWdlL2xpdmU1NTUvbGl2ZTU1NS5tawo+
IEBAIC00LDcgKzQsNyBAQAo+ICAjCj4gIAo+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gCj4g
LUxJVkU1NTVfVkVSU0lPTiA9IDIwMjEuMDUuMDMKPiArTElWRTU1NV9WRVJTSU9OID0gMjAyNS4x
MC4xMwoKVGhpcyBuZXcgdmVyc2lvbiBicmVha3MgdGhlIHZsYyBjb21waWxhdGlvbiAod2hpY2gg
aXMgdGhlIG9ubHkgcGFja2FnZSAKdGhhdApjYW4gdXNlIGxpdmU1NTUpLgoKWW91IGNhbiByZXBy
b2R1Y2UgdGhlIGlzc3VlIHdpdGggdGhlIGNvbW1hbmRzOgoKY2F0ID4uY29uZmlnIDw8RU9GCkJS
Ml9hYXJjaDY0PXkKQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15CkJSMl9QQUNLQUdFX0xJVkU1NTU9
eQpCUjJfUEFDS0FHRV9WTEM9eQpFT0YKbWFrZSBvbGRkZWZjb25maWcKbWFrZSB2bGMKCj4gIExJ
VkU1NTVfU09VUkNFID0gbGl2ZS4kKExJVkU1NTVfVkVSU0lPTikudGFyLmd6Cj4gICMgdXBzdHJl
YW0gc2l0ZSByZW1vdmVzIG9sZGVyIHZlcnNpb25zLCB1c2UgdmlkZW9sYW4ub3JnIGluc3RlYWQK
PiAgTElWRTU1NV9TSVRFID0gaHR0cHM6Ly9kb3dubG9hZC52aWRlb2xhbi5vcmcvY29udHJpYi9s
aXZlNTU1Cj4gQEAgLTI5LDYgKzI5LDEzIEBAIExJVkU1NTVfTElCUkFSWV9MSU5LID0gJChUQVJH
RVRfQ0MpIC1vCj4gIExJVkU1NTVfQ0ZMQUdTICs9IC1mUElDCj4gIGVuZGlmCj4gCj4gKyMg4oCY
c3RydWN0IHN0ZDo6YXRvbWljX2ZsYWfigJkgaGFzIG5vIG1lbWJlciBuYW1lZCDigJh0ZXN04oCZ
CgpUaGlzIGxpbmUgaGFzIFVURi04IGJhY2txdW90ZXMsIHdoaWNoIGdlbmVyYXRlcyBjaGVjay1w
YWNrYWdlIGVycm9ycy4KQ291bGQgeW91IGNoYW5nZSB0aG9zZSB0byBBU0NJSSBxdW90ZXMsIHBs
ZWFzZT8KCj4gK2lmZXEgKCQoQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfMTEpLHkpCj4gK0xJ
VkU1NTVfQ0ZMQUdTICs9IC1zdGQ9YysrMjAKPiArZWxzZQo+ICtMSVZFNTU1X0NGTEFHUyArPSAt
RE5PX1NURF9MSUI9MQo+ICtlbmRpZgo+ICsKPiAgaWZlcSAoJChCUjJfUEFDS0FHRV9PUEVOU1NM
KSx5KQo+ICBMSVZFNTU1X0RFUEVOREVOQ0lFUyArPSBob3N0LXBrZ2NvbmYgb3BlbnNzbAo+ICBM
SVZFNTU1X0NPTlNPTEVfTElCUyA9IGAkKFBLR19DT05GSUdfSE9TVF9CSU5BUlkpIC0tbGlicyBv
cGVuc3NsYAo+IC0tCj4gMi40Ny4zCgpDb3VsZCB5b3Ugc2VuZCBhbiB1cGRhdGVkIHBhdGNoLCBw
bGVhc2U/CgpCZXN0IHJlZ2FyZHMsCgpKdWxpZW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
