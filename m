Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BACC433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 17:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F1754170B;
	Thu, 27 Jan 2022 17:33:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ODOl3XPgzere; Thu, 27 Jan 2022 17:33:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31EF0416D8;
	Thu, 27 Jan 2022 17:33:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F99C1BF275
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 17:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 975EA60EF0
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 17:33:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PuJWiNNI8kEH for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 17:33:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 320D360DFD
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 17:33:45 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 j5-20020a05600c1c0500b0034d2e956aadso2343312wms.4
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 09:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=IN+jgulNujN3WbkJBHySg5ObffJtZlOofonxCFLLwy4=;
 b=CqlcA6ZIq3N56e9goYJxt3AcdR9UtvqUuN8RMDge0Gi9+OLbU3DY+wGtqUyBH7WlFK
 jt68v0R9yzcHwGDaD1JQiArU8FOf7OqNiyJqFU2hqso5vYBqnBvWrB2wOB3u5ArXgQAA
 4S0a66I0vXLTMfyzr3f0HrPQqnKP+nU3k2VQ3YMCTOmHA+dJkUuL3euB5TQCrMP9V216
 Nn1Agx+nY9XI4rKzSy9zrTlDknOuziNumr9v2KSbk2JaU+yQNCHvXBdkBhdJwYmG5db8
 D+txPLQrtF+MS5NJ/QM5teAzP7GDdZwr5Ck+kqD+tTu3iPI3rtc+v4xAO4kusygwk6SB
 ubGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=IN+jgulNujN3WbkJBHySg5ObffJtZlOofonxCFLLwy4=;
 b=U93A2HAg3c+Y5geyJlTBVHMCsXPQKF40WaRHJ3T1FUxRqRZ3MUHH+kQCHCtxgWZM65
 FwHEMvKuLzQNPkKD9cPTd1NpmPepPNVEKhAzOC9QyfTf8h55hI6EuW0ETeTS1V0SvHVF
 5cqFYCgN8zpsG9NjM0hbSK9enp+NLhFD/ktGpRCD4H6A2tVTBumEj84W5GaHFY33dzQp
 wQem+tkxuo5k+VQ1BE+C/awl7AYIrgpIx8gsQUCr+h0pGa+CJtzrsI1kgNHxpqDAyVS8
 /DUkj9Y5dXf+zkPym/oadbBt6myMGUt8mUf8wq0E/3eIt0YYpEc7x2x5tRYrFrtaaLsy
 BQsA==
X-Gm-Message-State: AOAM533ksxMXEL2wAyeFvus+sUy7agnHJ1/LnEczEYjlqp1N8pKBDvmI
 oaYVbzG2cO/v2rg3sSeWdaptO2nfszkRWjse
X-Google-Smtp-Source: ABdhPJxb50z2T3J2pHsBYvr/kzcp3wTkp0liQF+PCucRSU8P69Niy4PQaUZiC+8IhTWbqc6Xl3/jpw==
X-Received: by 2002:a05:600c:a45:: with SMTP id
 c5mr12117475wmq.127.1643304823079; 
 Thu, 27 Jan 2022 09:33:43 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id c14sm2997579wri.56.2022.01.27.09.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 09:33:42 -0800 (PST)
Date: Thu, 27 Jan 2022 18:33:40 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <YfLXdA/PzTeJ7YZQ@pevik>
References: <20220126235652.25712-1-petr.vorel@gmail.com>
 <87lez191e6.fsf@tarshish>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87lez191e6.fsf@tarshish>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/ltp-testsuite: bump version
 to 20220121
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQmFydWNoLAoKPiBIaSBQZXRyLAoKPiBPbiBUaHUsIEphbiAyNyAyMDIyLCBQZXRyIFZvcmVs
IHdyb3RlOgo+ID4gTFRQIG5vdyBidWlsZHMgbWV0YWRhdGEgZGlyZWN0b3J5IGFzIGhvc3QgdGFy
Z2V0Lgo+ID4gSXQncyBtYW5kYXRvcnksIHRoZXJlZm9yZSBhZGRpbmcgSE9TVF9DRkxBR1MgYW5k
IEhPU1RfTERGTEFHUyB0byBtYWtlCj4gPiAoYWRkaW5nIHRvIGNvbmZpZ3VyZSBkb2VzIG5vdCB3
b3JrKSB0byBhdm9pZCBhZGRpbmcgLW1sb25nY2FsbHMKPiA+IC1tYXV0by1saXRwb29scyBmb3Ig
c29tZSB0YXJnZXRzIChlLmcuIGJvb3RsaW4teHRlbnNhLXVjbGliYykuCgo+ID4gRHJvcCBwYXRj
aGVzIGZyb20gdGhpcyByZWxlYXNlLgoKPiA+IFJlZnJlc2ggMDAwMS1sYXBpLUFkZC1zeXNpbmZv
LmgtdG8tZml4LWJ1aWxkLXdpdGgtTVVTTC1saWJjLnBhdGNoCj4gPiAoc3RpbGwgc2FmZSB0byBj
YXJyeSBpdCkuCgo+ID4gU2lnbmVkLW9mZi1ieTogUGV0ciBWb3JlbCA8cGV0ci52b3JlbEBnbWFp
bC5jb20+Cj4gPiAtLS0KPiA+IENoYW5nZXMgdjEtPnYyOgo+ID4gKiBBZGQgbWlzc2luIGcgSE9T
VF9MREZMQUdTIHRvIGZpeCBici1hcm0tZnVsbC1zdGF0aWMgKGNhbm5vdCBmaW5kIC1sYwo+ID4g
d2hlbiBjb21waWxpbmcgaG9zdCB0YXJnZXQpCgo+IFsuLi5dCi4uLgo+ID4gQEAgLTcwLDYgKzcw
LDEwIEBAIExUUF9URVNUU1VJVEVfQ09ORl9FTlYgKz0gXAo+ID4gIAlMSUJTPSIkKExUUF9URVNU
U1VJVEVfTElCUykiIFwKPiA+ICAJU1lTUk9PVD0iJChTVEFHSU5HX0RJUikiCgo+ID4gK0xUUF9U
RVNUU1VJVEVfTUFLRV9FTlYgKz0gXAo+ID4gKwlIT1NUX0NGTEFHUz0iJChIT1NUX0NGTEFHUyki
IFwKPiA+ICsJSE9TVF9MREZMQUdTPSIkKEhPU1RfTERGTEFHUykiCgo+IEkgdGhpbmsgeW91IHNo
b3VsZCBoYXZlIFRBUkdFVF8qIG9uIHRoZSByaWdodCBzaWRlIG9mIHRoZSBhc3NpZ25tZW50LAo+
IHNpbmNlIHRoaXMgaXMgYSB0YXJnZXQgcGFja2FnZS4KTm8sIGl0IG11c3QgYmUgSE9TVF8qIGJl
Y2F1c2UgdGhlIHdob2xlIGV4ZXJjaXNlIGlzIG5lZWRlZCB0byBhbGxvdyBvbmUgYml0IG9mCkxU
UCBjb2RlIGJ1aWx0IGZvciBhcyBob3N0IHRhcmdldC4gSSB0cmllZCB0byBleHBsYWluIHRoaXMg
aW4gdGhlIGNvbW1pdAptZXNzYWdlLCBidXQgY2xlYXJseSBJIHdhc24ndCBjbGVhciA6KS4KCgpJ
J3ZlIHRlc3RlZCBpdCBvbiBjb21wbGV0ZSBidWlsZCB0aGF0IGl0J3Mgd29ya2luZyBsaWtlIHRo
aXMuIEJ1dCB1c2luZyBUQVJHRVRfKgphcyB5b3Ugc3VnZ2VzdCBIT1NUX0NGTEFHUyB3b3VsZCBo
YXZlIHRoZSBzYW1lIG9wdGlvbnMgYXMgQ0ZMQUdTLCB3aGljaCBJJ20KdHJ5aW5nIHRvIGF2b2lk
ICh0aGF0J3MgdGhlIGRlZmF1bHQgaWYgd2UgZG9uJ3Qgc2V0IGFueXRoaW5nIFsxXSkuCgpXaXRo
IFRBUkdFVF8qIChvciBub3RoaW5nIHNldCBhdCBhbGwpIGl0IGZhaWxzIGF0IGxlYXN0IG9uIHRo
ZXNlIDIgYnVpbGRzOgoKICAgICAgICAgICAgICAgICAgICAgIGJyLWFybS1mdWxsLXN0YXRpYyBb
NS82XTogRkFJTEVECiAgICAgICAgICAgICAgICAgICBib290bGluLXh0ZW5zYS11Y2xpYmMgWzI0
LzQ1XTogRkFJTEVECiogYnItYXJtLWZ1bGwtc3RhdGljCm1ha2UgLUMgIm1ldGFkYXRhIiBcCgkt
ZiAiYnItdGVzdC1wa2cvYnItYXJtLWZ1bGwtc3RhdGljL2J1aWxkL2x0cC10ZXN0c3VpdGUtMjAy
MjAxMjEvbWV0YWRhdGEvTWFrZWZpbGUiIGFsbAptYWtlWzFdOiBFbnRlcmluZyBkaXJlY3Rvcnkg
J2JyLXRlc3QtcGtnL2JyLWFybS1mdWxsLXN0YXRpYy9idWlsZC9sdHAtdGVzdHN1aXRlLTIwMjIw
MTIxL21ldGFkYXRhJwovdXNyL2Jpbi9nY2MgLURfTEFSR0VGSUxFX1NPVVJDRSAtRF9MQVJHRUZJ
TEU2NF9TT1VSQ0UgLU9zIC1nMCAtc3RhdGljIC1JYnItdGVzdC1wa2cvYnItYXJtLWZ1bGwtc3Rh
dGljL2hvc3QvYmluLy4uL2FybS1idWlsZHJvb3QtbGludXgtdWNsaWJjZ251ZWFiaS9zeXNyb290
L3Vzci9pbmNsdWRlL3RpcnBjICAtZyAtTzIgLWZuby1zdHJpY3QtYWxpYXNpbmcgLXBpcGUgLVdh
bGwgLVcgLVdvbGQtc3R5bGUtZGVmaW5pdGlvbiAtc3RhdGljIG1ldGFwYXJzZS5jICAtbyBtZXRh
cGFyc2UKL3Vzci9saWI2NC9nY2MveDg2XzY0LXN1c2UtbGludXgvMTEvLi4vLi4vLi4vLi4veDg2
XzY0LXN1c2UtbGludXgvYmluL2xkOiBjYW5ub3QgZmluZCAtbGMKY29sbGVjdDI6IGVycm9yOiBs
ZCByZXR1cm5lZCAxIGV4aXQgc3RhdHVzCm1ha2VbMV06ICoqKiBbLi4vaW5jbHVkZS9tay9ydWxl
cy5tazoyNzogbWV0YXBhcnNlXSBFcnJvciAxCm1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5ICdi
ci10ZXN0LXBrZy9ici1hcm0tZnVsbC1zdGF0aWMvYnVpbGQvbHRwLXRlc3RzdWl0ZS0yMDIyMDEy
MS9tZXRhZGF0YScKbWFrZTogKioqIFtNYWtlZmlsZToxMDY6IG1ldGFkYXRhLWFsbF0gRXJyb3Ig
MgoKKiBib290bGluLXh0ZW5zYS11Y2xpYmMKbWFrZSAtQyAibWV0YWRhdGEiIFwKCS1mICJici10
ZXN0LXBrZy9ib290bGluLXh0ZW5zYS11Y2xpYmMvYnVpbGQvbHRwLXRlc3RzdWl0ZS0yMDIyMDEy
MS9tZXRhZGF0YS9NYWtlZmlsZSIgYWxsCm1ha2VbMV06IEVudGVyaW5nIGRpcmVjdG9yeSAnYnIt
dGVzdC1wa2cvYm9vdGxpbi14dGVuc2EtdWNsaWJjL2J1aWxkL2x0cC10ZXN0c3VpdGUtMjAyMjAx
MjEvbWV0YWRhdGEnCi91c3IvYmluL2djYyAtRF9MQVJHRUZJTEVfU09VUkNFIC1EX0xBUkdFRklM
RTY0X1NPVVJDRSAtbWxvbmdjYWxscyAtbWF1dG8tbGl0cG9vbHMgLU9zIC1nMCAtSWJyLXRlc3Qt
cGtnL2Jvb3RsaW4teHRlbnNhLXVjbGliYy9ob3N0L2Jpbi8uLi94dGVuc2EtYnVpbGRyb290LWxp
bnV4LXVjbGliYy9zeXNyb290L3Vzci9pbmNsdWRlL3RpcnBjICAtZyAtTzIgLWZuby1zdHJpY3Qt
YWxpYXNpbmcgLXBpcGUgLVdhbGwgLVcgLVdvbGQtc3R5bGUtZGVmaW5pdGlvbiAgbWV0YXBhcnNl
LmMgIC1vIG1ldGFwYXJzZQpnY2M6IGVycm9yOiB1bnJlY29nbml6ZWQgY29tbWFuZC1saW5lIG9w
dGlvbiDigJgtbWxvbmdjYWxsc+KAmQpnY2M6IGVycm9yOiB1bnJlY29nbml6ZWQgY29tbWFuZC1s
aW5lIG9wdGlvbiDigJgtbWF1dG8tbGl0cG9vbHPigJkKbWFrZVsxXTogKioqIFsuLi9pbmNsdWRl
L21rL3J1bGVzLm1rOjI3OiBtZXRhcGFyc2VdIEVycm9yIDEKbWFrZVsxXTogTGVhdmluZyBkaXJl
Y3RvcnkgJ2JyLXRlc3QtcGtnL2Jvb3RsaW4teHRlbnNhLXVjbGliYy9idWlsZC9sdHAtdGVzdHN1
aXRlLTIwMjIwMTIxL21ldGFkYXRhJwoKCktpbmQgcmVnYXJkcywKUGV0cgoKWzFdIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2x0cC9ZZko2ZkliRnZON3JEMFNSQHBldmlrLwoKPiBiYXJ1Y2gKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
