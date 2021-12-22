Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F7DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 19:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5F2660ABE;
	Wed, 22 Dec 2021 19:32:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lcMxXYXFld8L; Wed, 22 Dec 2021 19:32:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CB2E60ABC;
	Wed, 22 Dec 2021 19:32:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A372E1BF57C
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 19:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90B8F404CF
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 19:32:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8a99mf0vy136 for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 19:32:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1743F400CE
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 19:32:47 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id bt1so7492172lfb.13
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 11:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rELkfBjiAIRlQx246RDeny8JtZUgXEkmuJ7HwoE5vxs=;
 b=pHrytTmuVfWoT4ZZ4dvql+8mziC5tXpG/7yU3JvFX0G23FKnHk2+Gzz4+McIqCsfhi
 qkIwWvvcDNRE526XcgYKu6WqU3wVYmLkOQAinkTTFikozeWZ5ha8DkoyxCfS4g2IkLCk
 ubtZ8Ndb8CVVRJncGAN1zQfKFQOtq1Qay7fy7Uou74Ep2J3v2Kwo4a/3N6vaBaGo8yCr
 veDCz5bSB2EcK1cR5R+wcgS54cjHQs1mwEv0cEzhlpW7ZN+fifsZnl5UOmjrXZbYpSC4
 TI3zUicyBS8iYtuM5IUPl/QjNWh5WSDdcsUapyO6JSjGadzTu4J7MBLTyUtFrhWgt7Fo
 Cl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rELkfBjiAIRlQx246RDeny8JtZUgXEkmuJ7HwoE5vxs=;
 b=WNLkXvlzeW5WVXnGsXZqNLZZupWTDYzUf0Xv9kN2XgnPiut4FgokAK3bCr5M4KYpbO
 QTIf4oNUr42+Tfvu+Djt8YeH7IJKfTPWEOB7dudAwRqrgBYSsdJuSnv1G58G2yApVeRu
 Eu+l2H8hL3HQjWHjE5TmObNIR4bsIYQuqjUW9Qi5RdbwUmJiQYO+IkUvIsBWQZJ4tJKZ
 +DmDeOyIgywRgJfAiv9fv1Olf12E5eABz9uF2aLRX7K8OruZdDabTtmIHaYwc59dTAqa
 VatZ4Gsi2hIHs2uFflwhlwNtD/Vz2LkQaqo4Zqi9oA9slmtR2+Wd7QGSGUXMIN3TCD4k
 wDdQ==
X-Gm-Message-State: AOAM533gd38Idc4JayOL9r19VEBANsDePhOzyKXA6Y888RlYNW1RsuKJ
 hD5kI7F67Z/t2SSHgxGikztbjOO8kKA=
X-Google-Smtp-Source: ABdhPJyxcEopfpWrTjjF8n0Jv/w6d16/z3XJe2GwDCsBnAmlrR0hifswuDdXKj67qE88dS6RBFdZOQ==
X-Received: by 2002:ac2:5dc2:: with SMTP id x2mr3270576lfq.208.1640201565052; 
 Wed, 22 Dec 2021 11:32:45 -0800 (PST)
Received: from [10.0.196.136] ([98.128.186.122])
 by smtp.googlemail.com with ESMTPSA id br37sm295590lfb.99.2021.12.22.11.32.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 11:32:44 -0800 (PST)
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20211222083515.1150267-1-troglobit@gmail.com>
 <20211222083515.1150267-3-troglobit@gmail.com>
 <dc4b99fa-1893-d022-ba29-db80c2fc05ba@mind.be>
From: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <7592df87-e875-5016-db4f-57e5988dfbc4@gmail.com>
Date: Wed, 22 Dec 2021 20:32:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <dc4b99fa-1893-d022-ba29-db80c2fc05ba@mind.be>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH v2 2/2] package/makedevs: coding style and
 whitespace cleanup
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
Cc: Matt Weber <matthew.weber@collins.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTIvMjIvMjEgMzoxMiBQTSwgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3JvdGU6Cj4gT24gMjIv
MTIvMjAyMSAwOTozNSwgSm9hY2hpbSBXaWJlcmcgd3JvdGU6Cj4+IFRoaXMgcGF0Y2ggaXMgYSBt
b2Rlc3QgYXR0ZW1wdCB0byBjbGVhbiB1cCB0aGUgY29kaW5nIHN0eWxlIGFuZCBmaXgKPj4gc29t
ZSB3aGl0ZXNwYWNlIGlzc3Vlcy7CoCBTb21lIGNoYW5nZXMsIGUuZy4sIGNvbW1lbnRzIGFyZSBm
b3IKPj4gY29uc2lzdGVuY3kgd2l0aCB0aGUgcmVzdCBmb3IgdGhlIHByb2dyYW0uCj4gwqBBbHRo
b3VnaCBJJ20gT0sgd2l0aCB0aGUgY2hhbmdlcyBwZXIgc2UsIEkgZ2VuZXJhbCBJIGRvbid0IGJl
bGlldmUgbXVjaAo+IGluIG1hbnVhbGx5IG1haW50YWluZWQgY29kaW5nIHN0eWxlLiBTbyBJJ2Qg
cHJvcG9zZSB0byBhdCBsZWFzdCBpbmNsdWRlCj4gYSAuY2xhbmctZm9ybWF0IGZpbGUgaW4gdGhl
IHRvcCBsZXZlbCBkaXJlY3RvcnkgdGhhdCBkZWZpbmVzIG91ciBjb2RpbmcKPiBzdHlsZS4gV2Ug
d291bGRuJ3QgZW5mb3JjZSBpdCB3aXRoIENJIG9yIGFueXRoaW5nIChhdCBsZWFzdCwgbm90IGZv
ciB0aGUKPiB0aW1lIGJlaW5nKSwgYnV0IGF0IGxlYXN0IGl0IG1ha2VzIGl0IGVhc3kgdG8gYXBw
bHkgdGhlIGNvZGluZyBzdHlsZSBhbmQKPiB0byBrbm93IHRoYXQgaXQncyBjb3JyZWN0LgoKT0ss
IHRoYXQncyBhIGxpdHRsZSBiaXQgbW9yZSB0aGFuIEkgYmFyZ2FpbmVkIGZvci4gIEp1c3Qgd2Fu
dGVkIHRvIGNsZWFuCml0IHVwIGEgYml0IHdoaWxlIEkgd2FzIGluIHRoYXQgcGFydCBvZiB0aGUg
dHJlZS4gIEJ1dCBJJ2xsIGdpdmUgaXQgYQpnbywgaXQncyBDaHJpc3RtYXMgKGFuZCBERUMgMjIh
ISkgYWZ0ZXIgYWxsIDotKQoKV2UgZG9uJ3Qgc2VlbSB0byBoYXZlIGFueSAuY2xhbmctZm9ybWF0
IGZpbGUgYXQgdGhlIG1vbWVudCwgc28gaWYgSSBjb3B5CnRoZSBsYXRlc3QgdmVyc2lvbiBmcm9t
IGtlcm5lbC5vcmcsIHdoZXJlIGluIHRoZSB0cmVlIHNob3VsZCBpdCBsaXZlPwpJJ20gdGhpbmtp
bmcgd2UgbWlnaHQgd2FudCB0byByZXVzZSBpdCBmb3Igb3RoZXIgaW4tdHJlZSB0b29scywgbWF5
YmUKc3VwcG9ydC9taXNjLywgb3IgcGVyaGFwcyBlYWNoIHBhY2thZ2Ugc2hvdWxkIHN1cHBseSBp
dHMgb3duPwoKPiBBcyB0byB3aGljaCBjb2Rpbmcgc3R5bGU6IHNvbWV0aGluZyBjbG9zZSB0byBr
ZXJuZWwgaXMgcHJlZmVycmVkLgoKU3VzcGVjdGVkIGFzIG11Y2gsIHRoYW5rcyEKCkJlc3QgcmVn
YXJkcwogL0pvYWNoaW0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
