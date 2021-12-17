Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59C7C433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 10:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F41083FC3;
	Fri, 17 Dec 2021 10:16:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z_CIHqfEy_hB; Fri, 17 Dec 2021 10:16:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93C0583FA3;
	Fri, 17 Dec 2021 10:16:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 580B51BF2B5
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 10:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40AE54047F
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 10:16:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=arachnodroid.de
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ib0dDGZ-5GQ3 for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 10:16:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from v220200749773122244.hotsrv.de (unknown
 [IPv6:2a03:4000:47:39d:747f:15ff:fe4f:d530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9CFA340153
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 10:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arachnodroid.de;
 s=dkim; t=1639736158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K9CYnDi2b7YEaEEMZ7LsmRha/QPR9TAUa09bmxiXblI=;
 b=L+hI3PzCJnP46Ksxqc1hCI1B22aq5fTdEJ8uMDqxQsePuzqtZTCbfzSI1vYl5AEraE9JIs
 NIyXcTkcjDVv2UqCSlbut0Ia5XGCy07Yt0nyQTxPBXkh2G7gBk75qGQxpqbsNdVzQmSBQ+
 cBeU4UqYTO5Yk90abeTC/7FY5oltbwU=
Received: from [192.168.1.13] (ip4d1580a8.dynamic.kabel-deutschland.de
 [77.21.128.168])
 by v220200749773122244.hotsrv.de (OpenSMTPD) with ESMTPSA id f1f3ac50
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 10:15:58 +0000 (UTC)
To: buildroot@buildroot.org
References: <bug-14451-163@https.bugs.busybox.net/>
 <bug-14451-163-aEqUC9bjBs@https.bugs.busybox.net/>
 <5e9075fc-3083-b8d2-2358-cc5281b306ac@arachnodroid.de>
 <aafcded5-c0f4-4745-a226-da57d0e7a805__41403.4441857197$1639675757$gmane$org@mind.be>
 <pan$6da85$57c98f32$8301c983$a5945ee7@ID-313208.user.individual.net>
 <1084ea3f-802f-d24b-f613-7bc74c7a1800@mind.be>
From: Michael Taubert <info@arachnodroid.de>
Message-ID: <89da716e-cb91-4d1d-7bd3-07aa90d8b8cc@arachnodroid.de>
Date: Fri, 17 Dec 2021 11:15:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1084ea3f-802f-d24b-f613-7bc74c7a1800@mind.be>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d: don't disable DRI3 for
 some Gallium drivers
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkhCgpJJ3ZlIGFwcGxpZWQgdGhlIHBhdGNoIHRvIHRoZSBsYXRlc3Qgb3JpZ2luL21hc3Rlci4g
T25lIGh1bmsgaGFzIGJlZW4gCnJlamVjdGVkOgoKLS0tIHBhY2thZ2UvbWVzYTNkL0NvbmZpZy5p
bgorKysgcGFja2FnZS9tZXNhM2QvQ29uZmlnLmluCkBAIC03MCw2ICs3NSw4IEBAICBjb25maWcg
QlIyX1BBQ0tBR0VfTUVTQTNEX0RSSV9EUklWRVIKICAgICAgICAgICAgICAgICAhQlIyX1BBQ0tB
R0VfTUVTQTNEX09QRU5HTF9HTFggJiYgXAogICAgICAgICAgICAgICAgICFCUjJfUEFDS0FHRV9N
RVNBM0RfT1BFTkdMX0VHTCAmJiBcCiAgICAgICAgICAgICAgICAgIUJSMl9QQUNLQUdFX01FU0Ez
RF9PU01FU0FfR0FMTElVTQorICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9NRVNBM0RfRFJJMyBp
ZiBcCisgICAgICAgICAgICAgICAoQlIyX1BBQ0tBR0VfWE9SRzcgJiYgQlIyX1RPT0xDSEFJTl9I
QVNfU1lOQ180KQogICAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfWExJQl9MSUJYU0hNRkVOQ0Ug
aWYgXAogICAgICAgICAgICAgICAgIChCUjJfUEFDS0FHRV9YT1JHNyAmJiBCUjJfVE9PTENIQUlO
X0hBU19TWU5DXzQpCgpCdXQgaXQgbG9va3MgZ29vZCBmb3IgbWUgYW55d2F5LiBJJ3ZlIHRyaWVk
IGJ5IHVzaW5nIApyYXNwYmVycnlwaV82NF9kZWZjb25maWcgYW5kIG9ubHkgZW5hYmxlZCBtZXNh
M2Qgd2l0aCBHYWxsaXVtIGRyaXZlcnMgCmZvciBWM0QgYW5kIFZDNC4KCkFjY29yZGluZyB0byB0
aGUgYnVpbGQgbG9nLCBpdCBoYXMgYmVlbiBjb21waWxlZCB3aXRoIERSSTMgc3VwcG9ydC4KClJl
Z2FyZHMsCk1pY2hhZWwKCkFtIDEyLzE2LzIxIHVtIDc6MzMgUE0gc2NocmllYiBBcm5vdXQgVmFu
ZGVjYXBwZWxsZToKPiAKPiAKPiBPbiAxNi8xMi8yMDIxIDE5OjEyLCBCZXJuZCBLdWhscyB3cm90
ZToKPj4gQW0gVGh1LCAxNiBEZWMgMjAyMSAxODoyODo1NiArMDEwMCBzY2hyaWViIEFybm91dCBW
YW5kZWNhcHBlbGxlOgo+Pgo+Pj4gwqDCoCBCZXJuZCwgY2FuIHlvdSBjb21tZW50Pwo+Pgo+PiBI
aSBBcm5vdXQsCj4+Cj4+IG5vLCBiZWNhdXNlIEkgZG8gbm90IHVzZSBidWlsZHJvb3Qgb24gcmJw
aSBoYXJkd2FyZS4KPj4KPj4gQnV0IHRoZSB0b3BpYyB3YXMgYWxyZWFkeSBkaXNjdXNzZWQgdGhp
cyBzdW1tZXIsIHdpdGggbm8gc29sdXRpb24gYWZhaWNzOgo+PiBodHRwczovL3BhdGNod29yay5v
emxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L2xpc3QvPwo+PiBzZXJpZXM9MjQ4NTU1JnN1Ym1p
dHRlcj0mc3RhdGU9KiZxPSZhcmNoaXZlPSZkZWxlZ2F0ZT0KPiAKPiAgwqBHb29kIGZpbmQsIHRo
YW5rcyEKPiAKPiAgwqBNaWNoYWVsLCBjYW4geW91IHRyeSB0aGF0IHBhdGNoIFsxXSBhbmQgc2Vl
IGlmIGl0IHdvcmtzIGZvciB5b3U/Cj4gCj4gIMKgUGV0ZXIsIEkgdGhpbmsgSSdtIGp1c3QgZ29p
bmcgdG8gYXBwbHkgW11dIGV4Y2VwdCB0aGF0IEknbGwgbWFrZSAKPiBCUjJfUEFDS0FHRV9NRVNB
M0RfRFJJMyBhIGJsaW5kIG9wdGlvbiAoaS5lLiBub3QgdXNlciB2aXNpYmxlLCBvbmx5IAo+IHNl
bGVjdGVkIGF1dG9tYXRpY2FsbHkgYnkgdGhlIGRyaXZlcnMsIG11Y2ggbGlrZSBCUjJfUEFDS0FH
RV9NRVNBM0RfRFJJKS4KPiAKPiAgwqBNeSBvdGhlciBtYWpvciBjb21tZW50IGFib3V0IHRoYXQg
cGF0Y2ggd2FzIHRoYXQgSSBzdXNwZWN0ZWQgdGhhdCBpdCAKPiB3b3VsZCBuZWVkIHNvbWUgJ3Nl
bGVjdCcgc3RhdGVtZW50cywgYnV0IEkgZ3Vlc3MgdGhlIGF1dG9idWlsZGVycyB3aWxsIAo+IGlu
Zm9ybSB1cyBvZiB0aGF0LCBzbyB3ZSBjYW4gZ28gYWhlYWQgYW5kIG1lcmdlIGl0Lgo+IAo+ICDC
oERvZXMgdGhhdCBzb3VuZCBPSyB0byB5b3U/Cj4gCj4gIMKgUmVnYXJkcywKPiAgwqBBcm5vdXQK
PiAKPiAKPiBbMV0gCj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxk
cm9vdC9wYXRjaC8yMDIxMDYxMjIyMzAxMS4yNjExOC0xLXBzLnJlcG9ydEBnbXgubmV0LyAKPiAK
PiAKPiAKPj4KPj4gUmVnYXJkcywgQmVybmQKPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+PiBidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwo+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QKPj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
