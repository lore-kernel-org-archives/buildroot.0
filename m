Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AACC433F5
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 10:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFD90404F4;
	Sun, 15 May 2022 10:53:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PU9PtmMSllkT; Sun, 15 May 2022 10:53:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 653D54042B;
	Sun, 15 May 2022 10:53:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 791D71BF573
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 10:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74F164042B
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 10:53:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vYbcRHhOWbor for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 10:53:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A076340112
 for <buildroot@buildroot.org>; Sun, 15 May 2022 10:53:24 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-f16a3e0529so5976780fac.2
 for <buildroot@buildroot.org>; Sun, 15 May 2022 03:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qo64inbmV0g0TuRkkVHOs54NZvQUn6uAe4rgD2g03ko=;
 b=TrApVrYOfZmTTECNTH2GBZqWb2sx7EN6dFTJCvsiRdUs4eJ2D1suIyqSeBkY6tcMsy
 YFrOMh7lSCOENhsZPnlNPShoJqGjdXNGgFTcJvsETcGE0QvI7God8vhjcJyiZw1hxQ0m
 uslZcSUuF8Gyn1iPODkAQPUZN6mtTfE0o0+y9T3LItjb+m4HI6KSxY4Fc3LWIp/zt2aU
 fw3dHeAd+58u3gGtAjlIEKmuJmngkZB2HJsPTahV6/WCxtghPea7IQbCGqecugAZQRzn
 fDM11oFr3Q4AdZ946Xjsgq1mrVZ62Zm+ztIVfWvdPhfuQpulCJU+Z/kczsOFCCWDB+Ee
 7MRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qo64inbmV0g0TuRkkVHOs54NZvQUn6uAe4rgD2g03ko=;
 b=OXZXF8sEdCLOC63mwb81Mbt1/NQx6lDo9GyEXz8jukkLmhdtIdxv7VCx4UxIhvcoi2
 HJmgYNMpbgz1Xn2a5sxtDDxe8leX0F3DVk7zcAcGX3Dppj7LPjbuUUpE+sbHyi2W74IX
 wORlptyDRs5WSCWih7wYgFUQm8ecarygpVPcRLbHynPmF/P17xfIknNPtT+3CRPLtjzz
 dJKO26RKMFlk2DEU/u1GOgQwB36u+U0IUaWTWgt7t7XkFC29gZM0FINmPT6eKFEG/G9E
 62REJXuEafDRAlHms48zAT3oYKh2ukwsjIayiJnmxar/SwcEM3mGAByLtaKcGklwVae8
 ZdeA==
X-Gm-Message-State: AOAM532AhnxYT2JHwEWmS0j48WjAc75l2J7CySrU0c0+ajiiT3169xFO
 xEygko9+QZK7x/PcxXg7fX61bTZ73zXYl21VNjk=
X-Google-Smtp-Source: ABdhPJzjI/cbxTxxNLVjni74XjmjI3LE4+e06oYRhjJdGyPTKxGqpZ99Fub4qTFP9Txd/U7KB/AqvTHvuZd2atvkvMo=
X-Received: by 2002:a05:6870:5687:b0:f1:88fc:d7a1 with SMTP id
 p7-20020a056870568700b000f188fcd7a1mr2264431oao.228.1652612003678; Sun, 15
 May 2022 03:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <62789f76.1c69fb81.8311.5ad0SMTPIN_ADDED_MISSING@mx.google.com>
 <YoCUNGCcz/ScZgAI@pevik>
In-Reply-To: <YoCUNGCcz/ScZgAI@pevik>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 15 May 2022 12:51:05 +0200
Message-ID: <CAPi7W81H7JAbL=8FGa3v0jFHyikEMStnpzApBt222JmZm1P60w@mail.gmail.com>
To: Petr Vorel <petr.vorel@gmail.com>
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ciwKCkxlIGRpbS4gMTUgbWFpIDIwMjIgw6AgMDc6NDgsIFBldHIgVm9yZWwgPHBldHIu
dm9yZWxAZ21haWwuY29tPiBhIMOpY3JpdCA6Cj4KPiBIaSBhbGwsCj4KPiA+IEF1dG9idWlsZGVy
IGZhaWx1cmVzCj4gPiA9PT09PT09PT09PT09PT09PT09PQo+Cj4gPiAgICAgYXJjaCAgICAgfCAg
ICAgICAgICAgICByZWFzb24gICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVybAo+ID4gLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ICAgIG1pcHM2NCAgICB8ICAg
ICBsdHAtdGVzdHN1aXRlLTIwMjIwMTIxICAgICB8IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290
Lm5ldC9yZXN1bHRzLzJkYWZlYzk0Yjg4ODk2MDMzNTExNWI0NGMyODE3NDFkZmQ1NTg0MGIKPgo+
IHRoaXMgdWNsaWJjIDEuMC40MCAgYmFzZWQgdG9vbGNoYWluIGlzIG5vdCBhYmxlIHRvIGRldGVj
dCBmc3RhdGF0KCkgdmlhIGNvbmZpZ3VyZSwgYnV0Cj4gaXQncyBhdmFpbGFibGU6Cj4KPiBjb25m
aWd1cmU6NjYxNTogY2hlY2tpbmcgZm9yIGZzdGF0YXQKPiBjb25maWd1cmU6NjYxNTogYnVpbGRy
b290L291dHB1dC9ob3N0L2Jpbi9taXBzNjQtYnVpbGRyb290LWxpbnV4LXVjbGliYy1nY2MgLW8g
Y29uZnRlc3QgLURfTEFSR0VGSUxFX1NPVVJDRSAtRF9MQVJHRUZJTEU2NF9TT1VSQ0UgLU9zIC1n
MCAtSWJ1aWxkcm9vdC9vdXRwdXQvaG9zdC9iaW4vLi4vbWlwczY0LWJ1aWxkcm9vdC1saW51eC11
Y2xpYmMvc3lzcm9vdC91c3IvaW5jbHVkZS90aXJwYyAgLURfTEFSR0VGSUxFX1NPVVJDRSAtRF9M
QVJHRUZJTEU2NF9TT1VSQ0UgIGNvbmZ0ZXN0LmMgLUxidWlsZHJvb3Qvb3V0cHV0L2hvc3QvYmlu
Ly4uL21pcHM2NC1idWlsZHJvb3QtbGludXgtdWNsaWJjL3N5c3Jvb3QvdXNyL2xpYiAtbHRpcnBj
ICAtbGZ0cyA+JjUKPiBidWlsZHJvb3Qvb3V0cHV0L2hvc3QvbGliL2djYy9taXBzNjQtYnVpbGRy
b290LWxpbnV4LXVjbGliYy8xMC4zLjAvLi4vLi4vLi4vLi4vbWlwczY0LWJ1aWxkcm9vdC1saW51
eC11Y2xpYmMvYmluL2xkOiAvdG1wL2NjRnc1M25VLm86IGluIGZ1bmN0aW9uIGBtYWluJzoKPiBj
b25mdGVzdC5jOigudGV4dC5zdGFydHVwKzB4MTApOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBm
c3RhdGF0Jwo+IGJ1aWxkcm9vdC9vdXRwdXQvaG9zdC9saWIvZ2NjL21pcHM2NC1idWlsZHJvb3Qt
bGludXgtdWNsaWJjLzEwLjMuMC8uLi8uLi8uLi8uLi9taXBzNjQtYnVpbGRyb290LWxpbnV4LXVj
bGliYy9iaW4vbGQ6IGNvbmZ0ZXN0LmM6KC50ZXh0LnN0YXJ0dXArMHgxOCk6IHVuZGVmaW5lZCBy
ZWZlcmVuY2UgdG8gYGZzdGF0YXQnCj4KPiBCdXQgZXZlbiBpZiBJIGNoYW5nZSBpbmNsdWRlL2Nv
bmZpZy5oIHRvCj4gLSAvKiAjdW5kZWYgSEFWRV9GU1RBVEFUICovCj4gKyNkZWZpbmUgSEFWRV9G
U1RBVEFUIDEKPgo+IGl0IGZhaWxzIHRvIGJ1aWxkOgo+IG91dHB1dC9idWlsZC9sdHAtdGVzdHN1
aXRlLTIwMjIwMTIxL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZnN0YXRhdC9mc3RhdGF0MDEu
YzoxMDA6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGZzdGF0YXQnCj4KPiBUaGF0J3Mgc3RyYW5n
ZSwgaXNuJ3QgaXQgYSBidWcgaW4gdGhlIHRvb2xjaGFpbj8KPgo+IE9yIGlzIGl0IHJlYWxseSBM
VFAgYnVnPyBXaGF0IHdvdWxkIGJlIG1pc3NpbmcgdGhlbj8gSWYgeWVzLCBpdCdkIGJlIG5pY2Ug
dG8gZml4Cj4gaXQgYmVmb3JlIHVwY29taW5nIExUUCByZWxlYXNlICgyIHdlZWtzKS4KCkkgZGln
IGludG8gdGhpcyBpc3N1ZSBhIHdoaWxlIGFnbyB3aXRob3V0IGZpbmRpbmcgYSBzb2x1dGlvbi4g
SGVyZSBpcwp3aGF0IEkgZm91bmQuCkZpcnN0IHRoZSBidWlsZCBmYWlsdXJlIGlzIG9ubHkgcmFp
c2VkIHdpdGggdWNsaWJjLW5nIG9uIG1pcHM2NC4KU2Vjb25kbHksIGZzdGF0YXQgaXMgZGVmaW5l
ZCBhcyBleHRlcm4gaWYgX19VU0VfRklMRV9PRkZTRVQ2NCBpcyBub3QKZGVmaW5lZCBbMV0gaG93
ZXZlciBpdHMgaW1wbGVtZW50YXRpb24gaXMgcHJvdGVjdGVkIGJ5ICJpZmRlZgpfX05SX2ZzdGF0
YXQ2NCIgWzJdCgpfX05SX2ZzdGF0YXQ2NCBpcyBkZWZpbmVkIGJ5OgoKI2lmIF9fV09SRFNJWkUg
PT0gNjQgJiYgZGVmaW5lZCBfX05SX25ld2ZzdGF0YXQKIyBkZWZpbmUgX19OUl9mc3RhdGF0NjQg
X19OUl9uZXdmc3RhdGF0CiNlbmRpZgoKU28sIGZvciBhbiB1bmtub3duIHJlYXNvbiwgSSBhc3N1
bWUgdGhhdCBfX05SX25ld2ZzdGF0YXQgaXMgbm90IGRlZmluZWQuCkluIHRoaXMgY2FzZSwgdWNs
aWJjLW5nIGRvZXNuJ3QgZGVmaW5lIGFueSBmYWxsYmFjayBbM10gcmVzdWx0aW5nIGluCnRoZSBi
dWlsZCBmYWlsdXJlLgoKPgo+IEtpbmQgcmVnYXJkcywKPiBQZXRyCgpCZXN0IFJlZ2FyZHMsCgpG
YWJyaWNlCgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL3dieC1naXRodWIvdWNsaWJjLW5nL2Jsb2Iv
YWIxZGQ4M2JlYzU5YzllNjVjMzFlZmQ2ZTg4NzE4Mjk0OGY2MjdiZS9pbmNsdWRlL3N5cy9zdGF0
LmgjTDI0MQpbMl0gaHR0cHM6Ly9naXRodWIuY29tL3dieC1naXRodWIvdWNsaWJjLW5nL2Jsb2Iv
YWIxZGQ4M2JlYzU5YzllNjVjMzFlZmQ2ZTg4NzE4Mjk0OGY2MjdiZS9saWJjL3N5c2RlcHMvbGlu
dXgvY29tbW9uL2ZzdGF0YXQuYyNMMTgKWzNdIGh0dHBzOi8vZ2l0aHViLmNvbS93YngtZ2l0aHVi
L3VjbGliYy1uZy9ibG9iL2FiMWRkODNiZWM1OWM5ZTY1YzMxZWZkNmU4ODcxODI5NDhmNjI3YmUv
bGliYy9zeXNkZXBzL2xpbnV4L2NvbW1vbi9mc3RhdGF0LmMjTDM0Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
