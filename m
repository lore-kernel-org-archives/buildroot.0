Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17150C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 17:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70B1440018;
	Mon, 10 Jan 2022 17:25:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Suj0ePLRSirX; Mon, 10 Jan 2022 17:25:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70F98400BA;
	Mon, 10 Jan 2022 17:25:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 001391BF355
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 17:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E10E3400BA
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 17:25:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iTAUg0I6z6cf for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 17:25:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DAA5340018
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 17:25:34 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id j11so46871559lfg.3
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 09:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HBeRacoag9H9lKuf+6ChkhVVC3F3SOTxF2giMwAj3ws=;
 b=DA7YpBNnIzKnYsfXBvcbYYm2pRR4HP0LrslgaDBTtr8qSTOkgh9TvvlAec1iCOi4xJ
 gj5YHrRyU4jtOUdexOXroy2uEO0ItcyW8LwBzWsCqEIkUxXe1tVwMaWLdUz9iqrpmpPF
 McghMgwCWH3tpZUraYOQRmE5Fh4Z1mQK7Hdsl7BxexgBBgkwzwDxvgcdjzYoY1m63JIu
 R1URJ8nw8sQXu/3GjIqvyMnV0quA07wV4cADYlHHLwazsrIw9/WoR4+lfIdflFVwsRe+
 a483QqTtt+NXaTnFkn6rYnvOixQxlWbxv9ML1rVTSXHN5x/9RvmfdG58JNr9imxPVF07
 RZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HBeRacoag9H9lKuf+6ChkhVVC3F3SOTxF2giMwAj3ws=;
 b=MtDjrNLQcSOCnJVQLuGS3Xc05v1piUnwhpPbcKw3mQa1SYaHqUPv26yInjwwyMJzI5
 9Ny2o5ctn8G6/vdzpOoqalRPwst0CCVmeyHSKAbZQ5chHX5ggAm/ReFvZ/j78UrhmWuC
 lFcxjHKNx4b+0sA66DMm/onTHDhqUi8gVQPZov5SNZiLKPrwTivsdr5kLxC+O7MNTLA+
 HAYmztNoXoo7o+iG9h3eFkgSgb29L2JVNTeloWq5HpIP7GqDaG7cTAW6QpFN96wrO4uP
 ouVzu0Ox9BtutQlFPeY7Fc9BHwOgnaYsM6Z39WDSnmbSR7tAkzZNDzfEuirNJ3+C4sTj
 YQ7A==
X-Gm-Message-State: AOAM530akoGIXUTFw5M/APBqCZNpgjXQL4lZ+1zC51eZ008y9iMNuf1X
 hk3JpdtIUF0ESF9Yws43U6QX5IKSPQU/v88DPu0=
X-Google-Smtp-Source: ABdhPJwavmejw0g+asxMX1fAGMhLhHGshW+ViG07UmhZdtKx/WRLiuKaHN15DrZiVpEF423JURY2wZcjYVMpT+j4Gdc=
X-Received: by 2002:a05:6512:23a3:: with SMTP id
 c35mr573747lfv.150.1641835532576; 
 Mon, 10 Jan 2022 09:25:32 -0800 (PST)
MIME-Version: 1.0
References: <20220110131624.3639727-1-arnout@mind.be>
In-Reply-To: <20220110131624.3639727-1-arnout@mind.be>
From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 10 Jan 2022 18:25:21 +0100
Message-ID: <CADYdroM8rSZHbG-Ot9OJf1JQ54_HXFDUEDcTR6nj+RPOB3BWbQ@mail.gmail.com>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH] package/systemd: add checklist of upgrade
 caveats
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>,
 Adam Duskett <aduskett@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpBbSBNby4sIDEwLiBKYW4uIDIwMjIgdW0gMTQ6MTYgVWhyIHNjaHJpZWIgQXJub3V0
IFZhbmRlY2FwcGVsbGUKKEVzc2Vuc2l1bS9NaW5kKSA8YXJub3V0QG1pbmQuYmU+Ogo+Cj4gQnVt
cGluZyB0aGUgdmVyc2lvbiBvZiBzeXN0ZW1kIGlzIGEgbGl0dGxlIG1vcmUgY29tcGxpY2F0ZWQg
dGhhbiB0aGUKPiB1c3VhbCBwYWNrYWdlLCBhbmQgaXQncyBlYXN5IHRvIGZvcmdldCBzb21lIG9m
IHRoZSB0aGluZ3MgdGhhdCBuZWVkIHRvCj4gYmUgZG9uZSAtIGFuZCB0aGlzIGhhcyBoYXBwZW5l
ZCBzZXZlcmFsIHRpbWVzIGluIHRoZSBwYXN0Lgo+Cj4gQWRkIGEgY2hlY2tsaXN0IG9mIHRoaW5n
cyB0byB3b3JyeSBhYm91dCB3aGVuIHVwZGF0aW5nIHN5c3RlbWQuCj4KPiBOb3RlIHRoYXQgdGhl
cmUgYXJlIG1hbnkgb3RoZXIgY29tcGxpY2F0ZWQgcGFja2FnZXMgdGhhdCBhbHNvIG5lZWQgYSBs
b3QKPiBvZiBhdHRlbnRpb24gd2hlbiB1cGdyYWRpbmcuIEhvd2V2ZXIsIHN5c3RlbWQgaXMgYSBy
ZWFsbHkgY3JpdGljYWwKPiBwYWNrYWdlIHNvIGl0J3MgbW9yZSBpbXBvcnRhbnQgdGhhdCB3ZSBn
ZXQgdGhhdCBvbmUgcmlnaHQgdGhhbiwgc2F5LAo+IHZhbGdyaW5kLgo+Cj4gQ2M6IE5vcmJlcnQg
TGFuZ2UgPG5vbGFuZ2U3OUBnbWFpbC5jb20+Cj4gQ2M6IErDqXLDqW15IFJPU0VOIDxqZXJlbXku
cm9zZW5Ac21pbGUuZnI+Cj4gQ2M6IEFkYW0gRHVza2V0dCA8YWR1c2tldHRAZ21haWwuY29tPgo+
IENjOiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBBcm5vdXQgVmFuZGVjYXBwZWxsZSAoRXNzZW5zaXVtL01pbmQpIDxhcm5vdXRAbWlu
ZC5iZT4KPiAtLS0KPiAgcGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQubWsgfCAxMiArKysrKysrKysr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL3N5c3RlbWQvc3lzdGVtZC5tayBiL3BhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1rCj4g
aW5kZXggMzgxMWRiYWU0Mi4uNGQ4MmQyYWI4MSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3N5c3Rl
bWQvc3lzdGVtZC5tawo+ICsrKyBiL3BhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1rCj4gQEAgLTQs
NiArNCwxOCBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4KPiArIyBXaGVuIHVw
ZGF0aW5nIHN5c3RlbWQsIHRha2UgY2FyZSBvZiB0aGUgZm9sbG93aW5nOgo+ICsjIC0gQ2hlY2sg
aWYgdGhlIHJlcXVpcmVtZW50cyBoYXZlIGNoYW5nZWQgKHNlZSBSRUFETUUpLCBpbiBwYXJ0aWN1
bGFyCj4gKyMgICBhcmNoIGFuZCBoZWFkZXJzCj4gKyMgLSBJZiB5ZXMsIHByb3BhZ2F0ZSB0aGUg
ZGVwZW5kZW5jaWVzIHRvIEJSMl9JTklUX1NZU1RFTUQKPiArIyAtIElmIHRoZSByZXF1aXJlZCBr
ZXJuZWwgb3B0aW9ucyBoYXZlIGNoYW5nZWQsIHVwZGF0ZSB0aGUgQ29uZmlnLmluCj4gKyMgICBo
ZWxwIHRleHQgYW5kIHRoZSBsaXN0IG9mIEtDT05GSUdfRU5BQkxFX09QVC4KPiArIyAtIENoZWNr
IGlmIHRoZXJlIGFyZSBuZXcgbWVzb25fb3B0aW9ucy4gTWFrZSBzdXJlIGFsbCBvcHRpb25zIGFy
ZSBzZXQKPiArIyAgIGV4cGxpY2l0bHkgKHVzdWFsbHkgdG8gZGVmYXVsdCB2YWx1ZSkuCj4gKyMg
LSBJZiB0aGVyZSBhcmUgbmV3IHNlcnZpY2VzOgo+ICsjICAgLSBjcmVhdGUgbmV3IG9wdGlvbnMg
Zm9yIHRoZW0gKGlmIHRoZXkgcmVhbGx5IGFyZSBvcHRpb25hbCk7Cj4gKyMgICAtIGNyZWF0ZSBh
IG5ldyBfVVNFUiBpZiBuZWNlc3Nhcnk7Cj4gKyMgICAtIGNyZWF0ZSBuZXcgZGlyZWN0aW9ucnkg
KHdpdGggX1BFUk1JU1NJT05TKSBpZiBuZWNlc3NhcnkuCj4gIFNZU1RFTURfVkVSU0lPTiA9IDI1
MC4xCj4gIFNZU1RFTURfU0lURSA9ICQoY2FsbCBnaXRodWIsc3lzdGVtZCxzeXN0ZW1kLXN0YWJs
ZSx2JChTWVNURU1EX1ZFUlNJT04pKQo+ICBTWVNURU1EX0xJQ0VOU0UgPSBcCj4gLS0KPiAyLjMx
LjEKPgoKSSB3b3VsZGQgYWRkIHRoZXNlOgoKIyAgIC0gIGRpZmYgc3lzdXNlcnMuZCB3aXRoIHRo
ZSBwcmV2aW91cyB2ZXJzaW9uCiMgICAtICBkaWZmIGZhY3RvcnkvZXRjL25zc3dpdGNoLmNvbmYg
d2l0aCB0aGUgcHJldmlvdXMgdmVyc2lvbgojICAgICAgKGRldGFpbHMgYXJlIG9mdGVuIHNwcmlu
a2xlZCBhcm91bmQgaW4gUkVBRE1FIGFuZCBtYW5wYWdlcykKCmFuZCwgc29tZXdoYXQgbW9yZSBj
eW5pY2FsOgoKIyAgIC0gIGRvbnQgYm90aGVyIHdpdGggeC4wIHZlcnNpb25zCgpOb3JiZXJ0Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
