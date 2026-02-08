Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9327CEF06E4
	for <buildroot@archiver.kernel.org>; Sun,  8 Feb 2026 21:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B5E740270;
	Sun,  8 Feb 2026 21:11:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZaDhcOixU7hE; Sun,  8 Feb 2026 21:11:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50D6740275
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770585092;
	bh=UjyTW/vdpJXIoUSn/Y1S7jx7WvTTG4U4K4k9Qo+bsPE=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=sKPHqTXlHo9Mo6u8lVEPF+HWtXDBYML/pORFBFf8i7U+gfygMBid8++YLPbebowEY
	 +9Mf+Gc8BlHYeYbM1SceWpw/Rx4LDpH2nbtdjAt3SDwLCGHheNFTkWnMPx8y92i2sJ
	 FA0EzwMQxY5ZTKa08t5T5HarPRewCsElVsBTFFtQIdsExAemFGKIXvQwpvd0oii5w0
	 7UUEMXhZporI9zB8NEutxV3DuYD/fLtMxLfhLWPG3wUzwByORJId1jYpjvs9DRMby9
	 Uc3qoPeL+jeqOaRFtnihs+l5XWlKLU7PZDKhA2w3179NwxA8F/I55d4qc61x4OJO/o
	 jevuD1w2Gcl9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50D6740275;
	Sun,  8 Feb 2026 21:11:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CEA82A2
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 21:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DDD04026E
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 21:11:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rueC6jzjmBoJ for <buildroot@buildroot.org>;
 Sun,  8 Feb 2026 21:11:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3A84040220
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A84040220
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A84040220
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 21:11:27 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:ea7c:3c74:c86f:359b] (unknown
 [IPv6:2a01:e0a:12:eba0:ea7c:3c74:c86f:359b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 24C89BFB5B;
 Sun,  8 Feb 2026 22:11:24 +0100 (CET)
Message-ID: <41b16985-1bcd-46a7-8b85-30161dab2937@grenoble.cnrs.fr>
Date: Sun, 8 Feb 2026 22:11:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr
To: Buildroot development <buildroot@buildroot.org>
Cc: Biagio Montaruli <biagio.hkr@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1770585084;
 bh=z64MqSKpkAoPVt5GUj3DXmV8Bcx2iVt4lbNKUrcU1AA=;
 h=Date:To:Cc:From:Subject:From;
 b=OCWQstp+v0Jd0si5zEJ9oqBAXKReUfgjN3u/tFcmqyufoB2O3aeepu1KCrK3ESAOx
 lyA6NgDBWcjBNyiulIhw4riZq9/bRdbkxuVCG9I9prebMFJc7Euguack8tRdGGx1b+
 8mVDmc55yBqfhEPqoWm/ENYoDi9s5FLzQqwQCaQY52toYePejlQvPnFKGd1ShWzcee
 OOclP0JCLu1YD6OSipKY3Vt0zbcktR5wWIv9MKll1zgDYk6xUXwcQABejMh+FNBxzc
 T/m0SnDmxHGofFISzcbiLKoiC81SWg07eOmxD3HD3ACmnt1TaWJ+RnoUiXUceQVb9/
 lVAxrHwtD4yCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=OCWQstp+
Subject: [Buildroot] [PATCH 1/1] configs/acmesystems_acqua_a5_*: remove
 at91bootstrap3 licence
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hlbiB1c2luZyBhIHNwZWNpZmljIGdpdCByZXBvIGFuZCB2ZXJzaW9uIGZvciBhdDkxYm9vdHN0
cmFwMywKQlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQM19MSUNFTlNFX0ZJTEVTIGRlZmF1bHRzIHRv
ICJMSUNFTlNFUy9NSVQudHh0Ii4KSG93ZXZlciB0aGUgZ2l0IHZlcnNpb24gd2UgdXNlIChuYW1l
bHkgdjMuMTAuMykgZG9lcyBub3QgcHJvdmlkZSB0aGlzCmZpbGUuIEFjdHVhbGx5LCBpdCBkb2Vz
IG5vdCBwcm92aWRlIGEgbGljZW5jZSBmaWxlIGF0IGFsbC4gVGhpcyBjYXVzZXMK4oCYbWFrZSBs
ZWdhbC1pbmZv4oCZIHRvIGZhaWwgd2l0aDoKCj4+PiBhdDkxYm9vdHN0cmFwMyB2My4xMC4zIENv
bGxlY3RpbmcgbGVnYWwgaW5mbwpzaGEyNTZzdW06IC9idWlsZHMvYnVpbGRyb290Lm9yZy9idWls
ZHJvb3Qvb3V0cHV0L2J1aWxkL2F0OTFib290c3RyYXAzLXYzLjEwLjMvTElDRU5TRVMvTUlULnR4
dDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQpFUlJPUjogd2hpbGUgY2hlY2tpbmcgaGFzaGVz
IGZyb20gYm9vdC9hdDkxYm9vdHN0cmFwMy9hdDkxYm9vdHN0cmFwMy5oYXNoCkVSUk9SOiBMSUNF
TlNFUy9NSVQudHh0IGhhcyB3cm9uZyBzaGEyNTYgaGFzaDoKRVJST1I6IGV4cGVjdGVkOiA1YTM4
MDliMWMyYmExM2I3MjQyNTcyMzIyOTUxMzExYzU4NDQxOWYxZjg1MTZmNjY1ZDZjMDZmMDY2OGQ3
OGRlCkVSUk9SOiBnb3QgICAgIDoKRVJST1I6IEluY29tcGxldGUgZG93bmxvYWQsIG9yIG1hbi1p
bi10aGUtbWlkZGxlIChNSVRNKSBhdHRhY2sKCkxldCdzIGJlIGV4cGxpY2l0IHRoYXQgdGhlcmUg
aXMgbm8gbGljZW5jZSBmaWxlIHRvIGNoZWNrLgoKRml4ZXM6CiAtIGh0dHBzOi8vZ2l0bGFiLmNv
bS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTI5OTI4MTUzODYKIC0gaHR0cHM6Ly9n
aXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xMjk5MjgxNTM5MApTaWdu
ZWQtb2ZmLWJ5OiBFZGdhciBCb25ldCA8Ym9uZXRAZ3Jlbm9ibGUuY25ycy5mcj4KLS0tCiBjb25m
aWdzL2FjbWVzeXN0ZW1zX2FjcXVhX2E1XzI1Nm1iX2RlZmNvbmZpZyB8IDEgKwogY29uZmlncy9h
Y21lc3lzdGVtc19hY3F1YV9hNV81MTJtYl9kZWZjb25maWcgfCAxICsKIDIgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvY29uZmlncy9hY21lc3lzdGVtc19hY3F1
YV9hNV8yNTZtYl9kZWZjb25maWcgYi9jb25maWdzL2FjbWVzeXN0ZW1zX2FjcXVhX2E1XzI1Nm1i
X2RlZmNvbmZpZwppbmRleCBjYTRiYTI3YTI4Li5mMmFiNjY2MzFmIDEwMDY0NAotLS0gYS9jb25m
aWdzL2FjbWVzeXN0ZW1zX2FjcXVhX2E1XzI1Nm1iX2RlZmNvbmZpZworKysgYi9jb25maWdzL2Fj
bWVzeXN0ZW1zX2FjcXVhX2E1XzI1Nm1iX2RlZmNvbmZpZwpAQCAtMjMsNiArMjMsNyBAQCBCUjJf
VEFSR0VUX0FUOTFCT09UU1RSQVAzPXkKIEJSMl9UQVJHRVRfQVQ5MUJPT1RTVFJBUDNfQ1VTVE9N
X0dJVD15CiBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX0NVU1RPTV9SRVBPX1VSTD0iaHR0cHM6
Ly9naXRodWIuY29tL2xpbnV4NHNhbS9hdDkxYm9vdHN0cmFwLmdpdCIKIEJSMl9UQVJHRVRfQVQ5
MUJPT1RTVFJBUDNfQ1VTVE9NX1JFUE9fVkVSU0lPTj0idjMuMTAuMyIKK0JSMl9UQVJHRVRfQVQ5
MUJPT1RTVFJBUDNfTElDRU5TRV9GSUxFUz0iIgogQlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQM19E
RUZDT05GSUc9ImFjcXVhLTI1Nm0iCiBCUjJfUEFDS0FHRV9IT1NUX0RPU0ZTVE9PTFM9eQogQlIy
X1BBQ0tBR0VfSE9TVF9HRU5JTUFHRT15CmRpZmYgLS1naXQgYS9jb25maWdzL2FjbWVzeXN0ZW1z
X2FjcXVhX2E1XzUxMm1iX2RlZmNvbmZpZyBiL2NvbmZpZ3MvYWNtZXN5c3RlbXNfYWNxdWFfYTVf
NTEybWJfZGVmY29uZmlnCmluZGV4IDI0MGRmYzQ2YjYuLjE3MmVhZWYzOWYgMTAwNjQ0Ci0tLSBh
L2NvbmZpZ3MvYWNtZXN5c3RlbXNfYWNxdWFfYTVfNTEybWJfZGVmY29uZmlnCisrKyBiL2NvbmZp
Z3MvYWNtZXN5c3RlbXNfYWNxdWFfYTVfNTEybWJfZGVmY29uZmlnCkBAIC0yMyw2ICsyMyw3IEBA
IEJSMl9UQVJHRVRfQVQ5MUJPT1RTVFJBUDM9eQogQlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQM19D
VVNUT01fR0lUPXkKIEJSMl9UQVJHRVRfQVQ5MUJPT1RTVFJBUDNfQ1VTVE9NX1JFUE9fVVJMPSJo
dHRwczovL2dpdGh1Yi5jb20vbGludXg0c2FtL2F0OTFib290c3RyYXAuZ2l0IgogQlIyX1RBUkdF
VF9BVDkxQk9PVFNUUkFQM19DVVNUT01fUkVQT19WRVJTSU9OPSJ2My4xMC4zIgorQlIyX1RBUkdF
VF9BVDkxQk9PVFNUUkFQM19MSUNFTlNFX0ZJTEVTPSIiCiBCUjJfVEFSR0VUX0FUOTFCT09UU1RS
QVAzX0RFRkNPTkZJRz0iYWNxdWEtNTEybSIKIEJSMl9QQUNLQUdFX0hPU1RfRE9TRlNUT09MUz15
CiBCUjJfUEFDS0FHRV9IT1NUX0dFTklNQUdFPXkKLS0gCjIuNDMuMApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
