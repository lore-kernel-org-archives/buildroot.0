Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53471C433EF
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 13:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C484460D59;
	Sun, 15 May 2022 13:56:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ADUvz1TyEKHt; Sun, 15 May 2022 13:56:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 329B860AA7;
	Sun, 15 May 2022 13:56:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2382C1BF333
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 13:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1178B60AA7
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 13:56:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bJFYxdJY9daL for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 13:56:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F45E60A9F
 for <buildroot@buildroot.org>; Sun, 15 May 2022 13:56:51 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id m1so17321099wrb.8
 for <buildroot@buildroot.org>; Sun, 15 May 2022 06:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=N1G4Whrhn+x7Kzz+twG5FS1vMVPEW0u2r8u+2dPXZ9A=;
 b=mRZvQxsNXyXiFB9QW5B0BU9mOtF7X/K6VnrzVvK5Ae+nak0UyQ13IfD1JFdf/902xT
 DQwPEvHHVinxS4+++STx7SXXmLbcHhrEZOEIVDnDXWE1VK6dUscX4LTUQHLR/wz+0W3O
 lYYT7B8o+GrIeFB7xyT6pqfUH+lNuC+fot3huEglyff6u8lJRCm5RRZqQXGLq1m7ghbH
 +JDtNDWMtv1U2F5wVALt0tgbo0Ouc53Lpf6/K52I088Zj1Xevb6w8Tmkfijd93QKvMKC
 ta7MpgWlyXfoNZeN6GDFQ3KX3utRZbaVT6iZlIDuekPW4036FpAOXkBbtdns+8B0WlJD
 8c/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=N1G4Whrhn+x7Kzz+twG5FS1vMVPEW0u2r8u+2dPXZ9A=;
 b=ni6r2Uq8cxzuTEH5YLKV3Oi/hYW/cfjn3NvZ8o721MwMfMCtMUCADLH2qewGyckBua
 +Wk8HPn3EatUCszWfvtklEg/gssvf4zZtbuSgN/v/dzJZCDp6py4ASTFu1fs1VtOjNg2
 RjC+RKcNiDyq+NeI7azieFPvg8Xbb7ogAlSsSMw+Cly6nO9yttxxW5qGb30Pn19Kn0m6
 apuCHGbJklfSTGFzoMGT8RlUWJtUqLPisq/phZ6GnvK6sSmzrAgkZVhJ7Pum1W82hIWd
 YCN6FWovkKinfc+8yz0behLM94YEtS8e1mU1L13HjOX12Vo1fokFqSSdrPU7OE0yvHTO
 KVAg==
X-Gm-Message-State: AOAM5335WL8CRlM8DlJ0XAgX/Ca4IjVq4DOqiRZG5eflfdtTm9FORDu4
 qWz6RyKQE+8qQI+AJAwuo6sajb5okTc=
X-Google-Smtp-Source: ABdhPJwe+v62SG30STDPeA4TmVTkwJVQR/WORtL11LLmDmiD8JfH9lU3rgGeD8+rvRzgKz1vDUoyIg==
X-Received: by 2002:a5d:6da1:0:b0:20c:6969:b26a with SMTP id
 u1-20020a5d6da1000000b0020c6969b26amr10780163wrs.103.1652623009964; 
 Sun, 15 May 2022 06:56:49 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 z23-20020a1c4c17000000b0039456fb80b3sm10455999wmf.43.2022.05.15.06.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 May 2022 06:56:48 -0700 (PDT)
Date: Sun, 15 May 2022 15:56:45 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <YoEGnYusX1F5m+dK@pevik>
References: <62789f76.1c69fb81.8311.5ad0SMTPIN_ADDED_MISSING@mx.google.com>
 <YoCUNGCcz/ScZgAI@pevik>
 <CAPi7W81H7JAbL=8FGa3v0jFHyikEMStnpzApBt222JmZm1P60w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPi7W81H7JAbL=8FGa3v0jFHyikEMStnpzApBt222JmZm1P60w@mail.gmail.com>
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-05-08
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRmFicmljZSwKCj4gSGkgUGV0ciwKCj4gTGUgZGltLiAxNSBtYWkgMjAyMiDDoCAwNzo0OCwg
UGV0ciBWb3JlbCA8cGV0ci52b3JlbEBnbWFpbC5jb20+IGEgw6ljcml0IDoKCj4gPiBIaSBhbGws
Cgo+ID4gPiBBdXRvYnVpbGRlciBmYWlsdXJlcwo+ID4gPiA9PT09PT09PT09PT09PT09PT09PQoK
PiA+ID4gICAgIGFyY2ggICAgIHwgICAgICAgICAgICAgcmVhc29uICAgICAgICAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1cmwKPiA+ID4gLS0tLS0tLS0tLS0t
LSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPiA+ID4gICAgbWlwczY0ICAgIHwgICAgIGx0cC10ZXN0c3VpdGUtMjAyMjAxMjEgICAgIHwg
aHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvMmRhZmVjOTRiODg4OTYwMzM1
MTE1YjQ0YzI4MTc0MWRmZDU1ODQwYgoKPiA+IHRoaXMgdWNsaWJjIDEuMC40MCAgYmFzZWQgdG9v
bGNoYWluIGlzIG5vdCBhYmxlIHRvIGRldGVjdCBmc3RhdGF0KCkgdmlhIGNvbmZpZ3VyZSwgYnV0
Cj4gPiBpdCdzIGF2YWlsYWJsZToKCj4gPiBjb25maWd1cmU6NjYxNTogY2hlY2tpbmcgZm9yIGZz
dGF0YXQKPiA+IGNvbmZpZ3VyZTo2NjE1OiBidWlsZHJvb3Qvb3V0cHV0L2hvc3QvYmluL21pcHM2
NC1idWlsZHJvb3QtbGludXgtdWNsaWJjLWdjYyAtbyBjb25mdGVzdCAtRF9MQVJHRUZJTEVfU09V
UkNFIC1EX0xBUkdFRklMRTY0X1NPVVJDRSAtT3MgLWcwIC1JYnVpbGRyb290L291dHB1dC9ob3N0
L2Jpbi8uLi9taXBzNjQtYnVpbGRyb290LWxpbnV4LXVjbGliYy9zeXNyb290L3Vzci9pbmNsdWRl
L3RpcnBjICAtRF9MQVJHRUZJTEVfU09VUkNFIC1EX0xBUkdFRklMRTY0X1NPVVJDRSAgY29uZnRl
c3QuYyAtTGJ1aWxkcm9vdC9vdXRwdXQvaG9zdC9iaW4vLi4vbWlwczY0LWJ1aWxkcm9vdC1saW51
eC11Y2xpYmMvc3lzcm9vdC91c3IvbGliIC1sdGlycGMgIC1sZnRzID4mNQo+ID4gYnVpbGRyb290
L291dHB1dC9ob3N0L2xpYi9nY2MvbWlwczY0LWJ1aWxkcm9vdC1saW51eC11Y2xpYmMvMTAuMy4w
Ly4uLy4uLy4uLy4uL21pcHM2NC1idWlsZHJvb3QtbGludXgtdWNsaWJjL2Jpbi9sZDogL3RtcC9j
Y0Z3NTNuVS5vOiBpbiBmdW5jdGlvbiBgbWFpbic6Cj4gPiBjb25mdGVzdC5jOigudGV4dC5zdGFy
dHVwKzB4MTApOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBmc3RhdGF0Jwo+ID4gYnVpbGRyb290
L291dHB1dC9ob3N0L2xpYi9nY2MvbWlwczY0LWJ1aWxkcm9vdC1saW51eC11Y2xpYmMvMTAuMy4w
Ly4uLy4uLy4uLy4uL21pcHM2NC1idWlsZHJvb3QtbGludXgtdWNsaWJjL2Jpbi9sZDogY29uZnRl
c3QuYzooLnRleHQuc3RhcnR1cCsweDE4KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZnN0YXRh
dCcKCj4gPiBCdXQgZXZlbiBpZiBJIGNoYW5nZSBpbmNsdWRlL2NvbmZpZy5oIHRvCj4gPiAtIC8q
ICN1bmRlZiBIQVZFX0ZTVEFUQVQgKi8KPiA+ICsjZGVmaW5lIEhBVkVfRlNUQVRBVCAxCgo+ID4g
aXQgZmFpbHMgdG8gYnVpbGQ6Cj4gPiBvdXRwdXQvYnVpbGQvbHRwLXRlc3RzdWl0ZS0yMDIyMDEy
MS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZzdGF0YXQvZnN0YXRhdDAxLmM6MTAwOiB1bmRl
ZmluZWQgcmVmZXJlbmNlIHRvIGBmc3RhdGF0JwoKPiA+IFRoYXQncyBzdHJhbmdlLCBpc24ndCBp
dCBhIGJ1ZyBpbiB0aGUgdG9vbGNoYWluPwoKPiA+IE9yIGlzIGl0IHJlYWxseSBMVFAgYnVnPyBX
aGF0IHdvdWxkIGJlIG1pc3NpbmcgdGhlbj8gSWYgeWVzLCBpdCdkIGJlIG5pY2UgdG8gZml4Cj4g
PiBpdCBiZWZvcmUgdXBjb21pbmcgTFRQIHJlbGVhc2UgKDIgd2Vla3MpLgoKPiBJIGRpZyBpbnRv
IHRoaXMgaXNzdWUgYSB3aGlsZSBhZ28gd2l0aG91dCBmaW5kaW5nIGEgc29sdXRpb24uIEhlcmUg
aXMKPiB3aGF0IEkgZm91bmQuCj4gRmlyc3QgdGhlIGJ1aWxkIGZhaWx1cmUgaXMgb25seSByYWlz
ZWQgd2l0aCB1Y2xpYmMtbmcgb24gbWlwczY0Lgo+IFNlY29uZGx5LCBmc3RhdGF0IGlzIGRlZmlu
ZWQgYXMgZXh0ZXJuIGlmIF9fVVNFX0ZJTEVfT0ZGU0VUNjQgaXMgbm90Cj4gZGVmaW5lZCBbMV0g
aG93ZXZlciBpdHMgaW1wbGVtZW50YXRpb24gaXMgcHJvdGVjdGVkIGJ5ICJpZmRlZgo+IF9fTlJf
ZnN0YXRhdDY0IiBbMl0KCj4gX19OUl9mc3RhdGF0NjQgaXMgZGVmaW5lZCBieToKCj4gI2lmIF9f
V09SRFNJWkUgPT0gNjQgJiYgZGVmaW5lZCBfX05SX25ld2ZzdGF0YXQKPiAjIGRlZmluZSBfX05S
X2ZzdGF0YXQ2NCBfX05SX25ld2ZzdGF0YXQKPiAjZW5kaWYKCj4gU28sIGZvciBhbiB1bmtub3du
IHJlYXNvbiwgSSBhc3N1bWUgdGhhdCBfX05SX25ld2ZzdGF0YXQgaXMgbm90IGRlZmluZWQuCj4g
SW4gdGhpcyBjYXNlLCB1Y2xpYmMtbmcgZG9lc24ndCBkZWZpbmUgYW55IGZhbGxiYWNrIFszXSBy
ZXN1bHRpbmcgaW4KPiB0aGUgYnVpbGQgZmFpbHVyZS4KClRoYW5rcyBmb3IgY29uZmlybWluZyB0
aGF0IGl0J3MgYnVnL2lzc3VlIG9uIHVjbGliYy1uZyBvbiBtaXBzNjQuCkl0J2QgYmUgd29ydGgg
dG8gYXQgbGVhc3QgcmVwb3J0IGl0IHRvIHRoZW0uCgpLaW5kIHJlZ2FyZHMsClBldHIKCgo+ID4g
S2luZCByZWdhcmRzLAo+ID4gUGV0cgoKPiBCZXN0IFJlZ2FyZHMsCgo+IEZhYnJpY2UKCj4gWzFd
IGh0dHBzOi8vZ2l0aHViLmNvbS93YngtZ2l0aHViL3VjbGliYy1uZy9ibG9iL2FiMWRkODNiZWM1
OWM5ZTY1YzMxZWZkNmU4ODcxODI5NDhmNjI3YmUvaW5jbHVkZS9zeXMvc3RhdC5oI0wyNDEKPiBb
Ml0gaHR0cHM6Ly9naXRodWIuY29tL3dieC1naXRodWIvdWNsaWJjLW5nL2Jsb2IvYWIxZGQ4M2Jl
YzU5YzllNjVjMzFlZmQ2ZTg4NzE4Mjk0OGY2MjdiZS9saWJjL3N5c2RlcHMvbGludXgvY29tbW9u
L2ZzdGF0YXQuYyNMMTgKPiBbM10gaHR0cHM6Ly9naXRodWIuY29tL3dieC1naXRodWIvdWNsaWJj
LW5nL2Jsb2IvYWIxZGQ4M2JlYzU5YzllNjVjMzFlZmQ2ZTg4NzE4Mjk0OGY2MjdiZS9saWJjL3N5
c2RlcHMvbGludXgvY29tbW9uL2ZzdGF0YXQuYyNMMzQKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
