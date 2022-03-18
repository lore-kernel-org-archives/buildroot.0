Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79165C433EF
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 22:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2863940909;
	Fri, 18 Mar 2022 22:00:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PeU-SfkifbuC; Fri, 18 Mar 2022 22:00:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38797408B2;
	Fri, 18 Mar 2022 22:00:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9010D1BF215
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BC3D60812
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 21:59:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EQv1MS_54QJm for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 21:59:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08A28607CE
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 21:59:57 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 d15-20020a05683018ef00b005b2304fdeecso6452777otf.1
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 14:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BBkJTbyVTtGmabCPVUWopeu++sWjvfY1AtMiTo8lHqU=;
 b=i6XMiSB/eFGHLLclv42CIAJd+Ad1Nad0LtvpbxjbKHRhkw7sHJROAXR25pnvKtWyts
 IDFPt89JNb0dfStImPE6Kbm+1OOYZ+celPQRKYuXqT3BA2ieQH2W0Aq1PPHseRJnuqc3
 oWz3901IjrcJSp7vPwQHThQFQ85yR91WDGLeJKl2/YBealbb5hWQ9Imv8uWLo8gIKR3A
 agSAkV3gpOsQqSSkP866tVH40u6S7e0kZo8Ytep7e2QsHeXABy2I3WMuQA0DTmRU0uFJ
 VxXbRiQEEynCXuiC96D8I51sT7vtXZHk/wEBw0/oDof4RvOfPbi1/ZIe051I2fXCI6Ad
 cP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BBkJTbyVTtGmabCPVUWopeu++sWjvfY1AtMiTo8lHqU=;
 b=Jq/mFRA/t7a39CFtVVLPzNpxeau/JJmblzFaY2EuB1mnw/dOkChfxer7/vyTvL5YDM
 hVSbw941eQFyDj3pve8WABbLY/c39z2UN9jxVohLKYG2wCkCNKNWrR2pSsJZcPUuuitA
 igL0bBDWMnlr9UzPsmF0od7hQlncPiN/jyEkfpoAzm4ZaGNleiyuNJjc+ZnJtdIgwHl9
 Cron5QOe2V/W5etQI4jTs/rdKnmTylRZEW9CLwbhiMdnr/O6/95ifi0yXINM2isQ4PTA
 0222bTeAyn/d9BgneqgYUWB130Q6NcNi8Np+yPEfUUySMs2mxNuoYaSeC19dUiEwUhj3
 Y7Dg==
X-Gm-Message-State: AOAM532waaR7oPH54QnVDHjguQl1YVCZFxvA31VH1/HoIqituJYbSTss
 K4/NesAR2+PuhWAFcT/zkuUT4uRVzVYVFf+aCu6eAB45mzw=
X-Google-Smtp-Source: ABdhPJzcnm+inwGgRuv4Z9YIuUFZ131FK3ISAZgMsw8/FmGSEsMxfupp4axjN44HJDWE3sIxFDXygvEqOn5ZZ1JdjRQ=
X-Received: by 2002:a9d:8f6:0:b0:5b2:2a34:adff with SMTP id
 109-20020a9d08f6000000b005b22a34adffmr3889644otf.237.1647640797044; Fri, 18
 Mar 2022 14:59:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220318193310.752282-1-fontaine.fabrice@gmail.com>
 <20220318215025.GN283544@scaer>
In-Reply-To: <20220318215025.GN283544@scaer>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 18 Mar 2022 22:58:42 +0100
Message-ID: <CAPi7W81HfkqmaLq4ZB7zqfq4p0Gcp411f1AkTeC42FcFVxEkZQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/wireplumber: fix introspection
 build
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwKCkxlIHZlbi4gMTggbWFycyAyMDIyIMOgIDIyOjUwLCBZYW5uIEUuIE1PUklOIDx5YW5u
Lm1vcmluLjE5OThAZnJlZS5mcj4gYSDDqWNyaXQgOgo+Cj4gRmFicmljZSwgQWxsLAo+Cj4gT24g
MjAyMi0wMy0xOCAyMDozMyArMDEwMCwgRmFicmljZSBGb250YWluZSBzcGFrZSB0aHVzbHk6Cj4g
PiBpbnRyb3NwZWN0aW9uIG5lZWRzIGhvc3QtZG94eWdlbiBhbmQgaG9zdC1weXRob24tbHhtbCBz
aW5jZSB0aGUgYWRkaXRpb24KPiA+IG9mIHRoZSBwYWNrYWdlIGluIGNvbW1pdCBjOWEzYzEwNDE3
YWFkY2U5ZWU0OTIyZTMwMjM1Nzc2NDA5Y2U4ZWIzIGFuZAo+ID4gaHR0cHM6Ly9naXRsYWIuZnJl
ZWRlc2t0b3Aub3JnL3BpcGV3aXJlL3dpcmVwbHVtYmVyLy0vY29tbWl0LzJlNWIxM2Y5NzBmZTNk
ZDI4YTRjZTc1ODY4ZDQ2NDAzMDM0YzY4MjIKPgo+IEFzIHBlciB0aGF0IGRpZmYsIGl0IHNlZW1z
IGRveHlnZW4gaXMgb25seSBuZWVkZWQgd2hlbiBhY3R1YWxseSBidWlsZGluZwo+IHRoZSBkb2N1
bWVudGF0aW9uOgo+Cj4gICAgIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9waXBld2ly
ZS93aXJlcGx1bWJlci8tL2NvbW1pdC8yZTViMTNmOTcwZmUzZGQyOGE0Y2U3NTg2OGQ0NjQwMzAz
NGM2ODIyIzBjYzExMzllMzM0N2Y1NzNhZTFmZWVlNWI3M2RiYzhhOGEyMWZjZmEKCkFzIHdyaXR0
ZW4gaW4gdGhlIGNvbW1pdCB0aXRsZSwgd2lyZXBsdW1iZXIgImJ1aWxkIGdvYmplY3QKaW50cm9z
cGVjdGlvbiBmcm9tIHhtbCBmaWxlcyBnZW5lcmF0ZWQgYnkgRG94eWdlbiIKCj4KPiAgICAgZG94
eWdlbl9wID0gZmluZF9wcm9ncmFtKCdkb3h5Z2VuJywgcmVxdWlyZWQ6IGdldF9vcHRpb24oJ2Rv
YycpKQoKSW5kZWVkLCB0aGlzIGlzIHdoYXQgaXMgZG9uZSBpbiB0aGlzIGNvbW1pdC4KQnV0IHRo
ZSBuZXh0IG9uZSAoaS5lLgpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvcGlwZXdpcmUv
d2lyZXBsdW1iZXIvLS9jb21taXQvOTNjMmU3ZDY4NmJhNjc4OTkxMTg1ZTcxMTUzM2NlMjk4MjZi
NTM3NCkKYWRkcyB0aGUgZm9sbG93aW5nOgoKaWYgZ2V0X29wdGlvbignZG9jJykuZW5hYmxlZCgp
IG9yIGdldF9vcHRpb24oJ2ludHJvc3BlY3Rpb24nKS5lbmFibGVkKCkKICBkb3h5Z2VuX3AgPSBm
aW5kX3Byb2dyYW0oJ2RveHlnZW4nLCB2ZXJzaW9uOiAnPj0gMS45LjAnLCByZXF1aXJlZDogdHJ1
ZSkKZWxpZiBnZXRfb3B0aW9uKCdkb2MnKS5hdXRvKCkgb3IgZ2V0X29wdGlvbignaW50cm9zcGVj
dGlvbicpLmF1dG8oKQogIGRveHlnZW5fcCA9IGZpbmRfcHJvZ3JhbSgnZG94eWdlbicsIHZlcnNp
b246ICc+PSAxLjkuMCcsIHJlcXVpcmVkOiBmYWxzZSkKZWxzZQogIGRveHlnZW5fcCA9IGRpc2Fi
bGVyKCkKCj4KPiBCdXQgd2UgYXJlIGFscmVkeSBwYXNzaW5nIC1EZG9jPWRpc2FibGVkLCBzbyB3
aHkgaXMgaXQgc3RpbGwgdHJ5aW5nIHRvCj4gYnVpbGQgdGhlIGRvY3VtZW50YXRpb24/CgpJdCdz
IG5vdCBidWlsZGluZyB0aGUgImZ1bGwiIGRvY3VtZW50YXRpb24gKHdoaWNoIGRlcGVuZHMgb24g
c3BoaW54LApldGMuKSwgb25seSB0aGUgZmlsZSB0aGF0IGlzIG5lZWRlZCBmb3IgZ29iamVjdC1p
bnRyb3NwZWN0aW9uLgoKPgo+IFRoYXQncyBiZWNhdXNlIHRoZSBvcHRpb24gaXMgb25seSBhIGhp
bnQgdG8gbm90IGNhcmUgd2hlbiBkb3h5Z2VuIGlzCj4gbWlzc2luZywgYnV0IGlmIGRveHlnZW4g
aXMgcHJlc2VudCwgdGhlbiB0aGUgZG9jdW1lbnRhdGlvbiBpcyBzdGlsbAo+IGJ1aWx0Lgo+Cj4g
LURkb2M9ZGlzYWJsZWQgc2hvdWxkIHJlYWxseSBkaXNhYmxlIGJ1aWxkaW5nIHRoZSBkb2N1bWVu
dGF0aW9uLCBlLmcuCj4gaW4gLi9tZXNvbi5idWlsZDoKPgo+ICAgICBpZiBnZXRfb3B0aW9uKCdk
b2MnKQo+ICAgICAgIHN1YmRpcignZG9jJykKPiAgICAgZW5kaWYKPgo+IG9yLCBhdCB0aGUgdG9w
IG9mIC4vZG9jL21lc29uLmJ1aWxkOgo+Cj4gICAgIGlmIG5vdCBnZXRfb3B0aW9uKCdkb2MnKQo+
ICAgICAgIHN1YmRpcl9kb25lKCkKPiAgICAgZmkKPgo+IEkgdGhpbmsgdGhlIGZvcm1lciBpcyBi
ZXR0ZXIsIGFzIHRoZXkgYWxyZWFkeSBoYXZlIGNvbmRpdGlvbmFsIHN1YmRpcigpCj4gaW4gdGhl
IHRvcC1sZXZlbCBtZXNvbi5idWlsZC4KPgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPgo+
ID4gLi4vb3V0cHV0LTEvYnVpbGQvd2lyZXBsdW1iZXItMC40LjgvZG9jcy9tZXNvbi5idWlsZDox
NDowOiBFUlJPUjogcHl0aG9uMyBpcyBtaXNzaW5nIG1vZHVsZXM6IGx4bWwKPiA+Cj4gPiBGaXhl
czoKPiA+ICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzI0YzUyNGQ4
NmEzZTJlNjczMDVmNjk4NjQ0YmU5YjE1ZDQ1NjI0ODgKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBG
YWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4g
IHBhY2thZ2Uvd2lyZXBsdW1iZXIvd2lyZXBsdW1iZXIubWsgfCAyICstCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L3BhY2thZ2Uvd2lyZXBsdW1iZXIvd2lyZXBsdW1iZXIubWsgYi9wYWNrYWdlL3dpcmVwbHVtYmVy
L3dpcmVwbHVtYmVyLm1rCj4gPiBpbmRleCAzYmY3Y2VjZTQ1Li4zMjcxMzgzOTFkIDEwMDY0NAo+
ID4gLS0tIGEvcGFja2FnZS93aXJlcGx1bWJlci93aXJlcGx1bWJlci5tawo+ID4gKysrIGIvcGFj
a2FnZS93aXJlcGx1bWJlci93aXJlcGx1bWJlci5tawo+ID4gQEAgLTE3LDcgKzE3LDcgQEAgV0lS
RVBMVU1CRVJfQ09ORl9PUFRTID0gXAo+ID4gICAgICAgLURzeXN0ZW0tbHVhLXZlcnNpb249Cj4g
Pgo+ID4gIGlmZXEgKCQoQlIyX1BBQ0tBR0VfR09CSkVDVF9JTlRST1NQRUNUSU9OKSx5KQo+ID4g
LVdJUkVQTFVNQkVSX0RFUEVOREVOQ0lFUyArPSBnb2JqZWN0LWludHJvc3BlY3Rpb24KPiA+ICtX
SVJFUExVTUJFUl9ERVBFTkRFTkNJRVMgKz0gaG9zdC1kb3h5Z2VuIGhvc3QtcHl0aG9uLWx4bWwg
Z29iamVjdC1pbnRyb3NwZWN0aW9uCj4gPiAgV0lSRVBMVU1CRVJfQ09ORl9PUFRTICs9IC1EaW50
cm9zcGVjdGlvbj1lbmFibGVkCj4gPiAgZWxzZQo+ID4gIFdJUkVQTFVNQkVSX0NPTkZfT1BUUyAr
PSAtRGludHJvc3BlY3Rpb249ZGlzYWJsZWQKPiA+IC0tCj4gPiAyLjM1LjEKPiA+Cj4gPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gYnVpbGRyb290
IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+Cj4gLS0KPiAuLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVk
ZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gfCArMzMgNjYy
IDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAg
ICAgICAgICAgICAgIHwKPiB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06
ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0cDovL3ltb3Jp
bi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNw
aXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKQmVzdCBSZWdhcmRzLAoKRmFicmlj
ZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
