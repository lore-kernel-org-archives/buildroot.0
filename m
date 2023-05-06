Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9349C77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 14:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CB8861110;
	Sat,  6 May 2023 14:22:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CB8861110
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r_z2mcubnYv7; Sat,  6 May 2023 14:22:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14D1961108;
	Sat,  6 May 2023 14:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14D1961108
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 60C531BF36E
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A3754014B
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:22:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A3754014B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EJ5F9hDJuDoV for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 14:22:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C5D940514
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C5D940514
 for <buildroot@buildroot.org>; Sat,  6 May 2023 14:22:10 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-b9a6f17f2b6so18322110276.1
 for <buildroot@buildroot.org>; Sat, 06 May 2023 07:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683382929; x=1685974929;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OzGGeoUJlec91E6vZxlyPBxXrwGMv5mjYf2IuLpyKCc=;
 b=UBO+GfmtV9V5C32Nhm8t75Myijj/MmdGDW6x4S+0Sd4DCebb+eDK2oczMw2Rz7gV03
 2b6Qr4IQMjsuM1R1WygHDRDDgzkAHbWQplMO5GaRDdmnS1Yd9stb0x4LS8iVvaz1LjNl
 8WqDcxyJ3lhK/Nq1dkUEcjcuxKuovIkOiUtwc4gWNqc++9i7FpCKkCbw8KY1UmjnDBOM
 fPM2Eh0L0xhAehOKSjvz7GCbkBC1SRt6q9cZ6wwKf5DyLkzqgonC/lrblL/qDLbSLtZr
 FdxHw4Am+o7Z2cw4vGXThtRP0RmogfC2+VVi6UEY8A72T034wOWiWQkS+o82xyUrKaiQ
 QHew==
X-Gm-Message-State: AC+VfDw7uJuTD4yI5DT0IFIN5ZFf7GGKwv3IJYD+NbHJaHy+L10uvqDR
 hbnfIgL6p0iXetou86fDLQ1VPODNJH+9gCsJqY50eglD7vxQds1451bpFQ==
X-Google-Smtp-Source: ACHHUZ7/+hzqtAnbeSbVqkC/tYafLuhxrF7ekleqcdQ0lU/ce19gnlwAq+/vnPlm2Rv9qU59oa8KsPfz+Qbb06S/x6w=
X-Received: by 2002:a81:a4c:0:b0:55d:9c2d:20d with SMTP id
 73-20020a810a4c000000b0055d9c2d020dmr4988031ywk.6.1683382927811; 
 Sat, 06 May 2023 07:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230501162619.1260325-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20230501162619.1260325-1-giulio.benetti@benettiengineering.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 6 May 2023 16:21:56 +0200
Message-ID: <CABGWkvqpAsu8NjkfW7RVQTbBrrsA_koVffPSVh8K5dUYhmHX6Q@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1683382929; x=1685974929;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OzGGeoUJlec91E6vZxlyPBxXrwGMv5mjYf2IuLpyKCc=;
 b=E7HvAIxY1pih+pz1N3h5BAPLHlzkyvcKg5KWNRXhs87TWtqkXq6xA5Q43SnRjseLNg
 e5yKrv2ZuzvvnFRuhP2ymOVisUmEvI6fUQEIa559vh98OwCQ9y8X6hLwJum16yH2XK9O
 J22xMIV9Cedv4TKMI/YS1dDYv0lQe23QqiU30=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=E7HvAIxY
Subject: Re: [Buildroot] [PATCH] configs/stm32f429_disco_xip_defconfig: fix
 runtime error due to low ram space and bump to linux version 6.1.27
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
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgR2l1bGlvLAoKT24gTW9uLCBNYXkgMSwgMjAyMyBhdCA2OjI24oCvUE0gR2l1bGlvIEJlbmV0
dGkKPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+IHdyb3RlOgo+Cj4gQWZ0
ZXIgYm9vdGluZyBMaW51eCB0aGUgdXNlcnNwYWNlIGlzIHVudXNhYmxlIHNpbmNlIGV2ZXJ5IGNv
bW1hbmQgaXNzdWVkLAo+IHRoYXQgaXMgYSBzeW1saW5rIHRvIGJ1c3lib3gsIGZhaWxzIGJlY2F1
c2Ugb2Ygbm8gZnJlZSByYW0uIFNvIGxldCdzCj4gZGlzYWJsZSBJSU8gaW4gbGludXguY29uZmln
IHRvIGdpdmUgc29tZSBtb3JlIHJhbSB0byB1c2Vyc3BhY2UuCj4KCkkgaGF2ZSBhbHNvIGV4cGVy
aWVuY2VkIHRoaXMgdHlwZSBvZiBiZWhhdmlvciB3aGVuIHVzaW5nIFNUIGJvYXJkcyBpbgpnZW5l
cmFsIChzdG0zMmY0MjktZGlzY28sIHN0bTMyZjQ2OS1kaXNjbywKYW5kIHN0bTMyZjc2OS1kaXNj
byksIGFuZCBldmVyeSB0aW1lIEkgd29uZGVyIHdoZXRoZXIgaXQgaXMgYmV0dGVyIHRvCnVwZGF0
ZSB0aGUga2VybmVsICh3aGljaCBhbHdheXMgb2NjdXBpZXMgbW9yZQptZW1vcnkgd2l0aCBlYWNo
IG5ldyB2ZXJzaW9uKSBvciBub3QuIFRoZSBpZGVhIEkgaGF2ZSBpcyB0byBwcmVmZXIgdGhlCmtl
cm5lbCB0byB1c2VyIHNwYWNlLCBhbmQgdGhlcmVmb3JlIGRpc2FibGUKc3RhcnRpbmcgZnJvbSB0
aGUgdXNlciBzcGFjZSBmaXJzdCBvZiBhbGwsIGJ1dCBteSBvcGluaW9uIGlzIGRlYmF0YWJsZS4K
ClRoYW5rcyBhbmQgcmVnYXJkcywKRGFyaW8KCj4gU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0
dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4gLS0tCj4gIGJvYXJk
L3N0bWljcm9lbGVjdHJvbmljcy9zdG0zMmY0MjktZGlzY28vbGludXguY29uZmlnIHwgNCAtLS0t
Cj4gIGNvbmZpZ3Mvc3RtMzJmNDI5X2Rpc2NvX3hpcF9kZWZjb25maWcgICAgICAgICAgICAgICAg
IHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2JvYXJkL3N0bWljcm9lbGVjdHJvbmljcy9zdG0zMmY0MjktZGlz
Y28vbGludXguY29uZmlnIGIvYm9hcmQvc3RtaWNyb2VsZWN0cm9uaWNzL3N0bTMyZjQyOS1kaXNj
by9saW51eC5jb25maWcKPiBpbmRleCA3YjVjNjBmMTgwLi4wMmQ5YzJkMWUwIDEwMDY0NAo+IC0t
LSBhL2JvYXJkL3N0bWljcm9lbGVjdHJvbmljcy9zdG0zMmY0MjktZGlzY28vbGludXguY29uZmln
Cj4gKysrIGIvYm9hcmQvc3RtaWNyb2VsZWN0cm9uaWNzL3N0bTMyZjQyOS1kaXNjby9saW51eC5j
b25maWcKPiBAQCAtOTUsMTAgKzk1LDYgQEAgQ09ORklHX1NUTTMyX01ETUE9eQo+ICBDT05GSUdf
U1lOQ19GSUxFPXkKPiAgIyBDT05GSUdfVklSVElPX01FTlUgaXMgbm90IHNldAo+ICAjIENPTkZJ
R19WSE9TVF9NRU5VIGlzIG5vdCBzZXQKPiAtQ09ORklHX0lJTz15Cj4gLUNPTkZJR19JSU9fQlVG
RkVSPXkKPiAtQ09ORklHX0lJT19UUklHR0VSRURfQlVGRkVSPXkKPiAtQ09ORklHX0lJT19TVE0z
Ml9USU1FUl9UUklHR0VSPXkKPiAgIyBDT05GSUdfRklMRV9MT0NLSU5HIGlzIG5vdCBzZXQKPiAg
IyBDT05GSUdfRE5PVElGWSBpcyBub3Qgc2V0Cj4gICMgQ09ORklHX0lOT1RJRllfVVNFUiBpcyBu
b3Qgc2V0Cj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3Mvc3RtMzJmNDI5X2Rpc2NvX3hpcF9kZWZjb25m
aWcgYi9jb25maWdzL3N0bTMyZjQyOV9kaXNjb194aXBfZGVmY29uZmlnCj4gaW5kZXggODcyZTRi
NmEzMC4uMWFlYTc0MWY3ZSAxMDA2NDQKPiAtLS0gYS9jb25maWdzL3N0bTMyZjQyOV9kaXNjb194
aXBfZGVmY29uZmlnCj4gKysrIGIvY29uZmlncy9zdG0zMmY0MjlfZGlzY29feGlwX2RlZmNvbmZp
Zwo+IEBAIC02LDcgKzYsNyBAQCBCUjJfRU5BQkxFX0xUTz15Cj4gIEJSMl9ST09URlNfUE9TVF9C
VUlMRF9TQ1JJUFQ9ImJvYXJkL3N0bWljcm9lbGVjdHJvbmljcy9jb21tb24vc3RtMzJmNHh4L3N0
bTMyLXBvc3QtYnVpbGQuc2giCj4gIEJSMl9MSU5VWF9LRVJORUw9eQo+ICBCUjJfTElOVVhfS0VS
TkVMX0NVU1RPTV9WRVJTSU9OPXkKPiAtQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9W
QUxVRT0iNi4xLjEwIgo+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2
LjEuMjciCj4gIEJSMl9MSU5VWF9LRVJORUxfVVNFX0NVU1RPTV9DT05GSUc9eQo+ICBCUjJfTElO
VVhfS0VSTkVMX0NVU1RPTV9DT05GSUdfRklMRT0iYm9hcmQvc3RtaWNyb2VsZWN0cm9uaWNzL3N0
bTMyZjQyOS1kaXNjby9saW51eC5jb25maWciCj4gIEJSMl9MSU5VWF9LRVJORUxfSU1BR0VfVEFS
R0VUX0NVU1RPTT15Cj4gLS0KPiAyLjM0LjEKPgoKCi0tIAoKRGFyaW8gQmluYWNjaGkKClNlbmlv
ciBFbWJlZGRlZCBMaW51eCBEZXZlbG9wZXIKCmRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlv
bnMuY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCgoKQW1hcnVsYSBTb2x1
dGlvbnMgU1JMCgpWaWEgTGUgQ2FuZXZhcmUgMzAsIDMxMTAwIFRyZXZpc28sIFZlbmV0bywgSVQK
ClQuICszOSAwNDIgMjQzIDUzMTAKaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQoKd3d3LmFtYXJ1
bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
