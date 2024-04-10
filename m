Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33ABACD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 11:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAD3C6084B;
	Wed, 10 Apr 2024 11:10:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mYpA3RjEJbnX; Wed, 10 Apr 2024 11:10:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECAA260812
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECAA260812;
	Wed, 10 Apr 2024 11:10:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 06F1C1BF5AA
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 11:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6B3A40766
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 11:10:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M78KKq0JMagJ for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 11:10:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=gero.schwaericke@grandcentrix.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0DF4440752
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DF4440752
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0DF4440752
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 11:10:36 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-56fd7df9ea9so481420a12.0
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 04:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712747435; x=1713352235;
 h=content-transfer-encoding:content-disposition:in-reply-to
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iU576QV1S4aUHARgHQJ6RdEOU8TiSup04+Hk/ngJSOI=;
 b=eVG0vu1hlfnpygS7DQsjEGnanbXiXxQlEq4SVQBj91zv2jfVVoCx60C9CEur6LDGQW
 pPOX+eMVkjjS2PO0KiLZNB6AX2+C6TbaGpaWEnJiV40zt7wHTgL2+P0/p1xIlkwCG9wQ
 SOxDeKnuY23B1uitPt7tuXm7SF8wVQUQBhOfSm9fd3IzIQmI3iYuuMrOrdpU2guGu29E
 cUI52Cmc6Yrro52QLdaTe3KKEcSNpiK1aKMEZ4YhvQb1vLUl8qEDH+qlPWxWoAzz1euh
 P50m7krC/CyJpfC6bE3wzGR8glLYg0GfL+VIvASmJ3X/+8xRmdqSKbodhcHw7XW6S4Hd
 dH4A==
X-Gm-Message-State: AOJu0YxF68CXmcboOj17G5zwE3wC4f2PfyXixQhj5R7HdvAzgq9V5BCE
 smbfPS9Vr4Z3+8nN1D4f+YSr1fEWq4Gy5RhHZRQWIExUyqDf7XJAoTAAjEA/WhDdyXu0zHqn1Fe
 RoFxJKcL8UuGP/uW2DSdrxCRt2AVLqIZrvonkLovhfxk2x2U+Q9ejg5J1CytuntmQ
X-Google-Smtp-Source: AGHT+IFVY0XOpAj4tUR4NtgWKt0bhnhzqr471VgEdO0PiuJFMKzZiLqg8KJzfpuMX/W8sJoc1qongQ==
X-Received: by 2002:a50:9fc8:0:b0:56e:3175:6065 with SMTP id
 c66-20020a509fc8000000b0056e31756065mr1658555edf.9.1712747434571; 
 Wed, 10 Apr 2024 04:10:34 -0700 (PDT)
Received: from theia ([2a02:8109:8abb:b200:a528:deac:9df7:50bb])
 by smtp.gmail.com with ESMTPSA id
 u17-20020aa7d0d1000000b0056e4a626ff2sm4565874edo.10.2024.04.10.04.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 04:10:34 -0700 (PDT)
Date: Wed, 10 Apr 2024 13:10:33 +0200
To: Andreas Dannenberg <dannenberg@ti.com>
Message-ID: <20240410111033.GA2220480@theia>
Mail-Followup-To: Andreas Dannenberg <dannenberg@ti.com>,
 buildroot@buildroot.org
References: <20240407103512.1112712-1-romain.naour@smile.fr>
 <58478029-3c92-497e-bb31-4a1f1119afd4@mind.be>
 <1ec8e03b-f5b7-41cf-bfe4-17f99a871e93@mind.be>
 <0ea49f2c-fe1e-4a44-aaf8-90120ef6f9fd@smile.fr>
 <CABGWkvrVr-AY-huV-tijtt48eYtB4nSQ==gZ1VvnWy4SSyYXyQ@mail.gmail.com>
 <20240410080006.GA1545957@theia>
 <20240410082429.r2qhdb7uaqbr2ukk@dasso>
MIME-Version: 1.0
In-Reply-To: <20240410082429.r2qhdb7uaqbr2ukk@dasso>
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grandcentrix.net; s=google; t=1712747435; x=1713352235; darn=buildroot.org; 
 h=content-transfer-encoding:content-disposition:in-reply-to
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iU576QV1S4aUHARgHQJ6RdEOU8TiSup04+Hk/ngJSOI=;
 b=0ikxawFFvMGbs5LK3u4sRJ1Us7iV0Bww9uKSgiVl/2/oSThWpZK0a4FFRUG+H9DF9Q
 9mTcx77e8d5G3HTvlM9jzx2kZA0euGCg0MsKb6BTK2aSwuGwcov54tBqK5OxQgAHQdZv
 fbg2F2cuTWndpdffuxbJ85C/Sq3PbP0ltUja63VOJ8DMLaC6hztKaiGZ8S0/+TVWBst5
 DxqMrcSoFnAUOXkwW4JPSz/S3beMrkSTpCvAByhd3dFblQViQ91p/eQfE3xcCVRdZtTQ
 tHliWVtJNKdtHJlY4jSOHDv0e6enGUqsGufX2z0cG7vAyhZN4SkU4j2eniH8+/4YuDNs
 oS4w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grandcentrix.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grandcentrix.net header.i=@grandcentrix.net
 header.a=rsa-sha256 header.s=google header.b=0ikxawFF
Subject: Re: [Buildroot] [PATCH v12 00/16] Add support for AM62x-SK HS-FS
 devices
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
From: =?utf-8?q?Gero_Schw=C3=A4ricke_via_buildroot?= <buildroot@buildroot.org>
Reply-To: Gero =?utf-8?Q?Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBBcHIgMTAsIDIwMjQgYXQgMDM6MjQ6MjlBTSAtMDUwMCwgQW5kcmVhcyBEYW5uZW5i
ZXJnIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4gR2VybywgRGFyaW8sCj4KWy4uLl0KPiA+IEF0IGxl
YXN0IG15IGN1cnJlbnQgdGVzdCBvZiB0aV9hbTYyeF9za19kZWZjb25maWcgb24gbWFzdGVyIGZh
aWxlZCB0byBib290Ogo+ID4gCj4gPiAgIFUtQm9vdCBTUEwgMjAyNC4wMSAoQXByIDEwIDIwMjQg
LSAwOTozMjoxNyArMDIwMCkKPiA+ICAgazNfc3lzdGVtX2NvbnRyb2xsZXIgc3lzY3RybGVyOiBr
M19zeXNjdHJsZXJfc3RhcnQ6IEJvb3QgTm90aWZpY2F0aW9uIHJlc3BvbnNlIGZhaWxlZC4gcmV0
ID0gLTExMAo+ID4gICBGaXJtd2FyZSBpbml0IGZhaWxlZCBvbiBycHJvYyAoLTExMCkKPiA+IAo+
ID4gICByZXNldHRpbmcgLi4uCj4gPiAKPiA+IEkgdGVzdGVkIHdpdGggQU02MnggU0sgRVZNIEUz
LiBJJ2xsIHRyeSB0byBhcHBseSB5b3VyIHR3byBtaXNzaW5nCj4gPiBwYXRjaGVzIGFuZCB0ZXN0
IGFnYWluLgo+IAo+IEFyZSB5b3UgdXNpbmcgYSBib2FyZCB3aXRoIFBDQiByZXZpc2lvbiAnUFJP
QzExNEUzJz8gSWYgc28gdGhpcyBib2FyZCBpcwo+IGtub3duIGFzICdUaGlyZCBwcm90b3R5cGUs
IGVhcmx5IHJlbGVhc2UgcmV2aXNpb24gb2YgdGhlIEFNNjJ4IFNLIEVWTScKPiBhbmQgc2hvdWxk
IGhhdmUgR1Agc2lsaWNvbi4gV2hpY2ggbWVhbnMgeW91IG11c3QgaGF2ZSByZS1hZGRlZC4uLgo+
IAo+IEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX1RJQk9PVDNfQklOPSJ0aWJvb3QzLWFtNjJ4
LWdwLWV2bS5iaW4KPiAKPiAuLi50byB5b3VyIC5jb25maWc/CgpIaSwKClllcywgSSBoYXZlIGEg
UFJPQzExNEUzLgoKSSB0ZXN0ZWQgdGhlIHNhbWUgd2F5IEkgZGlkIFYxMCwgYnV0IG1pc3NlZAoK
ICBbUEFUQ0ggdjEyIDE2LzE2XSBwYWNrYWdlL3RpLWszOiBzd2l0Y2ggdGlfYW02ezIsIDR9eF9z
a19kZWZjb25maWcgdG8gSFMtRlMgYnkgZGVmYXVsdAoKd2hpY2ggd2FzIG5ldyBpbiBWMTEvMTIu
IEkgbm93IG1hbnVhbGx5IHNldCAKCiAgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfVElCT09U
M19CSU49InRpYm9vdDMtYW02MngtZ3AtZXZtLmJpbiIKCmFuZCBpdCdzIGJvb3RpbmcgZmluZS4g
VGhhbmsgeW91IQoKQWxzbyB0aGFua3MgZm9yIHRlc3Rpbmcgd2l0aCB0aGUgb3RoZXIgaGFyZHdh
cmUgcmV2aXNpb25zIQoKQmVzdCwKR2VybwoKPiAKPiBJIGRvbid0IGhhdmUgYSBQUk9DMTE0RTMg
Ym9hcmQgYnV0IHRoZSBib2FyZCBJIHVzZWQgdG8gdGVzdCB0aGUgR1AKPiB2YXJpYW50IHRvZGF5
IGlzIGEgUFJPQzExNEUyLCBhbmQgaXQgd29ya2VkLiBCdXQgbmVpdGhlciBvZiB0aG9zZSBib2Fy
ZHMKPiBpcyBjb25zaWRlcmVkICJwcm9kdWN0aW9uIi4KPiAKPiBBbHNvIGp1c3QgZm9yIHJlZmVy
bmNlLCBhbiBTSy1BTTYyIFBDQiByZXZpc2lvbiBoaXN0b3J5IGNhbiBiZSBmb3VuZCBpbgo+IFRh
YmxlIDEtMSBpbiB0aGUgQU02MnggU0sgRVZNIFVzZXIncyBHdWlkZSBbMV0uCj4gCj4gCj4gLS0K
PiBBbmRyZWFzIERhbm5lbmJlcmcKPiBUZXhhcyBJbnN0cnVtZW50cyBJbmMKPiAKPiAKPiBbMV0g
aHR0cHM6Ly93d3cudGkuY29tL2xpdC9wZGYvc3BydWo0MCAKPiAKPiAKPiAKPiAKPiA+IEJlc3Qs
Cj4gPiBHZXJvCj4gPiAKPiA+ID4gPiBCZXN0IHJlZ2FyZHMsCj4gPiA+ID4gUm9tYWluCj4gPiA+
ID4KPiA+IFsuLi5dCj4gPiAKPiA+IC0tIAo+ID4gCj4gPiAKPiA+IAo+ID4g4oCT4oCT4oCTCj4g
PiAKPiA+IAo+ID4gZ3JhbmRjZW50cml4IEdtYkggfCBBIFZvZGFmb25lIENvbXBhbnnCoMK3wqBI
b2x6bWFya3QgMcKgwrfCoDUwNjc2IAo+ID4gKkNvbG9nbmUqwqB8wqBQaG9lbml4c2Vlc3RyYXNz
ZSAxOMKgwrfCoDQ0MjYzICpEb3J0bXVuZCrCoMK3wqBHZXJtYW55Cj4gPiB8wqBpbiAKPiA+IDxo
dHRwczovL3d3dy5saW5rZWRpbi5jb20vY29tcGFueS9ncmFuZGNlbnRyaXg+IHwgcGhvbmU6ICs0
OS0yMjEtNjc3LTg2MC0wIAo+ID4gfMKgZW1haWw6IGhlbGxvQGdyYW5kY2VudHJpeC5uZXQgPG1h
aWx0bzpoZWxsb0BncmFuZGNlbnRyaXgubmV0Pgo+ID4gCj4gPiAKPiA+IGdyYW5kY2VudHJpeCBj
YXJlcyBhYm91dMKgcHJpdmFjeSAKPiA+IDxodHRwczovL2dyYW5kY2VudHJpeC5uZXQvZGUvcGFn
ZXMvcHJpdmFjeW1haWwvPgo+ID4gCj4gPiBBbXRzZ2VyaWNodCBLw7ZsbiB8IEhSQiDCoAo+ID4g
NzAxMTkgfCBHZXNjaMOkZnRzZsO8aHJlcjogTS4gS3LDtm1lcizCoCBSLiBIw6RuZWwgfCBVU3Qu
LUlkTnIuOiBERTI2NjMzMzk2OQo+ID4gCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290CgotLSAKCgoK4oCT4oCT4oCTCgoKZ3JhbmRjZW50cml4IEdtYkggfCBBIFZvZGFmb25l
IENvbXBhbnnCoMK3wqBIb2x6bWFya3QgMcKgwrfCoDUwNjc2IAoqQ29sb2duZSrCoHzCoFBob2Vu
aXhzZWVzdHJhc3NlIDE4wqDCt8KgNDQyNjMgKkRvcnRtdW5kKsKgwrfCoEdlcm1hbnkKfMKgaW4g
CjxodHRwczovL3d3dy5saW5rZWRpbi5jb20vY29tcGFueS9ncmFuZGNlbnRyaXg+IHwgcGhvbmU6
ICs0OS0yMjEtNjc3LTg2MC0wIAp8wqBlbWFpbDogaGVsbG9AZ3JhbmRjZW50cml4Lm5ldCA8bWFp
bHRvOmhlbGxvQGdyYW5kY2VudHJpeC5uZXQ+CgoKZ3JhbmRjZW50cml4IGNhcmVzIGFib3V0wqBw
cml2YWN5IAo8aHR0cHM6Ly9ncmFuZGNlbnRyaXgubmV0L2RlL3BhZ2VzL3ByaXZhY3ltYWlsLz4K
CkFtdHNnZXJpY2h0IEvDtmxuIHwgSFJCIMKgCjcwMTE5IHwgR2VzY2jDpGZ0c2bDvGhyZXI6IE0u
IEtyw7ZtZXIswqAgUi4gSMOkbmVsIHwgVVN0Li1JZE5yLjogREUyNjYzMzM5NjkKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
