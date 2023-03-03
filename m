Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D9AC64EC4
	for <buildroot@archiver.kernel.org>; Fri,  3 Mar 2023 07:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA41241BB1;
	Fri,  3 Mar 2023 07:49:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA41241BB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l0P0F1zVR_QV; Fri,  3 Mar 2023 07:49:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9580F41B86;
	Fri,  3 Mar 2023 07:49:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9580F41B86
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 62B881BF3FC
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 07:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C65641B86
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 07:49:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C65641B86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8T6tSjXgxk7r for <buildroot@lists.busybox.net>;
 Fri,  3 Mar 2023 07:49:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C824941A50
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C824941A50
 for <buildroot@buildroot.org>; Fri,  3 Mar 2023 07:49:38 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id ay14so3184693edb.11
 for <buildroot@buildroot.org>; Thu, 02 Mar 2023 23:49:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677829776;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0HbUgVwu1cWp2BwCmL0ou5WBpx++v7neu0CWIFonblc=;
 b=zIANJm7sSHbTQD7D5gT7Ms556o25OaR/Ncw+aZFcVy6+XwzXxjbu7oUXuy4wvU2A6F
 o+jC2SJT997EMi6P4Xmd7VIU34dr600BVXksfdeOluTQZNgEjE/AD93GdjFuMpv5PlhD
 bkj0/TdVAXfvT7B3d8rFHcKyI3D0kX7ehxWf28E4SmNNUVupWtOpcNqhcHCzzPBfPdzl
 2MPiW2ea2CcMBE1adHPTkoJD1OsdUfrHhmIDq1/DSA2tSf2z9kvKEYIyvEanKEVxbQ5F
 KBCAz88eA+1hJGbWNjvU3rPJDFvIBEyCXS/l1L94oDX0MaA0rPUpBp/dy832+D8HMc6V
 hkIg==
X-Gm-Message-State: AO0yUKUHIm+s1op79jZMGDcOYr0ySCvUBGRmls8xFVYnpJIB/PGQMKgy
 JhhXdVepgFAsyArEVIkvGqngiKQt/kgDIZPVgztmXw==
X-Google-Smtp-Source: AK7set/aNiEJelrWY6dZSSwEQpKIlTiz8vOSI5hukOJ76oRWSV3HX8LNr1TDEQAkP6OdK/UwWLfD5Q==
X-Received: by 2002:a05:6402:1803:b0:4af:81fb:4c72 with SMTP id
 g3-20020a056402180300b004af81fb4c72mr965123edy.34.1677829776609; 
 Thu, 02 Mar 2023 23:49:36 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com.
 [209.85.208.53]) by smtp.gmail.com with ESMTPSA id
 c65-20020a509fc7000000b004bf76fdfdb3sm830514edf.26.2023.03.02.23.49.36
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 23:49:36 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id g3so6985434eda.1
 for <buildroot@buildroot.org>; Thu, 02 Mar 2023 23:49:36 -0800 (PST)
X-Received: by 2002:a50:a69e:0:b0:4c0:5f85:efd2 with SMTP id
 e30-20020a50a69e000000b004c05f85efd2mr563148edc.6.1677829775879; Thu, 02 Mar
 2023 23:49:35 -0800 (PST)
MIME-Version: 1.0
References: <20230302151859.400567-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20230302151859.400567-1-giulio.benetti@benettiengineering.com>
Date: Thu, 2 Mar 2023 23:49:24 -0800
X-Gmail-Original-Message-ID: <CA+h8R2r5SvTysWRJO12UFCG8TdMQo1+Y+q+Mdam4nwj43+yNVw@mail.gmail.com>
Message-ID: <CA+h8R2r5SvTysWRJO12UFCG8TdMQo1+Y+q+Mdam4nwj43+yNVw@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google; t=1677829776;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0HbUgVwu1cWp2BwCmL0ou5WBpx++v7neu0CWIFonblc=;
 b=ACyCi3qrMw7y0xVEZmfR+RrTV4M7xIrqvkBT89G92jWC6GR62yL0azFSDjMsyzXeAa
 F9+s+vaRveut1hE49seVPrlqkdY4yDggxsYD67RCLuYee7mL/ubn4tTCH88uPDht7NuN
 5xaGDERqhZ0JYTtPv0a0I6ppkOE4yg04xBCMTlWL9rCtv5JRXfX+gXdSFwqiUYsNO0nf
 TedVYFdztfTJKjKxSeR5piuAZH+zYiURUnSP0ApDvX7kjDt/BWtK2qECwqbjIwlNPFbw
 PbytRManejOZNzZnCeenwcZxTIHywotTPdhFcnzKjzID45xRQOyixETwHUF1zyZ21kqx
 6vbQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=ACyCi3qr
Subject: Re: [Buildroot] [PATCH] package/rtl8821cu: fix build failure on
 PowerPC64
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgR2l1bGlvLAoKT24gVGh1LCBNYXIgMiwgMjAyMyBhdCA3OjE54oCvQU0gR2l1bGlvIEJlbmV0
dGkKPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+IHdyb3RlOgo+Cj4gTGV0
J3MgYWRkIGxvY2FsIHBhdGNoIHBlbmRpbmcgdXBzdHJlYW0gdG8gZml4IGdldF9yYSgpIGNvbmZs
aWN0IG9uCj4gUG93ZXJQQzY0IGFyY2hpdGVjdHVyZS4KPgo+IFswXTogaHR0cHM6Ly9naXRodWIu
Y29tL21vcnJvd25yLzg4MjFjdS0yMDIxMDExOC9wdWxsLzkzCj4KPiBTaWduZWQtb2ZmLWJ5OiBH
aXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KPiAt
LS0KPiAgLi4uLzAwMDEtRml4LWJ1aWxkLW9uLVBvd2VyUEM2NC5wYXRjaCAgICAgICAgIHwgMTIz
ICsrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTIzIGluc2VydGlvbnMoKykK
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcnRsODgyMWN1LzAwMDEtRml4LWJ1aWxkLW9u
LVBvd2VyUEM2NC5wYXRjaAoKVGhlIHJlcG8gb3duZXIgbW9ycm93bnIgcmVxdWVzdGVkIHRoYXQg
d2Ugc3dpdGNoIHRvIHRoZSBuZXdlciB2ZXJzaW9uCm9mIHRoZSBwYWNrYWdlLCBhbmQgc2VuZCB0
aGUgUFIgdGhlcmUuCgpJIHNlbnQgdGhlIFBSIHRoZXJlOiBodHRwczovL2dpdGh1Yi5jb20vbW9y
cm93bnIvODgyMWN1LTIwMjEwOTE2L3B1bGwvNzMKClRoZSBwYXRjaCB0byB1cGRhdGUgdG8gdGhl
IG5ldyB2ZXJzaW9uOgoKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxk
cm9vdC9wYXRjaC8yMDIzMDMwMzA3NDgyOS4yMTM5ODgxLTEtY2hyaXN0aWFuQHBhcmFsLmluLwoK
QmVzdCByZWdhcmRzLApDaHJpc3RpYW4gU3Rld2FydApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
