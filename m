Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5791C433EF
	for <buildroot@archiver.kernel.org>; Fri, 29 Apr 2022 08:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EAA44098F;
	Fri, 29 Apr 2022 08:41:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jgE15rQBlU23; Fri, 29 Apr 2022 08:41:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1964140143;
	Fri, 29 Apr 2022 08:41:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 493451BF2A4
 for <buildroot@lists.busybox.net>; Fri, 29 Apr 2022 08:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3526741CB5
 for <buildroot@lists.busybox.net>; Fri, 29 Apr 2022 08:41:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tvc3V6V1JVmZ for <buildroot@lists.busybox.net>;
 Fri, 29 Apr 2022 08:41:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF06041CA7
 for <buildroot@buildroot.org>; Fri, 29 Apr 2022 08:41:11 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id r1so7682820oie.4
 for <buildroot@buildroot.org>; Fri, 29 Apr 2022 01:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wKtTMpBkxYhM9I6KUnLRUVChpiM6FI1g2Dz3/KwTUhI=;
 b=DiL2zllzmOMwXG236crn3TvVzcr5llsiv6rKFh1Yt6vKRs//AKx6RE9cUil37WrzaT
 3ZyojdztH+b2on4ZNC5FRaGeVxyhJPFywVKgv3CLzcBCVcUhcnf/76sQD+t3q3st8k4N
 2zsNp0+mFYVgvWPfD4SvZ0/xKVko4ETIBgbZHtdwhAD2jPyGGmh9ZK2R0W7MgPLjfybj
 9EMxZD+EcEgyHmJc1GrACsR/OUc5nOUGBWxSD8geGsOiGcmPzfkWh1vQ6I42u+OZwxFp
 vzb2kpZQw5q8x2yBs0nT3F0s3WS0CIdWAkeQI7aT8LzjKCyibsXGwdlgNjSrwtl/Pc+b
 OKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wKtTMpBkxYhM9I6KUnLRUVChpiM6FI1g2Dz3/KwTUhI=;
 b=rGwiTRNg8mYfRoIiX5S2aLS7GMtDv64b/iRU5+cGjmrZ9Gg9/Z+SM1F8TMiwz32ucT
 pLJs76mhAR8NeyViRPsaGoMPAepoCrCwJ0CeVIBVXN4f04f2YAkgJgnCWVFwWmKLGC8u
 jt0iEvHEzejQCXRUT6sHnDj1/ICT1gKH/NNRaofnDYzkW8yXYCKcQAVZ4L3PFlidPlBL
 gAeHecuxbuHoJKcdqym1kZanDlCrvt/ZoVaxK5i2drHU9TMikyoOaS9RZfL6Du3PgqAE
 G6rzTgXIGFA8JhQV2RFAxajOvcfYD0LwrsEN4fILKFxmm7IheaSRq9K71I0TaWt4QE3t
 WtvA==
X-Gm-Message-State: AOAM533HXrbTnuP3YzEuokvlhpPCU6Qr9PFNOqQLcWwFfuxwiokWtZLH
 20qkLAs+6YU6EMpjyHWEYytHtchAEjjsG7KiMXXCSOJ3gsiFSg==
X-Google-Smtp-Source: ABdhPJxhir7Wh2omeS/nqa14sxJkZoAHr9dN52vrBriTBUBjPdLh+HuTHgvCHlfC4cSRp3+noPU9zJNGh+MCwYl0yvw=
X-Received: by 2002:a05:6808:1886:b0:322:f55c:133d with SMTP id
 bi6-20020a056808188600b00322f55c133dmr951611oib.217.1651221670640; Fri, 29
 Apr 2022 01:41:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220427094608.16698-1-etienne.carriere@linaro.org>
 <af12efc9-608b-74e6-46a7-6ea242c7d88f@mind.be>
In-Reply-To: <af12efc9-608b-74e6-46a7-6ea242c7d88f@mind.be>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 29 Apr 2022 10:41:00 +0200
Message-ID: <CAN5uoS8H_BnMWvAtAJfqDa645oHFaprW3LnU7dgbNCGu_Ts_=w@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/5] boot/optee-os: bump to version 3.17.0
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
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQXJub3V0LAoKQnkgdGhlIHdheSwgcGVvcGxlIGhhdmUgZmFjZWQgaXNzdWVzIGJ1aWxk
IE9QLVRFRSB3aXRoIHJlY2VudCBPcGVuU1NMCnZlcnNpb24gMy4wIChpIHRoaW5rKS4gVGhlcmUg
c2VlbXMgYSBwYXRoIG5lZWRzIHRvIGJlIHByb3ZpZGVkIGR1ZSB0bwpBUEkgY2hhbmdlcyBiZXR3
ZWVuIDIueCBhbmQgMy54LgojIGV4cG9ydCBPUEVOU1NMX01PRFVMRVM9L3BhdGgvdG8vc2RrL3Vz
ci9saWIvb3NzLW1vZHVsZXMKCk1heWJlIHJlbGF0ZWQgdG8gYW4gaXNzdWUgc2VlbSBpbiBhIHUt
Ym9vdCwgZWxzZXdoZXJlOgpodHRwczovL2dpdGh1Yi5jb20vcHljYS9jcnlwdG9ncmFwaHkvaXNz
dWVzLzY4OTUKCkRpZCBvbmUgZmFjZSBzdWNoIGlzc3VlcyB3aXRoIE9wZW5TU0wgMy4wPwoKQmVz
dCByZWdhcmRzLApFdGllbm5lCgpPbiBXZWQsIDI3IEFwciAyMDIyIGF0IDIxOjQwLCBBcm5vdXQg
VmFuZGVjYXBwZWxsZSA8YXJub3V0QG1pbmQuYmU+IHdyb3RlOgo+Cj4KPgo+IE9uIDI3LzA0LzIw
MjIgMTE6NDUsIEV0aWVubmUgQ2FycmllcmUgd3JvdGU6Cj4gPiBCdW1wIE9QLVRFRSBPUyBwYWNr
YWdlIHZlcnNpb24gdG8gT1AtVEVFIHJlbGVhc2UgMy4xNy4wLgo+ID4KPiA+IENjOiBDbMOpbWVu
dCBMw6lnZXIgPGNsZW1lbnQubGVnZXJAYm9vdGxpbi5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBF
dGllbm5lIENhcnJpZXJlIDxldGllbm5lLmNhcnJpZXJlQGxpbmFyby5vcmc+Cj4KPiAgIEFwcGxp
ZWQgc2VyaWVzIHRvIG1hc3RlciwgdGhhbmtzLgo+Cj4gICBSZWdhcmRzLAo+ICAgQXJub3V0Cj4K
PiA+IC0tLQo+ID4gICBib290L29wdGVlLW9zL0NvbmZpZy5pbiAgICAgfCA0ICsrLS0KPiA+ICAg
Ym9vdC9vcHRlZS1vcy9vcHRlZS1vcy5oYXNoIHwgNCArKy0tCj4gPiAgIDIgZmlsZXMgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9i
b290L29wdGVlLW9zL0NvbmZpZy5pbiBiL2Jvb3Qvb3B0ZWUtb3MvQ29uZmlnLmluCj4gPiBpbmRl
eCAzMGI2ZjYyNDM0Li5mYjhhMTg5YTc1IDEwMDY0NAo+ID4gLS0tIGEvYm9vdC9vcHRlZS1vcy9D
b25maWcuaW4KPiA+ICsrKyBiL2Jvb3Qvb3B0ZWUtb3MvQ29uZmlnLmluCj4gPiBAQCAtMTgsNyAr
MTgsNyBAQCBjaG9pY2UKPiA+ICAgICAgICAgU2VsZWN0IHRoZSB2ZXJzaW9uIG9mIE9QLVRFRSBP
UyB5b3Ugd2FudCB0byB1c2UKPiA+Cj4gPiAgIGNvbmZpZyBCUjJfVEFSR0VUX09QVEVFX09TX0xB
VEVTVAo+ID4gLSAgICAgYm9vbCAiMy4xNi4wIgo+ID4gKyAgICAgYm9vbCAiMy4xNy4wIgo+ID4g
ICAgICAgZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9IT1NUX1JVU1RDX0FSQ0hfU1VQUE9SVFMKPiA+
ICAgICAgIHNlbGVjdCBCUjJfVEFSR0VUX09QVEVFX09TX05FRURTX1BZVEhPTl9DUllQVE9HUkFQ
SFkKPiA+ICAgICAgIGhlbHAKPiA+IEBAIC01Miw3ICs1Miw3IEBAIGVuZGlmCj4gPgo+ID4gICBj
b25maWcgQlIyX1RBUkdFVF9PUFRFRV9PU19WRVJTSU9OCj4gPiAgICAgICBzdHJpbmcKPiA+IC0g
ICAgIGRlZmF1bHQgIjMuMTYuMCIgICAgICAgIGlmIEJSMl9UQVJHRVRfT1BURUVfT1NfTEFURVNU
Cj4gPiArICAgICBkZWZhdWx0ICIzLjE3LjAiICAgICAgICBpZiBCUjJfVEFSR0VUX09QVEVFX09T
X0xBVEVTVAo+ID4gICAgICAgZGVmYXVsdCBCUjJfVEFSR0VUX09QVEVFX09TX0NVU1RPTV9SRVBP
X1ZFUlNJT04gXAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgQlIyX1RBUkdF
VF9PUFRFRV9PU19DVVNUT01fR0lUCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2Jvb3Qvb3B0ZWUtb3Mv
b3B0ZWUtb3MuaGFzaCBiL2Jvb3Qvb3B0ZWUtb3Mvb3B0ZWUtb3MuaGFzaAo+ID4gaW5kZXggZDNh
MjYzN2E0ZS4uNWMxMDQ3YmFjMyAxMDA2NDQKPiA+IC0tLSBhL2Jvb3Qvb3B0ZWUtb3Mvb3B0ZWUt
b3MuaGFzaAo+ID4gKysrIGIvYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5oYXNoCj4gPiBAQCAtMSw0
ICsxLDQgQEAKPiA+IC0jIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL09QLVRFRS9vcHRlZV9vcy9h
cmNoaXZlLzMuMTYuMC9vcHRlZS1vcy0zLjE2LjAudGFyLmd6Cj4gPiAtc2hhMjU2ICBlYmM4ZTE4
YWQyMDM5ZWU5N2MzNGY3NGE3NTQ2ZGU5MTE5ZTI2ZjA0YzM2OGI2YzdmZDBjNTVmOTNkMzNkMmQ2
ICBvcHRlZS1vcy0zLjE2LjAudGFyLmd6Cj4gPiArIyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9P
UC1URUUvb3B0ZWVfb3MvYXJjaGl2ZS8zLjE3LjAvb3B0ZWUtb3MtMy4xNi4wLnRhci5nego+ID4g
K3NoYTI1NiAgNWQ1YTNiZGE4M2FiZGRmZWI1ZWU3NjVhMTU1MjVmMjNhZGYyNzA5YmEyNDc1YTA1
ZTBjNWYyNTc5MGMxODgzZiAgb3B0ZWUtb3MtMy4xNy4wLnRhci5nego+ID4gICAjIExvY2FsbHkg
Y29tcHV0ZWQKPiA+ICAgc2hhMjU2ICAxMjQ3ZWU5MDg1OGY0MDM3YjZjYWM2M2NiZmZkZGZlZDQz
NWQwZDczYzYzMWIzN2Q3OGMxZTZlNmFiM2U1ZDFhICBMSUNFTlNFCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
