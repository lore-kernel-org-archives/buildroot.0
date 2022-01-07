Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84B9C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 10:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D4176FC24;
	Fri,  7 Jan 2022 10:06:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LGBYC0ASM4y4; Fri,  7 Jan 2022 10:05:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBD4F6FBD4;
	Fri,  7 Jan 2022 10:05:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 897EA1BF2EC
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 10:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84F2B4019B
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 10:05:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mpn3L0q67gsi for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 10:05:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 198D1400CC
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 10:05:55 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso4644964wmj.2
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 02:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+8a85x8b2GJD5J7jPnQrDHKgy2v+n1C3gg+jkJsVP04=;
 b=fKYsD5bHbr6mvKDt2dRm0UJwDxYP2XrksdV3R0OF4OP7F8G0cPu0AVtidvxZOwkfZD
 30H408WkRkCXLm5VE0Xcyi8DbOnx2niha+fwGkYErjBhMLlOwjeYe0eENLRpDadrPANb
 WjtEAcVKeWdRkHClDnfPR7MAiiDxFcGZOzQ51r0gMe/ABXNVJMJ0tEndLO75pYrTrzES
 gtIST+86tFD5Lnjr/g2kVJc0yXGred9Eqt3MycaUcTjaidsLihVuO+DsMK+75Bn156PN
 Gv6sqqpm18o9+lWgD1LkH+OnYnJANsaRstJtl6cGixP2KVAowPNbVXgbSn3fVq517Tje
 Cy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+8a85x8b2GJD5J7jPnQrDHKgy2v+n1C3gg+jkJsVP04=;
 b=yO7EYBZe0V8QJZAF3HVGuDa6YNLlc/oxctpjLKfHuxIZ5lSJ9zeblfkxgAZm7tUCEt
 Owui7Q16jKRWkL0+yRNM3tQGQGuT++ClV8O2bPRiMkhMRL7IFeilkft80O8c5oDS6ZV6
 AlgcEbnEMzG7f0L+zsCARd24b87y5vluVbHCUA17QMRcCdaqrkJB7H+SJoA8AVGOT1IH
 7hgMNMzjc3NHmUo0yd3LcXLDG7psguG0pSh9wZiUYhUOJR6K119mcjwtxi0KhUiMvDwN
 deFulmZq1JTrYu2UuWc1zk5sOB0D2l4deQ8z8iorOEo0glngSKPd2CEYf2gh/ND5Pd7v
 vUIA==
X-Gm-Message-State: AOAM530ExvZhoFAYiYfCdAvKDi0qFI/zTVEd22dcpEjNM+0ih39VX6OU
 rRRLucECcC4WSYDiQn8h/1lEFQ==
X-Google-Smtp-Source: ABdhPJxz3b9rPy1xlesD5M8GWj7yZOGP/f4AHRjAShLqwq/TftfgL7CIWCBXkkqfNxzVZU4lGz+s6w==
X-Received: by 2002:a05:600c:1c90:: with SMTP id
 k16mr10472137wms.40.1641549954030; 
 Fri, 07 Jan 2022 02:05:54 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id b1sm4862514wrd.92.2022.01.07.02.05.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 02:05:53 -0800 (PST)
Message-ID: <8b8ad2f1-b915-ff0d-54c4-0e1c36112db0@smile.fr>
Date: Fri, 7 Jan 2022 11:05:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@paral.in>,
 Buildroot List <buildroot@buildroot.org>,
 Matt Weber <Matthew.Weber@rockwellcollins.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
 <20220106210000.397694-6-thomas.petazzoni@bootlin.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220106210000.397694-6-thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v3 05/11] package/pkg-cargo.mk: introduce
 the cargo package infrastructure
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
Cc: Patrick Havelange <patrick.havelange@essensium.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAwNi8wMS8yMDIyIMOgIDIxOjU5LCBUaG9tYXMgUGV0YXp6
b25pIGEgw6ljcml0wqA6Cj4gRnJvbTogUGF0cmljayBIYXZlbGFuZ2UgPHBhdHJpY2suaGF2ZWxh
bmdlQGVzc2Vuc2l1bS5jb20+Cj4gCj4gSW4gb3JkZXIgdG8gYmUgcGFja2FnZSBhZ25vc3RpYywg
dGhlIGluc3RhbGwgcGhhc2UgaXMgbm93IHVzaW5nIGNhcmdvCj4gaW5zdGVhZCBvZiBpbnN0YWxs
LiBUQVJHRVRfQ09ORklHVVJFX09QVFMgaXMgbm93IGFsc28gc2V0IHdoZW4gcnVubmluZwo+IGNh
cmdvIGluIG9yZGVyIHRvIHN1cHBvcnQgY3Jvc3MgY29tcGlsaW5nIEMgY29kZSB3aXRoaW4gY2Fy
Z28uCj4gCj4gVGhpcyBjb21taXQgYWxzbyBhZGRzIHN1cHBvcnQvZG93bmxvYWQvY2FyZ28tcG9z
dC1wcm9jZXNzIHRvIHBlcmZvcm0KPiB0aGUgdmVuZG9yaW5nIG9uIENhcmdvIHBhY2thZ2VzLgo+
IAo+IFRoZSA8cGtnPl9MSUNFTlNFIHZhcmlhYmxlIG9mIGNhcmdvIHBhY2thZ2VzIGlzIGV4cGFu
ZGVkIHdpdGggIiwKPiB2ZW5kb3JlZCBkZXBlbmRlbmNpZXMgbGljZW5zZXMgcHJvYmFibHkgbm90
IGxpc3RlZCIgYXMgY3VycmVudGx5IGZvcgo+IGFsbCBwYWNrYWdlcywgdGhlIGxpY2Vuc2VzIG9m
IHRoZSB2ZW5kb3JlZCBkZXBlbmRlbmNpZXMgYXJlIG5vdCB0YWtlbgo+IGludG8gYWNjb3VudC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNrIEhhdmVsYW5nZSA8cGF0cmljay5oYXZlbGFuZ2VA
ZXNzZW5zaXVtLmNvbT4KPiBbVGhvbWFzOiBhZGQgc3VwcG9ydCBmb3IgaG9zdC1jYXJnby1wYWNr
YWdlIGFuZCB2ZW5kb3JpbmddCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhv
bWFzLnBldGF6em9uaUBib290bGluLmNvbT4KPiAtLS0KCj4gKyMKPiArIyBCdWlsZCBzdGVwLiBP
bmx5IGRlZmluZSBpdCBpZiBub3QgYWxyZWFkeSBkZWZpbmVkIGJ5IHRoZSBwYWNrYWdlIC5tawo+
ICsjIGZpbGUuCj4gKyMKPiAraWZuZGVmICQoMilfQlVJTERfQ01EUwo+ICtpZmVxICgkKDQpLHRh
cmdldCkKPiArZGVmaW5lICQoMilfQlVJTERfQ01EUwo+ICsJY2QgJCQoQEQpICYmIFwKPiArCSQk
KFRBUkdFVF9NQUtFX0VOVikgXAo+ICsJCSQkKFRBUkdFVF9DT05GSUdVUkVfT1BUUykgXAo+ICsJ
CSQkKCQoMilfQ0FSR09fRU5WKSBcCj4gKwkJY2FyZ28gYnVpbGQgXAo+ICsJCQktLW9mZmxpbmUg
XAo+ICsJCQktLXRhcmdldCAkJChSVVNUQ19UQVJHRVRfTkFNRSkgXAo+ICsJCQkkJChpZiAkJChC
UjJfRU5BQkxFX0RFQlVHKSwtLWRlYnVnLC0tcmVsZWFzZSkgXAo+ICsJCQktLW1hbmlmZXN0LXBh
dGggQ2FyZ28udG9tbCBcCj4gKwkJCS0tbG9ja2VkIFwKPiArCQkJLVogdGFyZ2V0LWFwcGxpZXMt
dG8taG9zdCBcCj4gKwkJCSQkKCQoMilfQ0FSR09fQlVJTERfT1BUUykKPiArZW5kZWYKPiArZWxz
ZSAjIGlmZXEgKCQoNCksdGFyZ2V0KQo+ICtkZWZpbmUgJCgyKV9CVUlMRF9DTURTCj4gKwljZCAk
JChARCkgJiYgXAo+ICsJJCQoSE9TVF9NQUtFX0VOVikgXAo+ICsJCVJVU1RGTEFHUz0iJCQoYWRk
cHJlZml4IC1DIGxpbmstYXJncz0sJCQoSE9TVF9MREZMQUdTKSkiIFwKPiArCQkkJCgkKDIpX0NB
UkdPX0VOVikgXAo+ICsJCWNhcmdvIGJ1aWxkIFwKPiArCQkJLS1vZmZsaW5lIFwKPiArCQkJLS1y
ZWxlYXNlIFwKPiArCQkJLS1tYW5pZmVzdC1wYXRoIENhcmdvLnRvbWwgXAo+ICsJCQktLWxvY2tl
ZCBcCj4gKwkJCSQkKCQoMilfQ0FSR09fQlVJTERfT1BUUykKPiArZW5kZWYKPiArZW5kaWYgIyBp
ZmVxICgkKDQpLHRhcmdldCkKPiArZW5kaWYgIyBpZm5kZWYgJCgyKV9CVUlMRF9DTURTCj4gKwo+
ICsjCj4gKyMgVGFyZ2V0IGluc3RhbGxhdGlvbiBzdGVwLiBPbmx5IGRlZmluZSBpdCBpZiBub3Qg
YWxyZWFkeSBkZWZpbmVkIGJ5Cj4gKyMgdGhlIHBhY2thZ2UgLm1rIGZpbGUuCj4gKyMKPiAraWZu
ZGVmICQoMilfSU5TVEFMTF9UQVJHRVRfQ01EUwo+ICtkZWZpbmUgJCgyKV9JTlNUQUxMX1RBUkdF
VF9DTURTCj4gKwljZCAkJChARCkgJiYgXAo+ICsJJCQoVEFSR0VUX01BS0VfRU5WKSAkJCgkKDIp
X0NBUkdPX0VOVikgXAoKUmVtb3ZpbmcgIkNDXyQkKHN1YnN0IC0sXywkJChSVVNUQ19UQVJHRVRf
TkFNRSkpPSQkKFRBUkdFVF9DQykgIiBbMV0KYW5kIGFkZGluZyAkJChUQVJHRVRfQ09ORklHVVJF
X09QVFMpIGZpeGVzIHRoZSBidWlsZCBvZiBiYXQgcGFja2FnZS4KClRoZSBwYWNrYWdlIGlzIHN0
aWxsIHJlYnVpbGQgZHVyaW5nIHRoZSBpbnN0YWxsIHN0ZXAgYnV0IGF0IGxlYXN0IGl0IGJ1aWxk
Li4uCgpbMV0gaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L3BpcGVybWFpbC9idWlsZHJvb3QvMjAy
Mi1KYW51YXJ5LzYzMjYxMC5odG1sCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gKwkJY2FyZ28g
aW5zdGFsbCBcCj4gKwkJCS0tdGFyZ2V0ICQkKFJVU1RDX1RBUkdFVF9OQU1FKSBcCj4gKwkJCS0t
b2ZmbGluZSBcCj4gKwkJCS0tcm9vdCAkJChUQVJHRVRfRElSKS91c3IvIFwKPiArCQkJLS1iaW5z
IFwKPiArCQkJLS1wYXRoIC4vIFwKPiArCQkJLS1mb3JjZSBcCj4gKwkJCS0tbG9ja2VkIFwKPiAr
CQkJJCQoJCgyKV9DQVJHT19JTlNUQUxMX09QVFMpCj4gK2VuZGVmCj4gK2VuZGlmCj4gKwo+ICtp
Zm5kZWYgJCgyKV9JTlNUQUxMX0NNRFMKPiArZGVmaW5lICQoMilfSU5TVEFMTF9DTURTCj4gKwlj
ZCAkJChARCkgJiYgXAo+ICsJJCQoSE9TVF9NQUtFX0VOVikgXAo+ICsJCVJVU1RGTEFHUz0iJCQo
YWRkcHJlZml4IC1DIGxpbmstYXJncz0sJCQoSE9TVF9MREZMQUdTKSkiIFwKPiArCQkkJCgkKDIp
X0NBUkdPX0VOVikgXAo+ICsJCWNhcmdvIGluc3RhbGwgXAo+ICsJCQktLW9mZmxpbmUgXAo+ICsJ
CQktLXJvb3QgJCQoSE9TVF9ESVIpIFwKPiArCQkJLS1iaW5zIFwKPiArCQkJLS1wYXRoIC4vIFwK
PiArCQkJLS1mb3JjZSBcCj4gKwkJCS0tbG9ja2VkIFwKPiArCQkJJCQoJCgyKV9DQVJHT19JTlNU
QUxMX09QVFMpCj4gK2VuZGVmCj4gK2VuZGlmCj4gKwo+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
