Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7E5C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 19:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCB714094B;
	Sun, 19 Mar 2023 19:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCB714094B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 02y1PYSm1GbL; Sun, 19 Mar 2023 19:56:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B146140981;
	Sun, 19 Mar 2023 19:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B146140981
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CB75C1BF59D
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 19:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3C0440981
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 19:56:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3C0440981
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j6jl6FgGM_Hc for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 19:56:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D9CC4094B
Received: from smtpcmd04131.aruba.it (smtpcmd04131.aruba.it [62.149.158.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D9CC4094B
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 19:56:21 +0000 (UTC)
Received: from [192.168.50.162] ([146.241.96.213])
 by Aruba Outgoing Smtp  with ESMTPSA
 id dz8dpTBgAXAcFdz8dpgWVj; Sun, 19 Mar 2023 20:56:19 +0100
Message-ID: <6f57dc7b-ed61-7218-13a1-34f1456478c8@benettiengineering.com>
Date: Sun, 19 Mar 2023 20:56:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Indrek Kruusa <indrek.kruusa@gmail.com>
References: <20230319192915.264584-1-giulio.benetti@benettiengineering.com>
 <CA+fTLhhVYuSq+ygavwF5wg2SonW55Mg0_ZM2CyOc=jhFUVsOzw@mail.gmail.com>
Content-Language: en-US, it
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CA+fTLhhVYuSq+ygavwF5wg2SonW55Mg0_ZM2CyOc=jhFUVsOzw@mail.gmail.com>
X-CMAE-Envelope: MS4xfELLSZnXkHfMRMvsMu+g/ZIwQOSduJlFDNIGgfIx+YKGtUszCoI/g1/UoHpNllcSLxhQ4+ZmraPMiIhZ8wsxfabPzv503kNZbn4UjK5BH12LxNHCh0W+
 PiUzPXz6o5YBKx6WQe4WT6U5s/eCYroKh95UATGZo/AM38DBIkXeQhqp25c/kjuOLfeH2lecINuP7EX9Gtn1cpGeDuDScuIf8qSYyUi3iIs+WvF2c2a+6X5T
 iX/bRovt3WvzO64rsVa6NlFWZ4sdDxDTW5BJx+wOHQQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1679255779; bh=3y478r82knmKlaG6iNXmz0FD+rY+ImyMUQx/0S3Bb1U=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=atf9zB1MKhNhw2LSjwO7fTs0i1ELXOJEFWalk9Uxo9mKDG0cJcNRzq7QjCufk5KW+
 VOmI1u13aQwPyQRkxYOuYjZkHtG4abaMFsNMNIv8PZy7dq5gUYx9OrkwvXF7eKqLSF
 P4MkLty/QHXOj2pCwJyiOWiV7/N/5pgi8w1Vn1ysVwIcAQm3MCiTJ6SBJHLX9m0B4o
 XsFP3/Z5FLBezr/Q74A1SDcPr7ukVSse43jRiDQh3j90fRkH26nJmDHZ9NdO2bepAo
 amNaLON17Km+i/QoS9AyfECylcTngpn6JDN8aT3eVIGvnaLaBoqlm72jXD1oQL8t0N
 m05uSrYV3PEAw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=atf9zB1M
Subject: Re: [Buildroot] [PATCH] package/mmc-utils: bump to version
 d4c2910981ff99b983734426dfa99632fb81ac6b
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

SGkgSW5kcmVrLAoKcGxlYXNlIHVzZSBwbGFpbi10ZXh0IGUtbWFpbCBhbmQgbm90IEhUTUwgb25l
LAoKT24gMTkvMDMvMjMgMjA6NDIsIEluZHJlayBLcnV1c2Egd3JvdGU6Cj4gS29udGFrdCBHaXVs
aW8gQmVuZXR0aSAoPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20gCj4gPG1h
aWx0bzpnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPj4pIGtpcmp1dGFzIGt1
dXDDpGV2YWwgUCwgCj4gMTkuIG3DpHJ0cyAyMDIzIGtlbGwgMjE6Mjk6Cj4gCj4gICAgIFNpZ25l
ZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJp
bmcuY29tCj4gICAgIDxtYWlsdG86Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNv
bT4+Cj4gICAgIC0tLQo+ICAgICAgwqBwYWNrYWdlL21tYy11dGlscy9tbWMtdXRpbHMuaGFzaCB8
IDQgKystLQo+ICAgICAgwqBwYWNrYWdlL21tYy11dGlscy9tbWMtdXRpbHMubWsgPGh0dHA6Ly9t
bWMtdXRpbHMubWs+wqAgwqB8IDIgKy0KPiAgICAgIMKgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gICAgIGRpZmYgLS1naXQgYS9wYWNrYWdlL21t
Yy11dGlscy9tbWMtdXRpbHMuaGFzaAo+ICAgICBiL3BhY2thZ2UvbW1jLXV0aWxzL21tYy11dGls
cy5oYXNoCj4gICAgIGluZGV4IDEyNTZmNjM0ODcuLjIyZDM0YzNkNDAgMTAwNjQ0Cj4gICAgIC0t
LSBhL3BhY2thZ2UvbW1jLXV0aWxzL21tYy11dGlscy5oYXNoCj4gICAgICsrKyBiL3BhY2thZ2Uv
bW1jLXV0aWxzL21tYy11dGlscy5oYXNoCj4gICAgIEBAIC0xLDMgKzEsMyBAQAo+ICAgICAgwqAj
IExvY2FsbHkgY29tcHV0ZWQKPiAgICAgLXNoYTI1NiAKPiAgICAgZjZlZDFjYjJmMDJkNDlkZjQy
NDRmODg3MmI0N2IyMjc4MGRkNjM0ZmExOWQ4NTcyOThjZTFiNzkzNzUyNzc2ZiAKPiAgICAgbW1j
LXV0aWxzLWRmYzNiNmVjZGE4NGQyMTQxOGZiNDQwOGIzOWM1YzcxZGI0YzY0NTgtYnIxLnRhci5n
ego+ICAgICAtc2hhMjU2IAo+ICAgICBmNTdlM2M2MTY5MTE2YWE5ZmYwNmVlYzk1NzM0Y2EwMDBl
NGQwMTk2NDY3YmIyMjFlODBlNTA1MzBjNzY4MDgxwqAgbW1jLmgKPiAgICAgK3NoYTI1NiAKPiAg
ICAgZTVhOGRhY2YyNmExNzgwMTAyMDJjOGZhN2NiMjhiMDFmNTBmZTk2N2RhOThjZGJkZjMyMGIy
ZjExMDkyMDEwNiAKPiAgICAgbW1jLXV0aWxzLWQ0YzI5MTA5ODFmZjk5Yjk4MzczNDQyNmRmYTk5
NjMyZmI4MWFjNmItYnIxLnRhci5nego+ICAgICArc2hhMjU2IAo+ICAgICBmMGI1M2I5ZDU4ZWUy
NGU4YmQ5YmI2OWJmNGIzMWY4ZDFkMDMxY2Y0ZjVkNTA3ODg0MjE5OGJiYzZhNzc5Y2E1wqAgbW1j
LmgKPiAgICAgZGlmZiAtLWdpdCBhL3BhY2thZ2UvbW1jLXV0aWxzL21tYy11dGlscy5tayA8aHR0
cDovL21tYy11dGlscy5taz4KPiAgICAgYi9wYWNrYWdlL21tYy11dGlscy9tbWMtdXRpbHMubWsg
PGh0dHA6Ly9tbWMtdXRpbHMubWs+Cj4gICAgIGluZGV4IDQzNWU2YWU3ZjEuLmJjMGZjN2FhZjIg
MTAwNjQ0Cj4gICAgIC0tLSBhL3BhY2thZ2UvbW1jLXV0aWxzL21tYy11dGlscy5tayA8aHR0cDov
L21tYy11dGlscy5taz4KPiAgICAgKysrIGIvcGFja2FnZS9tbWMtdXRpbHMvbW1jLXV0aWxzLm1r
IDxodHRwOi8vbW1jLXV0aWxzLm1rPgo+ICAgICBAQCAtNCw3ICs0LDcgQEAKPiAgICAgIMKgIwo+
ICAgICAgwqAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+IAo+ICAgICAtTU1DX1VUSUxTX1ZFUlNJ
T04gPSBkZmMzYjZlY2RhODRkMjE0MThmYjQ0MDhiMzljNWM3MWRiNGM2NDU4Cj4gICAgICtNTUNf
VVRJTFNfVkVSU0lPTiA9IGQ0YzI5MTA5ODFmZjk5Yjk4MzczNDQyNmRmYTk5NjMyZmI4MWFjNmIK
PiAgICAgIMKgTU1DX1VUSUxTX1NJVEUgPQo+ICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9jamIvbW1jLXV0aWxzLmdpdAo+ICAgICA8aHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2piL21tYy11dGlscy5naXQ+
Cj4gCj4gCj4gSSBoYXBwZW5lZCB0byBjbGljayBvbiB0aGF0IGdpdC5rZXJuZWwub3JnIAo+IDxo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jamIvbW1jLXV0
aWxzLmdpdD7CoGxpbmsgCj4gYW5kIGl0IGRvZXNuJ3TCoHdvcmsuIEJ1dCB0aGVuIHdoZXJlIGRv
ZXMgdGhpcyB2ZXJzaW9uIGNvbWUgZnJvbT8KCnRoYXQgaXMgdGhlIGdpdCByZXBvc2l0b3J5IGFk
ZHJlc3MsIGl0J3Mgbm90IHRoZSBzYW1lIGFkZHJlc3Mgb2YgdGhlCmdpdC13ZWIgZnJvbnRlbmQu
IElmIGRvZXNuJ3Qgc2hvdyB1cCBvbiB0aGUgYnJvd3NlciBpdCBkb2Vzbid0IG1lYW4gZ2l0CmRv
ZXNuJ3Qgd29yay4gVHJ5IHRvOgokIGdpdCBjbG9uZSAKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2piL21tYy11dGlscy5naXQKCmFuZCB5b3Ugd2lsbCBz
ZWUgdGhhdCBpdCB3aWxsIGNsb25lIHRoZSByZXBvc2l0b3J5LgoKQmVzdCByZWdhcmRzCi0tIApH
aXVsaW8gQmVuZXR0aQpCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwoKPiAKPiBCZXN0IHJlZ2FyZHMs
Cj4gSW5kcmVrCj4gCj4gCj4gICAgICDCoE1NQ19VVElMU19TSVRFX01FVEhPRCA9IGdpdAo+ICAg
ICAgwqBNTUNfVVRJTFNfTElDRU5TRSA9IEdQTC0yLjAKPiAgICAgLS0gCj4gICAgIDIuMzQuMQo+
IAo+ICAgICBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
ICAgICBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gICAgIGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
IDxtYWlsdG86YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+Cj4gICAgIGh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+ICAgICA8aHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Pgo+IAo+IAo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1h
aWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
