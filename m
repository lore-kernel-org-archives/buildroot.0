Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CFBC636CC
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 22:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 269E881284;
	Wed, 15 Feb 2023 22:24:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 269E881284
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wxNZQ-_sfMF1; Wed, 15 Feb 2023 22:24:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BFAE8133A;
	Wed, 15 Feb 2023 22:24:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BFAE8133A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 23B481BF476
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 22:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBB2340ABA
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 22:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBB2340ABA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rzBFE-V_e-yF for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 22:24:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7331540147
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7331540147
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 22:24:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5DF59E0005;
 Wed, 15 Feb 2023 22:24:24 +0000 (UTC)
Date: Wed, 15 Feb 2023 23:24:23 +0100
To: Martin =?UTF-8?B?SHVuZGViw7hsbA==?= <martin@geanix.com>
Message-ID: <20230215232423.0bcc3f62@windsurf>
In-Reply-To: <20230105130000.682525-2-martin@geanix.com>
References: <20230105130000.682525-1-martin@geanix.com>
 <20230105130000.682525-2-martin@geanix.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676499864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KXCr2g/MBF5e2Cj8IlY4LxA1obcCcmrPygCV+w+drzg=;
 b=L0zA+GPxIUJ3oOlXv9as+PFkfTDfiyEHQxR1Rw9CaKRj0Wx80O4eJiBdyZmQObGl416ZTk
 hRknRk7h5s/gt7AEtVII9kD1rWDn+DMf0ZqdiX5rCbWj9KmwwsVtDagaa1Ss86akHrLkmB
 e6td2qjWz2whSde23TQqLqrCb8rL8BH5uM+5Sj64WveP6i3pst3JdL0A1E9tN69NlP7xY5
 9R9xEWgnqB5WhYscMk1rBkRot9xpK8baW0A2RnGPamm2YcfCyjD8PpuN6Y7qpO32ALcb6O
 XetttPNnBiIHNCI6o0VuMnJ+5yIHx5G6BdGW7bzul42mbHRkTXgkZ4tQtuaJEw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=L0zA+GPx
Subject: Re: [Buildroot] [PATCH 1/5] package/python-apispec: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTWFydGluLAoKT24gVGh1LCAgNSBKYW4gMjAyMyAxMzo1OTo1NiArMDEwMApNYXJ0aW4g
SHVuZGViw7hsbCA8bWFydGluQGdlYW5peC5jb20+IHdyb3RlOgoKPiBhcGlzcGVjIGlzIGEgZGVw
ZW5kZW5jeSBvZiB0by1iZS1hZGRlZCBweXRob24tZmxhc2stc21vcmVzdC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBNYXJ0aW4gSHVuZGViw7hsbCA8bWFydGluQGdlYW5peC5jb20+Cj4gLS0tCj4gIHBh
Y2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgcGFja2Fn
ZS9weXRob24tYXBpc3BlYy9Db25maWcuaW4gICAgICAgICAgIHwgIDkgKysrKysrKysrCj4gIHBh
Y2thZ2UvcHl0aG9uLWFwaXNwZWMvcHl0aG9uLWFwaXNwZWMuaGFzaCB8ICA1ICsrKysrCj4gIHBh
Y2thZ2UvcHl0aG9uLWFwaXNwZWMvcHl0aG9uLWFwaXNwZWMubWsgICB8IDE0ICsrKysrKysrKysr
KysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9weXRob24tYXBpc3BlYy9Db25maWcuaW4KPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvcHl0aG9uLWFwaXNwZWMvcHl0aG9uLWFwaXNwZWMuaGFzaAo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tYXBpc3BlYy9weXRob24tYXBpc3BlYy5tawoKVGhh
bmtzIGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgSSBoYXZlIGFwcGxpZWQgYWxsIDUgcGF0Y2hlcy4g
T25lIHRoaW5nCndhcyBtaXNzaW5nIG9uIGFsbCBwYXRjaGVzOiBhZGRpbmcgeW91cnNlbGYgdG8g
dGhlIERFVkVMT1BFUlMgZmlsZSBmb3IKZWFjaCBwYWNrYWdlLgoKVGhlcmUgd2FzIGFsc28gYW4g
aXNzdWUgb24gUEFUQ0ggNC81LCBvbiB0aGUgTElDRU5TRSBmaWxlOiB0aGUgaGFzaCB5b3UKaGFk
IHdhcyBub3QgdXAtdG8tZGF0ZS4gSSBkb3VibGUgY2hlY2tlZCBhbmQgdGhlIGhhc2ggeW91IGhh
ZCBmb3IgdGhlCmxpY2Vuc2UgZmlsZSB3YXMgZnJvbSBhIHByZXZpb3VzIHZlcnNpb24gb2YgdGhl
IHBhY2thZ2UuIFRoZSBsaWNlbnNlCmZpbGUganVzdCBjaGFuZ2VkIGR1ZSB0byBjb3B5cmlnaHQg
eWVhcnMsIHNvIEkgdXBkYXRlZCB0aGUgaGFzaCBmaWxlCndpdGggdGhlIGNvcnJlY3QgaGFzaCBm
b3IgdGhlIExJQ0VOU0UgZmlsZSB3aGVuIGFwcGx5aW5nLgoKQWdhaW4sIHRoYW5rcyBmb3IgdGhp
cyBjb250cmlidXRpb24hCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxp
bgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5j
b20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
