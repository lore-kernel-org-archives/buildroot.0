Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63A2C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 22:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E373408CB;
	Mon,  7 Mar 2022 22:27:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s-wUxodaFCre; Mon,  7 Mar 2022 22:27:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4885540734;
	Mon,  7 Mar 2022 22:27:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 485BE1BF39D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 451E460B1B
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:27:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XsGBPXrylAP9 for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 22:27:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8AF126070A
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 22:27:03 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id qa43so35068751ejc.12
 for <buildroot@buildroot.org>; Mon, 07 Mar 2022 14:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BOb61vEJAIda+m/iClSjK9KQ51lCc5Z1usEepRKem/M=;
 b=PnbB4NbaWMu+N1QfADSEPI//XvEOcV5NyC8X9oQC+KohSUGyhRUOqb4FURP3A2iwf6
 HH4XjV9e/brYYsI+ilBPYC1zsoW5kcBw84Ss5f5DcFBDZshE/OuPMbFjghp6yBa8WSws
 +Jv64s6HL+FcEyXP24kSQh9g4GGmuGkOC+CtYHytxDeVEx7B7l5UJXO08JvH8al3iZi4
 F6QfalpMAUz97p+anU63CEoypcAWXCrQrVfy1fBy3yGDyasMBqV7Cg2cLCmtoRYYs69w
 x/raoVLlxblCEA5IoMWVP+KFwPB/JFyfBIqyoXDy8/gpuUDvzxm5/5UZ+lOWkE1QkbG8
 8jIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BOb61vEJAIda+m/iClSjK9KQ51lCc5Z1usEepRKem/M=;
 b=69q9lzLNc1ijLdddAistWunS4YY77lrmvWOQrA7RoXl94ZAJrMLft5RgTd1IVb5GVc
 nK8Yy7QSajanu07iBHP7y32y0BOJDcnb2UvyBcnVuzfmv241mVYmO64mpCDUprQYR/Ay
 05Jbxh50NcbLiYEJ1YVPO4q9GojnPwz0rQZW1dGToOZMXjiOtPV9FxHJyA8bJJt32QUw
 7dTZ/11+sDupU7kNqeT2P03noGk3UWeXsxAgPdzTifkDIXlNAb2gGJeO5/xNKMQk5ODM
 Gw0x5mghEyXY+qUrZ3vRL060CZFe5HgnfhSND6zG3d+w4NBfwtyJAardhbeI+p+z6hlN
 QKKg==
X-Gm-Message-State: AOAM5335ykuh7a/H0vM2muL4jPDKhYZRyITteOGQYC5Yfnaft+8YxeWO
 ic4V6EwSN2GuMqS4jF3YNRUK3guMLs3wrQ==
X-Google-Smtp-Source: ABdhPJyc4Jxzp+FcUGz9tcPGsrwVvQDaZBzD+j2UzPNtt4Ya6oIHLM3mgceqEWZzMl2/eaRcefypfA==
X-Received: by 2002:a17:907:da9:b0:6da:beb8:fdac with SMTP id
 go41-20020a1709070da900b006dabeb8fdacmr11060672ejc.364.1646692021790; 
 Mon, 07 Mar 2022 14:27:01 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a50cccf000000b0040f74c6abedsm6707816edj.77.2022.03.07.14.27.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 14:27:01 -0800 (PST)
Message-ID: <f237ca5d-a53f-ee3c-0fef-aa1a12e20930@mind.be>
Date: Mon, 7 Mar 2022 23:27:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220223203631.3398950-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220223203631.3398950-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] utils/checkpackagelib/lib_mk.py: check
 CONF_OPTS
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDIzLzAyLzIwMjIgMjE6MzYsIEZhYnJpY2UgRm9udGFpbmUgd3JvdGU6Cj4gQXMgYWxyZWFk
eSBkb25lIGZvciB7Rk9PfV9ERVBFTkRFTkNJRVMgaW4gY29tbWl0Cj4gNDkxMGExNzViM2YxZjRi
NTVmZjI1N2E3NTk0NWQ4ZmZiMTRhNGNlYiwgY2hlY2sgdGhhdCB7Rk9PfV9DT05GX09QVFMgYXJl
Cj4gbmV2ZXIgb3ZlcnJpZGRlbiBpbiBhIGNvbmRpdGlvbmFsCj4KPiBTaWduZWQtb2ZmLWJ5OiBG
YWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KCiDCoEFwcGxpZWQg
dG8gbWFzdGVyLCB0aGFua3MuCgp1cG1wZGNsaS5tayBmYWlsZWQgdGhpcyBjaGVjaywgc28gSSBh
bHNvIHB1c2hlZCBhIGZpeC4KCgogwqBSZWdhcmRzLAogwqBBcm5vdXQKCj4gLS0tCj4gICB1dGls
cy9jaGVja3BhY2thZ2VsaWIvbGliX21rLnB5IHwgMSArCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS91dGlscy9jaGVja3BhY2thZ2VsaWIvbGliX21r
LnB5IGIvdXRpbHMvY2hlY2twYWNrYWdlbGliL2xpYl9tay5weQo+IGluZGV4IDE1Mzc1NGI2ZjEu
LmI1MGExOWFjNjIgMTAwNjQ0Cj4gLS0tIGEvdXRpbHMvY2hlY2twYWNrYWdlbGliL2xpYl9tay5w
eQo+ICsrKyBiL3V0aWxzL2NoZWNrcGFja2FnZWxpYi9saWJfbWsucHkKPiBAQCAtOTAsNiArOTAs
NyBAQCBjbGFzcyBPdmVycmlkZGVuVmFyaWFibGUoX0NoZWNrRnVuY3Rpb24pOgo+ICAgICAgICAg
ICByIl9TT1VSQ0Vccyo9XHMqIiwKPiAgICAgICAgICAgciJfVkVSU0lPTlxzKj1ccyoiXSkpKQo+
ICAgICAgIEZPUkJJRERFTl9PVkVSUklEREVOID0gcmUuY29tcGlsZShyIl5bQS1aMC05X10rKHt9
KSIuZm9ybWF0KCJ8Ii5qb2luKFsKPiArICAgICAgICByIl9DT05GX09QVFNccyo9XHMqIiwKPiAg
ICAgICAgICAgciJfREVQRU5ERU5DSUVTXHMqPVxzKiJdKSkpCj4gICAKPiAgICAgICBkZWYgYmVm
b3JlKHNlbGYpOgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
