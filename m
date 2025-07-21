Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A877AC87FC5
	for <buildroot@archiver.kernel.org>; Mon, 21 Jul 2025 08:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57BF141EC1;
	Mon, 21 Jul 2025 08:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LTCSD3wL_31J; Mon, 21 Jul 2025 08:19:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6523D41F27
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6523D41F27;
	Mon, 21 Jul 2025 08:19:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 510671F7
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 08:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3759741EC1
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 08:19:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oANglpDpPapy for <buildroot@buildroot.org>;
 Mon, 21 Jul 2025 08:19:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0F04F41EBE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F04F41EBE
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F04F41EBE
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 08:19:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D217430D0;
 Mon, 21 Jul 2025 08:19:27 +0000 (UTC)
To: buildroot@buildroot.org,
 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Olivier Benjamin <olivier.benjamin@bootlin.com>,
 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>
Date: Mon, 21 Jul 2025 10:19:26 +0200
Message-ID: <2555886.XAFRqVoOGU@booty>
Organization: Bootlin
In-Reply-To: <20250709-perf_libtraceevent-v2-1-3ea54fbe6b5b@bootlin.com>
References: <20250709-perf_libtraceevent-v2-0-3ea54fbe6b5b@bootlin.com>
 <20250709-perf_libtraceevent-v2-1-3ea54fbe6b5b@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejudehkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkohgjfhgggfgtsehtqhertddttdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdfggedvgeelheehheekudfhheevgfeivdejtdfhkeeijedtvdehtddujeeufeelnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrs
 hdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753085967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PugA4oGMwnH1l0wr4V+2mr86f6DhBgwFrC8N/WkTPsE=;
 b=F/4Mv32G93ZOvw6/QjGFP7TJ0JymoVv0KKylfRWJNp4LRBqFC29sXTLG/7Wn0ns/Va5pYj
 s9zze+7WmUYDdL5D/iDJCoy2SZ6W3ZD2hm3XPK5uv/CBM+Fu36ZbrGKqbinixx7XZjkw1i
 8+0ArUAGHLPsGjcygjS9gqlWNZdZtMSbWoqm2mChQ0hrOu5J+lpZdSBb6zjiNR4z/qO/pP
 oQ7Lt4hpItsfjY/C019eJ/sGi3u+w7XfIsYyj/9b2yPrGHIyNN2817eg/A6WQzuBLL2ZWP
 F8nCEGMe5EDC4fqt3VAIXPaaWEKp30MWQeDxA4d3BT+E0FYVcloeJQT4H/OsTw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F/4Mv32G
Subject: Re: [Buildroot] [PATCH v2 1/2] package/linux-tools: perf: build
 with libtraceevent support when it is selected
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gbWVyY29sZWTDrCA5IGx1Z2xpbyAyMDI1IDE3OjA0OjE0IE9yYSBsZWdhbGUgZGVsbOKAmUV1
cm9wYSBjZW50cmFsZSAKQWxleGlzIExvdGhvcsOpIHdyb3RlOgo+V2hlbiB0cnlpbmcgdG8gcGVy
Zm9ybSBhIGN1c3RvbSB1cHJvYmUgcmVjb3JkaW5nIG9uIGEgdGFyZ2V0IHdpdGggcGVyZgo+YnVp
bHQgYnkgYnVpbGRyb290LCB0aGUgcmVjb3JkaW5nIHN0ZXAgZmFpbHMgYXMgcGVyZiBjYW4gbm90
IHJlY29yZAo+dXByb2JlcyB3aXRob3V0IGxpYnRyYWNlZXZlbnQgc3VwcG9ydDoKPgo+ICAkIHBl
cmYgcHJvYmUgLXggbGlua2VkX2xpc3QgaW5zZXJ0X25hbWUgaW5kZXgKPiAgVGFyZ2V0IHByb2dy
YW0gaXMgY29tcGlsZWQgd2l0aG91dCBvcHRpbWl6YXRpb24uIFNraXBwaW5nIHByb2xvZ3VlLgo+
ICBQcm9iZSBvbiBhZGRyZXNzIDB4ODA4IHRvIGZvcmNlIHByb2JpbmcgYXQgdGhlIGZ1bmN0aW9u
IGVudHJ5Lgo+Cj4gIEFkZGVkIG5ldyBldmVudDoKPiAgICBwcm9iZV9saW5rZWRfbGlzdDppbnNl
cnRfbmFtZSAob24gaW5zZXJ0X25hbWUgaW4KPi9yb290L2dkYi9saW5rZWRfbGlzdCB3aXRoIGlu
ZGV4KQo+Cj4gIHBlcmYgaXMgbm90IGxpbmtlZCB3aXRoIGxpYnRyYWNlZXZlbnQsIHRvIHVzZSB0
aGUgbmV3IHByb2JlIHlvdSBjYW4KPnVzZSB0cmFjZWZzOgo+Cj4gICAgICAgICAgY2QgL3N5cy9r
ZXJuZWwvdHJhY2luZy8KPiAgICAgICAgICBlY2hvIDEgPiBldmVudHMvcHJvYmVfbGlua2VkX2xp
c3QvaW5zZXJ0X25hbWUvZW5hYmxlCj4gICAgICAgICAgZWNobyAxID4gdHJhY2luZ19vbgo+ICAg
ICAgICAgIGNhdCB0cmFjZV9waXBlCj4gICAgICAgICAgQmVmb3JlIHJlbW92aW5nIHRoZSBwcm9i
ZSwgZWNobyAwID4KPmV2ZW50cy9wcm9iZV9saW5rZWRfbGlzdC9pbnNlcnRfbmFtZS9lbmFibGUg
JCBwZXJmIHJlY29yZCAtZQo+cHJvYmVfbGlua2VkX2xpc3Q6aW5zZXJ0X25hbWUgLi9saW5rZWRf
bGlzdCBldmVudCBzeW50YXggZXJyb3I6Cj4ncHJvYmVfbGlua2VkX2xpc3Q6aW5zZXJ0X25hbWUn
Cj4gICAgICAgICAgICAgICAgICAgICAgIFxfX18gdW5zdXBwb3J0ZWQgdHJhY2Vwb2ludAo+Cj4g
IGxpYnRyYWNlZXZlbnQgaXMgbmVjZXNzYXJ5IGZvciB0cmFjZXBvaW50IHN1cHBvcnQKPiAgUnVu
ICdwZXJmIGxpc3QnIGZvciBhIGxpc3Qgb2YgdmFsaWQgZXZlbnRzCj4KPiAgIFVzYWdlOiBwZXJm
IHJlY29yZCBbPG9wdGlvbnM+XSBbPGNvbW1hbmQ+XQo+ICAgICAgb3I6IHBlcmYgcmVjb3JkIFs8
b3B0aW9ucz5dIC0tIDxjb21tYW5kPiBbPG9wdGlvbnM+XQo+Cj4gICAgICAtZSwgLS1ldmVudCA8
ZXZlbnQ+ICAgZXZlbnQgc2VsZWN0b3IuIHVzZSAncGVyZiBsaXN0JyB0byBsaXN0Cj5hdmFpbGFi
bGUgZXZlbnRzCj4KPmxpYnRyYWNlZXZlbnQgc3VwcG9ydCBmb3IgcGVyZiBoYXMgYmVlbiBkaXNh
YmxlZCB3aXRoIGNvbW1pdAo+YjRhYjQ1YTVjMWRiICgicGFja2FnZS9saW51eC10b29sczogZGlz
YWJsZSBsaWJ0cmFjZXZlbnQgZGV0ZWN0aW9uIikKPmJlY2F1c2UgdGhlcmUgd2FzIG5vIGxpYnRy
YWNlZXZlbnQgcGFja2FnZSBpbiBidWlsZHJvb3QgdG8gcmVwbGFjZSB0aGUKPmZvcm1lciBsaWJ0
cmFjZWV2ZW50IHJlbW92ZWQgZnJvbSB0aGUga2VybmVsIHNvdXJjZXMuIFNpbmNlIHRoZW4sCj5j
b21taXQgMTQ3NGYxYjM0YjE3ICgicGFja2FnZS9saWJ0cmFjZWV2ZW50OiBuZXcgcGFja2FnZSIp
IGhhcwo+aW50cm9kdWNlZCBhIGxpYnRyYWNlZXZlbnQgcGFja2FnZS4gV2UgY2FuIHRoZW4gZXhw
b3NlIGFnYWluIHRoZQo+cG9zc2liaWxpdHkgdG8gYnVpbGQgcGVyZiB3aXRoIGxpYnRyYWNlZXZl
bnQgc3VwcG9ydC4KPgo+TWFrZSBidWlsZHJvb3QgcGVyZiBtYWtlZmlsZSBkZXRlY3QgaWYgbGli
dHJhY2VldmVudCBwYWNrYWdlIGhhcyBiZWVuCj5lbmFibGVkLCBhbmQgaWYgc28sIGFsbG93IHRv
IGJ1aWxkIHBlcmYgd2l0aCBsaWJ0cmFjZWV2ZW50IHN1cHBvcnQuCj4KPlNpZ25lZC1vZmYtYnk6
IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+CgpSZXZpZXdlZC1i
eTogTHVjYSBDZXJlc29saSA8bHVjYS5jZXJlc29saUBib290bGluLmNvbT4KVGVzdGVkLWJ5OiBM
dWNhIENlcmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4uY29tPgoKTHVjYQoKLS0gCkx1Y2Eg
Q2VyZXNvbGksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpo
dHRwczovL2Jvb3RsaW4uY29tCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
