Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E43C4452F
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 03:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39D1F80CBF;
	Tue, 21 Jul 2026 03:51:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oi9DMITVF-Rp; Tue, 21 Jul 2026 03:51:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69B0080D8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784605906;
	bh=hVNApDRVWLqIPpL1KrLlMsHnLtNhdi8vUbmERANpDGg=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nwXAY7+oTJYxo4S19X6P5EuU9hkfkXABiND4MJK2eFJyCvXCJbA7KTVihcZp5alwM
	 AfgN3F1iWUrRiBvIMrmi9tIbq5KinEMg3mH5wfM+4bCIkna21DHIRAGv7eslLH2TbP
	 bvQNoRpJs6RaefH1Ce44yTdjlIKABxVMIQZSfKHQy6lxFcTYTDBnuCnxbKQXjDtVpR
	 aWSBsglll+ADU9+4VDaef4x5BiCNOMTJGsDeTE6tN1Zl9A9ssRqTsbLRj/Eta9pkLV
	 Syad+cTW6J43krNnBEVzPIzyysOI9nCb+sUuzUCnHiCHUySRA34wqetQAzESJ3deao
	 bSPEffAJxNRVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69B0080D8B;
	Tue, 21 Jul 2026 03:51:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A39059E5
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 03:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80C5F80D8B
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 03:51:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GvPaBQ2kxI_6 for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 03:51:43 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6E6E880CBF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E6E880CBF
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E6E880CBF
 for <buildroot@busybox.net>; Tue, 21 Jul 2026 03:51:43 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id A945944060D;
 Tue, 21 Jul 2026 06:51:21 +0300 (IDT)
To: =?utf-8?Q?Fran=C3=A7ois?= PERRAD <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
In-Reply-To: <CAMTop8_W_ZjJmiBvHZDMsUtmVXV1k2YbLEWRQoquQt0QPOG1_Q@mail.gmail.com>
 (=?utf-8?Q?=22Fran=C3=A7ois?= PERRAD"'s message of "Mon, 20 Jul 2026
 22:43:42 +0200")
References: <20260720150236.243961-1-francois.perrad@gadz.org>
 <20260720150236.243961-2-francois.perrad@gadz.org>
 <871pcxprvl.fsf@tarshish>
 <CAMTop8_W_ZjJmiBvHZDMsUtmVXV1k2YbLEWRQoquQt0QPOG1_Q@mail.gmail.com>
User-Agent: mu4e 1.14.2; emacs 30.2
Date: Tue, 21 Jul 2026 06:51:39 +0300
Message-ID: <87v7a9ngok.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1784605881;
 bh=FrHkET2vpxBQ7fUzKHfWXXG2nKvSQIOiEnqEVILK1PI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=FAJi6s47xYEG0z8U2gw/2kuSXfOMmJo3FBpgXxgPFZXV2V7b6bB4qVbm5Wo2CbQad
 WQW4fS0N06JTGztFgvNJfVL39Idwiq8OniEldEvU3utgx5dzOsZhoRIuLopkMck6JS
 rjBMfxI7SD9AAPajK436Mq6psrAJPp5yxcR0qClMvbrHs4FkzmYIV6lF5pnkafOsBj
 b1n3rufP4J0AYN8DdIP8rA4g99fbx5r0j+mKayBMXuqYkyTNjAy3oHBtRQQZ4DZ2q6
 yjNRIgWPJwCUZejIa+Be8w01+Im8hVwvG7HDPcNjCzO5vg8wIlPYheb/jdkYDuOK7E
 NJ2cxyCYSkEhA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=FAJi6s47
Subject: Re: [Buildroot] [PATCH v2 1/8] package/qbe: new host package
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRnJhbsOnb2lzLAoKT24gTW9uLCBKdWwgMjAgMjAyNiwgRnJhbsOnb2lzIFBFUlJBRCB3cm90
ZToKPiBMZSBsdW4uIDIwIGp1aWwuIDIwMjYgw6AgMTg6MDYsIEJhcnVjaCBTaWFjaCA8YmFydWNo
QHRrb3MuY28uaWw+IGEgw6ljcml0IDoKPiAgT24gTW9uLCBKdWwgMjAgMjAyNiwgRnJhbmNvaXMg
UGVycmFkIHdyb3RlOgo+ICA+IGRlcGVuZGVuY3kgZm9yIGhvc3QtaGFyZQo+Cj4gIFsuLi5dCj4K
PiAgPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9xYmUvcWJlLm1rIGIvcGFja2FnZS9xYmUvcWJlLm1r
Cj4gID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiAgPiBpbmRleCAwMDAwMDAwMDAuLmE2ZTNlNGQ1
Nwo+ICA+IC0tLSAvZGV2L251bGwKPiAgPiArKysgYi9wYWNrYWdlL3FiZS9xYmUubWsKPiAgPiBA
QCAtMCwwICsxLDIyIEBACj4gID4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gID4gKyMKPiAg
PiArIyBxYmUKPiAgPiArIwo+ICA+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICA+ICsKPiAg
PiArUUJFX1ZFUlNJT04gPSAxLjIKPgo+PiAgQW55IHJlYXNvbiB0byBwcmVmZXIgMS4yIG92ZXIg
dGhlIGxhdGVzdCAxLjMgdmVyc2lvbj8KPgo+IEhhcmUgMC4yNi4wIHdhcyBkZXZlbG9wZWQgJiB0
ZXN0ZWQgd2l0aCBRQkUgMS4yLgo+IFFCRSAxLjMgd2lsbCB3YWl0IGZvciB0aGUgbmV4dCBIYXJl
IHJlbGVhc2UuCgpUaGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLiBJIHRoaW5rIHRoZSBjb21t
aXQgbG9nIHNob3VsZCBtZW50aW9uCnRoYXQuCgpiYXJ1Y2gKCi0tIAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH4uIC5+ICAgVGsgT3BlbiBTeXN0
ZW1zCj19LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tb29P
LS1VLS1Pb28tLS0tLS0tLS0tLS17PQogICAtIGJhcnVjaEB0a29zLmNvLmlsIC0gdGVsOiArOTcy
LjUyLjM2OC40NjU2LCBodHRwOi8vd3d3LnRrb3MuY28uaWwgLQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
