Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A61C001E0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 21:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2BBB41716;
	Tue,  8 Aug 2023 21:14:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2BBB41716
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v6jO4xQAx68e; Tue,  8 Aug 2023 21:14:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E9AF41742;
	Tue,  8 Aug 2023 21:14:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E9AF41742
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BDEE01BF82D
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 21:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88C3F41716
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 21:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88C3F41716
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sdGSS_n0esGN for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 21:14:26 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 49797408D0
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 21:14:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49797408D0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 44A2B1C0003;
 Tue,  8 Aug 2023 21:14:22 +0000 (UTC)
Date: Tue, 8 Aug 2023 23:14:21 +0200
To: =?UTF-8?B?RmzDoXZpbyBUYXBhasOzcw==?= <flavio.tapajos@newtesc.com.br>
Message-ID: <20230808231421.7f94494d@windsurf>
In-Reply-To: <20230710162914.27264-2-flavio.tapajos@newtesc.com.br>
References: <20230710162914.27264-2-flavio.tapajos@newtesc.com.br>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691529263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EC06Lf/8m2OtvZPI5fbZtu97p+w76t6L42aEtUGIt4M=;
 b=BMRzSgla3SEETtWFDnlI6PX6rb21nVhnVKG0gooywrxW5XU6o3a0budwc5oVhxHMgPC4Ts
 jU+BljrAuj54a3yaV6TZ64/JkV+82h0dmuuCoIJuMnjd+642v/MRhKSi7/ntnEg9bVPE/+
 ZWM+ONZKev6rM1J0FoQstLCS2A911bnuIhcNY56BCyZ3PUekOe08GBVp9YwngkM5GOdrcI
 3soX0Ra+rbp3j1KlIQS52rIp3cveAGMo3HQBEr+o0nlg2FX76eUFrJ74VQNxTW8y95xQNO
 cGXYNn9zVvjc6yzH5K8zgAWS+6jrFNKCpQHq4DpE2cXWU3teNBfoTS3HmSkC1g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BMRzSgla
Subject: Re: [Buildroot] [PATCH 1/1] configs: asus_tinker-s_rk3288: new
 config for the "S" variant of the Tinker Board
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmzDoXZpbywKClRoYW5rcyBmb3IgeW91ciBjb250cmlidXRpb24hCgpPbiBNb24sIDEw
IEp1bCAyMDIzIDEzOjI5OjE1IC0wMzAwCkZsw6F2aW8gVGFwYWrDs3MgPGZsYXZpby50YXBham9z
QG5ld3Rlc2MuY29tLmJyPiB3cm90ZToKCj4gVGhpcyBjb21taXQgZHVwbGljYXRlcyB0aGUgYXN1
c190aW5rZXJfcmszMjg4X2RlZmNvbmZpZyBjaGFuZ2luZzoKPiAKPiAgIC0gQlIyX0xJTlVYX0tF
Uk5FTF9JTlRSRUVfRFRTX05BTUUgdG8gcmszMjg4LXRpbmtlci1zCj4gICAtIEJSMl9UQVJHRVRf
VUJPT1RfQk9BUkRfREVGQ09ORklHIHRvIHRpbmtlci1zLXJrMzI4OAo+ICAgLSBleHRsaW51eC5j
b25mIGRldmljZXRyZWUgdG8gL2Jvb3QvcmszMjg4LXRpbmtlci1zLmR0Ygo+ICAgLSByb290IGRl
dmljZSBmb3JtYXQgdG8gPG1ham9yPjo8bWlub3I+IGluIG9yZGVyIHRvIHByZXZlbnQgdGhlIGtl
cm5lbCB0byBtb3VudCByb290ZnMKPiAgICAgZnJvbSB0aGUgd3JvbmcgZGV2aWNlCj4gICAtIEFk
ZCBGbMOhdmlvIFRhcGFqw7NzIGZvciBjb25maWdzL2FzdXNfdGlua2VyLXNfcmszMjg4X2RlZmNv
bmZpZyBhbmQgZm9yCj4gICAgIGNvbmZpZ3MvYXN1c190aW5rZXItc19yazMyODhfZGVmY29uZmln
IGFuZCBmb3IgYm9hcmQvYXN1cy90aW5rZXItcwo+IAo+IFNpZ25lZC1vZmYtYnk6IEZsw6F2aW8g
VGFwYWrDs3MgPGZsYXZpby50YXBham9zQG5ld3Rlc2MuY29tLmJyPgo+IC0tLQo+ICBERVZFTE9Q
RVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICsrKwo+ICBib2FyZC9hc3VzL3Rp
bmtlci1zL2V4dGxpbnV4LmNvbmYgICAgICB8ICA0ICsrKwo+ICBib2FyZC9hc3VzL3Rpbmtlci1z
L3Bvc3QtYnVpbGQuc2ggICAgICB8ICA5ICsrKysrCj4gIGJvYXJkL2FzdXMvdGlua2VyLXMvcmVh
ZG1lLnR4dCAgICAgICAgIHwgNDMgKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGNvbmZpZ3Mv
YXN1c190aW5rZXItc19yazMyODhfZGVmY29uZmlnIHwgNDYgKysrKysrKysrKysrKysrKysrKysr
KysrKysKPiAgNSBmaWxlcyBjaGFuZ2VkLCAxMDYgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgYm9hcmQvYXN1cy90aW5rZXItcy9leHRsaW51eC5jb25mCj4gIGNyZWF0ZSBtb2Rl
IDEwMDc1NSBib2FyZC9hc3VzL3Rpbmtlci1zL3Bvc3QtYnVpbGQuc2gKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGJvYXJkL2FzdXMvdGlua2VyLXMvcmVhZG1lLnR4dAo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgY29uZmlncy9hc3VzX3Rpbmtlci1zX3JrMzI4OF9kZWZjb25maWcKCkFwcGxpZWQgdG8gbmV4
dCwgdGhhbmtzLgoKSSB0aGluayBpdCB3b3VsZCBiZSBuaWNlIGlmIHlvdSAoZm9yIHRpbmtlci1z
KSBhbmQgR2l1bGlvIChpbiBDYywgZm9yCnRpbmtlcikgd291bGQgY2hhbmdlIHRoZSBkZWZjb25m
aWcgdG8gZ2VuZXJhdGUgYW5kIHVzZSBhIGtlcm5lbCB6SW1hZ2UKaW5zdGVhZCBvZiB1SW1hZ2Uu
IHVJbWFnZSBpcyBraW5kIG9mIGRlcHJlY2F0ZWQsIGFuZCBpdCBkb2Vzbid0IG1ha2UKbXVjaCBz
ZW5zZSB0byB1c2UgdGhhdCBhbnltb3JlLgoKVGhhbmtzIQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0
YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmlu
ZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
