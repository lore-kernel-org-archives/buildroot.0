Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C0DC3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 19:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61D3580B6D;
	Fri,  9 Aug 2024 19:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ldOrhmLwpi4O; Fri,  9 Aug 2024 19:30:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BD0684482
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BD0684482;
	Fri,  9 Aug 2024 19:30:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C8061BF990
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 19:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8556C84482
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 19:30:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tno0noyxxAzN for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 19:30:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 78C42842BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78C42842BB
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78C42842BB
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 19:30:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E81C2E0003;
 Fri,  9 Aug 2024 19:30:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1scVJo-000JTk-0O;
 Fri, 09 Aug 2024 21:30:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <5DD722F6-F9EE-4517-9E55-5A61BB01F196@gmail.com>
 <1c7577ac-1ced-4571-a0a0-61abd6c4e1a1@mind.be>
Date: Fri, 09 Aug 2024 21:30:31 +0200
In-Reply-To: <1c7577ac-1ced-4571-a0a0-61abd6c4e1a1@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Sat, 13 Jul 2024 11:09:53
 +0200")
Message-ID: <87wmkpo5ns.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] toolchain/toolchain-wrapper: make gcc
 --help -v work correctly
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
Cc: Sagi Mor <sagimor6@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkFybm91dCIgPT0gQXJub3V0IFZhbmRlY2FwcGVsbGUgdmlhIGJ1aWxkcm9vdCA8YnVp
bGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyaXRlczoKCiA+IE9uIDA3LzAxLzIwMjMgMTk6MDksIFNh
Z2kgTW9yIHdyb3RlOgogPj4gbWFrZSAiZ2NjIC0taGVscCAtdiIgZGlzcGxheSBhbGwgdGhlIG9w
dGlvbnMsIHNvbWUgcGFja2FnZXMgZGVwZW5kIG9uIHRoaXMKID4+IGh0dHBzOi8vYnVncy5idXN5
Ym94Lm5ldC9zaG93X2J1Zy5jZ2k/aWQ9MTUyMzEKID4+IDxodHRwczovL2J1Z3MuYnVzeWJveC5u
ZXQvc2hvd19idWcuY2dpP2lkPTE1MjMxPgogPj4gU2lnbmVkLW9mZi1ieTogU2FnaSBNb3IgPHNh
Z2ltb3I2QGdtYWlsLmNvbT4KCiA+ICBFdmVuIHRob3VnaCB0aGUgcmVhc29uIHRvIHN1cHBvcnQg
dGhpcyBpcyBhIGJpdCBpZmZ5LCBpdCBkb2VzIG1ha2UgYQogPiAgbG90IG9mIHNlbnNlIHRvIGJ5
cGFzcyBldmVyeXRoaW5nIGlmIC0taGVscCBpcyBzcGVjaWZpZWQuIFRoZXJlIGFyZQogPiAgcHJv
YmFibHkgc29tZSBvdGhlciBvcHRpb25zIHRvbyB3aGVyZSB3ZSBjb3VsZCBieXBhc3MuCgogPj4g
LS0tCiA+PiDCoHRvb2xjaGFpbi90b29sY2hhaW4td3JhcHBlci5jIHwgMTEgKysrKysrKysrKysK
ID4+IMKgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKID4+IGRpZmYgLS1naXQgYS90
b29sY2hhaW4vdG9vbGNoYWluLXdyYXBwZXIuYwogPj4gYi90b29sY2hhaW4vdG9vbGNoYWluLXdy
YXBwZXIuYwogPj4gaW5kZXggMzdiMjRkZDI0YS4uODVkNTkyYWQyZCAxMDA2NDQKID4+IC0tLSBh
L3Rvb2xjaGFpbi90b29sY2hhaW4td3JhcHBlci5jCiA+PiArKysgYi90b29sY2hhaW4vdG9vbGNo
YWluLXdyYXBwZXIuYwogPj4gQEAgLTQ5OCw2ICs0OTgsMTcgQEAgaW50IG1haW4oaW50IGFyZ2Ms
IGNoYXIgKiphcmd2KQogPj4gfQogPj4gfQogPj4gKy8qIGRyb3AgYWxsIG5vbiBmb3J3YXJkcyBh
cmdzIGlmIC0taGVscCBpcyBzcGVjaWZpZWQgKi8KID4+ICtmb3IgKGkgPSAxOyBpIDwgYXJnYzsg
aSsrKSB7CiA+PiAraWYgKCFzdHJjbXAoYXJndltpXSwgIi0taGVscCIpKSB7CiA+PiArY3VyID0g
YXJncyArIDE7CgogPiAgVGhpcyBpcyBhIGJpdCBleG90aWMgYW5kIGhhcmQgdG8gdW5kZXJzdGFu
ZCwgc28gaW5zdGVhZCBJIG1vdmVkIGl0IHRvCiA+ICB0aGUgYmVnaW5uaW5nIGFuZCBjaGFuZ2Vk
IHRvOgoKID4gCQlmcHJpbnRmKHN0ZGVyciwgIlRvb2xjaGFpbiB3cmFwcGVyIHdhcyBjYWxsZWQg
d2l0aDoiKTsKID4gCQlmb3IgKGkgPSAwOyBpIDwgYXJnYzsgaSsrKQogPiAJCQlmcHJpbnRmKHN0
ZGVyciwgIiVzJyVzJyIsCiA+IAkJCQkoZGVidWcgPT0gMikgPyAiXG4gICAgIiA6ICIgIiwgYXJn
dltpXSk7CiA+IAkJZnByaW50ZihzdGRlcnIsICJcbiIpOwoKID4gIEFwcGxpZWQgdG8gbWFzdGVy
LCB0aGFua3MuCgpDb21taXR0ZWQgdG8gMjAyNC4wMi54IGFuZCAyMDI0LjA1LngsIHRoYW5rcy4K
Ci0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
