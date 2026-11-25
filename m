Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C72A606A321
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 10:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JUWNnlZJ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B6858082C;
	Wed, 25 Nov 2026 10:48:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cJAGnKbFujGH; Wed, 25 Nov 2026 10:48:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 14A17807FA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795603711;
	b=Y2h7QiWCn2VG3Ww37LcZD0WkDP1aK/iSOafwvZHM1weZeV1QicZZsbqYxtLD6oqiogz7
	 fH22ojx9fEYE46XdgFbuazC62nLExc4VGlb2Waf4pIIve+F7qIh3pgBU45QYEhyqcTttq
	 z8kCWFcYfyLaGrx1GEFSeHme35bzeRnOY/6STLf9bNJnnZxOYfYJ1uUJ46HoRVwwyxGZx
	 kxZTSRQs0tbC5D9m1pwfqPpcSnX9+qJQ2a5DIfUeXjzF/BPbV4vY26AhLbB+krFdIiS20
	 kNIdtKIGNziRFgXu3RPTcyJMFNJkzR5FqBA7Ub63kJYOQkn31bQ7b/3rvm1oUpMazpQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795603711;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:In-Reply-To:References:
	 Organization:X-Mailer:MIME-Version:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0gtWwwae7SKK00/J+zX9mZXU1pV12dPBAkw4l6pRo7A=;
	b=V4ewsP7s/81drM3ck+yalkWmGf1ba9WH9QExLBJMRl+KKldRRJhZEaHCpoh9xM4Cx8QW
	 tdXhPzrldqYgZ9n0VnmvMvfn8PjUgn8IylUCi+9VPFFJXRyJN8tkbXk7OoGI667l/IWdB
	 fL8TqplTHW7doht2ZfKEQtnvY0Ts72xUhPlhq0Re2FqJ+pDiP7MXKojTHcd3JGKjkT3De
	 Qpv/fS02YLBwRxb9RGrkNpf6m5U+m4Oje88xaRr2s7OPVhDI17tfLP2beq7R+VeABB3lw
	 zNvJfuvfc7chh7PBl0g/eb6aIcQI7FIIzzPmbrz8jBbqW3PASe9JOlgh7zjNsIh2TUQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795603711;
	bh=0gtWwwae7SKK00/J+zX9mZXU1pV12dPBAkw4l6pRo7A=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JUWNnlZJecAx4mrT4N/7EkvCcdhxo0L2wOCfQN08JZ1VGtxMK6ptobDYDBab8DVoz
	 8vzltrAeCUSYKOXu2ZJixvwHe6ZToBbUkJOvdXiSDIo12QsJ+4nRacXWFLFQGvYX16
	 l0gGdI9DtwO/sg40n4pqOhwiNHNUrSRAo/ypJnKO7ZpGREHaNMH3oZ55C4WHgb/oDX
	 AnZ1s2XMiC0aLHncEEEFPPcCe2nEA57a8Gp9vIz38v2VgloPxtK9ZuNgZBQyPHpzbt
	 xj+HlxVrwEGHS6q5K514c8PJeYFqg5xGTl8eM+YcWUG3l+uSAtUwi6Z3uDWyYGvnoT
	 4LuNrGAzGoR0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14A17807FA;
	Wed, 25 Nov 2026 10:48:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A640B2F5
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 10:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9828E40180
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 10:48:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RkcgdCEg5G3v for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 10:48:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1DC1E400D6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=herve.codina@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1DC1E400D6
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 10:48:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id BA9984E4177E;
 Wed, 25 Nov 2026 10:48:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8938C60480;
 Wed, 25 Nov 2026 10:48:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1467811E69A4B; Wed, 25 Nov 2026 11:48:21 +0100 (CET)
Date: Wed, 25 Nov 2026 11:48:20 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <20261125114820.667d3696@bootlin.com>
In-Reply-To: <20261125093330.194145-1-yegorslists@googlemail.com>
References: <20261125093330.194145-1-yegorslists@googlemail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/alchemy: don't copy the C library
 into the Alchemy staging
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Herve Codina via buildroot <buildroot@buildroot.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgWWVnb3IsCgpPbiBXZWQsIDI1IE5vdiAyMDI2IDEwOjMzOjMwICswMTAwClllZ29yIFllZnJl
bW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cgo+IFdpdGggQlIyX1JPT1RG
U19NRVJHRURfVVNSPXkgYW5kIGEgZ2xpYmMgdG9vbGNoYWluLCB1bG9nIGZhaWxzIHRvIGxpbms6
Cj4gCj4gICBTaGFyZWRMaWI6IGxpYnVsb2cgPT4gYWxjaGVteS1vdXQvYnVpbGQvbGlidWxvZy9s
aWJ1bG9nLnNvCj4gICAuLi4vbGQ6IGNhbm5vdCBmaW5kIC9saWI2NC9saWJtLnNvLjY6IE5vIHN1
Y2ggZmlsZSBvciBkaXJlY3RvcnkKPiAgIC4uLi9sZDogY2Fubm90IGZpbmQgL2xpYjY0L2xpYm12
ZWMuc28uMTogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+IAo+IEZvciBlZ2xpYmMvbXVzbCB0
YXJnZXRzLCBBbGNoZW15IGNvcGllcyB0aGUgQyBsaWJyYXJ5IGZyb20gdGhlIHRvb2xjaGFpbgo+
IHN5c3Jvb3QgKGxpYi9saWJjLnNvKiwgbGliL2xpYm0uc28qLCAuLi4pIGludG8gaXRzIG93biBz
dGFnaW5nCj4gZGlyZWN0b3J5LCBhbmQgcGFzc2VzIHRoYXQgZGlyZWN0b3J5IHRvIHRoZSBsaW5r
ZXIgd2l0aCAtTC4gTm9ybWFsbHkKPiBzeXNyb290L2xpYiBvbmx5IGhvbGRzIHRoZSBydW50aW1l
IGxpYnJhcmllcy4gV2l0aCBtZXJnZWQgL3VzciwKPiBzeXNyb290L2xpYiBpcyBhIHN5bWxpbmsg
dG8gdXNyL2xpYiwgc28gdGhlIGdsaWJjIGxpYmMuc28gYW5kIGxpYm0uc28KPiBsaW5rZXIgc2Ny
aXB0cyBhcmUgY29waWVkIGFzIHdlbGwuIGxkIHRoZW4gZmluZHMgYWxjaGVteS1vdXQvc3RhZ2lu
Zy9saWIvCj4gbGlibS5zbyBmaXJzdC4gQXMgdGhhdCBzY3JpcHQgaXMgb3V0c2lkZSBvZiB0aGUg
c3lzcm9vdCwgbGQgZG9lcyBub3QKPiBwcmVmaXggaXRzIGFic29sdXRlIHBhdGhzICgvbGliNjQv
bGlibS5zby42KSB3aXRoIHRoZSBzeXNyb290IGFuZCBmYWlscy4KPiAKPiBCdWlsZHJvb3QgYWxy
ZWFkeSBwcm92aWRlcyB0aGUgQyBsaWJyYXJ5IGluIHRoZSBzeXNyb290LCBzbyB0aGVyZSBpcyBu
bwo+IG5lZWQgZm9yIEFsY2hlbXkgdG8gaW5zdGFsbCBpdC4gUGFzcyBhbiBlbXB0eSBUT09MQ0hB
SU5fTElCQyB0byBBbGNoZW15Cj4gdG8gc2tpcCB0aGlzIHN0ZXAuIEl0IGhhcyB0byBiZSBwYXNz
ZWQgb24gdGhlIGNvbW1hbmQgbGluZSwgYXMgQWxjaGVteQo+IG92ZXJyaWRlcyB0aGUgZW52aXJv
bm1lbnQgdmFyaWFibGUuIFRoaXMgZml4ZXMgYWxsIEFsY2hlbXktYmFzZWQKPiBwYWNrYWdlcyAo
dWxvZywgbGliZnV0aWxzLCBsaWJzaGRhdGEpLgo+IAo+IFRoaXMgaXNzdWUgaGFzIGJlZW4gcHJl
c2VudCBzaW5jZSBjb21taXQgN2YxZjNmODc4NjhmICgicGFja2FnZS9hbGNoZW15Ogo+IG5ldyBo
b3N0IHBhY2thZ2UiKSwgd2hpY2ggYWRkZWQgQWxjaGVteSB3aXRoIHRoZSBsaWJjIGluc3RhbGxh
dGlvbgo+IGVuYWJsZWQuIEl0IHRoZXJlZm9yZSBhZmZlY3RzIDIwMjIuMDIgYW5kIGxhdGVyLCBp
bmNsdWRpbmcgMjAyNi4wMi54Lgo+IAo+IEZpeGVzOgo+IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxk
cm9vdC5vcmcvcmVzdWx0cy82MDM5N2IxMDdhNWMwOWRlNWZkNDQ0YmFiYWU4ZGI1Mzg2OTBlZjMz
Cj4gCj4gRml4ZXM6IDdmMWYzZjg3ODY4ZmEzMzM4MzNkYmJhOWY0ZjA3YWRjMzM4YjM0ZWQgKCJw
YWNrYWdlL2FsY2hlbXk6IG5ldyBob3N0IHBhY2thZ2UiKQo+IEFzc2lzdGVkLWJ5OiBDbGF1ZGU6
Y2xhdWRlLW9wdXMtNS01Cj4gU2lnbmVkLW9mZi1ieTogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xp
c3RzQGdvb2dsZW1haWwuY29tPgo+IC0tLQo+ICBwYWNrYWdlL2FsY2hlbXkvYWxjaGVteS5tayB8
IDEwICsrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2FsY2hlbXkvYWxjaGVteS5tayBiL3Bh
Y2thZ2UvYWxjaGVteS9hbGNoZW15Lm1rCj4gaW5kZXggMTBkMTA2OGFjNC4uYWUzZWZhNjdkNSAx
MDA2NDQKPiAtLS0gYS9wYWNrYWdlL2FsY2hlbXkvYWxjaGVteS5tawo+ICsrKyBiL3BhY2thZ2Uv
YWxjaGVteS9hbGNoZW15Lm1rCj4gQEAgLTIzLDcgKzIzLDE1IEBAICQoZXZhbCAkKGhvc3QtZ2Vu
ZXJpYy1wYWNrYWdlKSkKPiAgCj4gICMgVmFyaWFibGVzIHVzZWQgYnkgb3RoZXIgcGFja2FnZXMK
PiAgCj4gLUFMQ0hFTVlfTUFLRSA9ICQoQUxDSEVNWV9IT01FKS9zY3JpcHRzL2FsY2hlbWFrZQo+
ICsjIEFsY2hlbXkgY29waWVzIHRoZSBDIGxpYnJhcnkgZnJvbSB0aGUgdG9vbGNoYWluIHN5c3Jv
b3QgaW50byBpdHMgb3duCj4gKyMgc3RhZ2luZyBkaXJlY3RvcnksIGFuZCBhZGRzIHRoYXQgZGly
ZWN0b3J5IHRvIHRoZSBsaW5rZXIgc2VhcmNoIHBhdGguCj4gKyMgV2l0aCBCUjJfUk9PVEZTX01F
UkdFRF9VU1IsIHN5c3Jvb3QvbGliIGlzIHN5c3Jvb3QvdXNyL2xpYiwgc28gdGhpcwo+ICsjIGFs
c28gY29waWVzIHRoZSBnbGliYyBsaWJjLnNvL2xpYm0uc28gbGlua2VyIHNjcmlwdHMuIGxkIHRo
ZW4gZmluZHMKPiArIyB0aGVtIG91dHNpZGUgb2YgdGhlIHN5c3Jvb3QgYW5kIGRvZXNuJ3QgcHJl
Zml4IHRoZWlyIGFic29sdXRlIHBhdGhzCj4gKyMgKC9saWI2NC9saWJtLnNvLjYpIHdpdGggaXQu
IFRoZSBsaWJjIGlzIHByb3ZpZGVkIGJ5IEJ1aWxkcm9vdCBhbnl3YXksCj4gKyMgc28gdGVsbCBB
bGNoZW15IHRoZXJlIGlzIG5vbmUgdG8gaW5zdGFsbC4gVGhpcyBoYXMgdG8gYmUgcGFzc2VkIG9u
IHRoZQo+ICsjIGNvbW1hbmQgbGluZSwgYXMgQWxjaGVteSBvdmVycmlkZXMgdGhlIGVudmlyb25t
ZW50IHZhcmlhYmxlLgo+ICtBTENIRU1ZX01BS0UgPSAkKEFMQ0hFTVlfSE9NRSkvc2NyaXB0cy9h
bGNoZW1ha2UgVE9PTENIQUlOX0xJQkM9Cj4gIAo+ICAjIFRBUkdFVF9BUkNIIGlzIHNldCB0byAn
eHh4JyB0byBhdm9pZCBBbGNoZW15IG1hbmFnaW5nIHRoZSBhcmNoaXRlY3R1cmUuCj4gICMgV2hl
biBBbGNoZW15IG1hbmFnZXMgdGhlIGFyY2hpdGVjdHVyZSwgaXQgY2FuIGFkZCBzb21lIGZsYWdz
IHRvIENGR0xBR1MgYW5kCgoKTEdUTS4gVGhhbmtzIGZvciBoYW5kbGluZyB0aGlzLgoKQWNrZWQt
Ynk6IEhlcnZlIENvZGluYSA8aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPgoKQmVzdCByZWdhcmRz
LApIZXJ2w6kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
