Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B3CC43334
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 10:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 003C242438;
	Wed, 22 Jun 2022 10:29:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 003C242438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TeNiUzFW7fkr; Wed, 22 Jun 2022 10:29:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 817B042423;
	Wed, 22 Jun 2022 10:29:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 817B042423
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D823A1BF335
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 10:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0EF242423
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 10:29:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0EF242423
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1qGvttE0jLIV for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 10:29:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 555D44240E
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 555D44240E
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 10:29:17 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-101bb9275bcso16968119fac.8
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 03:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yoh4TOvQv1lu6Aai+jYfMhTqPHeZTY4J5kjUWMA8hqo=;
 b=CWVl4w92nC7v0hyRdCmmmoV3E//kM5WDArPwKyUvssA+/0YX/nzq95qs90r6RG6X0R
 jidG+LrwKX/waRzhdErDSSqznhHS/SQRBgU97u3+B0c7EGIXI/8n758sla7xLLliu+Ng
 nKZWfh1WIwKj6prBrW7awAFtxXwbBD4j3vC0D7vd/ai1Nbud+7mp40C+/2ZxhPnYG2SQ
 h+pSn2sxbXGW6kVoIhAKTEzZgoASFnh3P7ymvQNArrhIxnuQolCR9JTlPwTkLRJ1jt3Y
 OtFipVm0VD5ELnawq2C6TyRScnTS8/kNEkOPHE6jrZM4A4btcaUtmdYcstbzcu/6vLW+
 n9aw==
X-Gm-Message-State: AJIora8I6OpXYKMlieVpHFFNks1S/W11zfTWkPGh4X2APU3T5tqvrfnq
 S/NR1I1SwS01MeOjsKtaD3rzjB0DWlzL6UP4c91cGA==
X-Google-Smtp-Source: AGRyM1u4CoAAq6MALdKHhWcNleBkC1bf8Gsx4x3vuLb+fO7VRLzcZlZOPVQgaXhe8JRBt13EUFplDGMWejQfve+2sdA=
X-Received: by 2002:a05:6871:69e:b0:101:b7d2:7d0f with SMTP id
 l30-20020a056871069e00b00101b7d27d0fmr1571441oao.217.1655893756141; Wed, 22
 Jun 2022 03:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220622083433.1201789-1-kory.maincent@bootlin.com>
In-Reply-To: <20220622083433.1201789-1-kory.maincent@bootlin.com>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Wed, 22 Jun 2022 12:29:05 +0200
Message-ID: <CAN5uoS8OHpbtwOY8N0a0ECGO-7LU6VWA1v57ECTZBYNtnWWBXw@mail.gmail.com>
To: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yoh4TOvQv1lu6Aai+jYfMhTqPHeZTY4J5kjUWMA8hqo=;
 b=F8mtKdDEfT6uTqbAzENP51zuptHxwXMz0clVXEXxIL/chrhPAY8pjotrYclEL3p9/Q
 ieQ9YSrAIeHqiuJ8aYtKlvOWJPcQpJifSHy1DTLzEtF44XSER6Fmej4nvAGm1T/vZrw4
 r0gTu8lVC+cG5SEQXiJRyGhebGaUlSi0gpflmjy52VE1NbeWXYmeETOf9eLNC/Q27BxY
 dbaLcqbdaoaXmJ+Bjq15D6pK8hoRIdqY3DhLrSIIPXtleBu0Av1X4P+FtxkXY52ZK8DQ
 9ig6+VZx60ka2WgJsuUytgZDoekGt//Lc4BJjkFmeOSxMIbuDD+SOcuVqAZY9C4cTWzC
 BBdQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=F8mtKdDE
Subject: Re: [Buildroot] [PATCH v2] boot/optee-os: add support for custom
 tarball URL
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgS8O2cnksCgpPbiBXZWQsIDIyIEp1biAyMDIyIGF0IDEwOjM0LCA8a29yeS5tYWluY2VudEBi
b290bGluLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBLb3J5IE1haW5jZW50IDxrb3J5Lm1haW5jZW50
QGJvb3RsaW4uY29tPgo+Cj4gRm9yIG5vdyBvbmx5IGxhdGVzdCByZWxlYXNlIGFuZCBjdXN0b20g
Z2l0IHJlcG9zaXRvcnkgd2FzIHN1cHBvcnRlZC4KPiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9ydCBm
b3IgY3VzdG9tIHRhcmJhbGwgVVJMLgo+Cj4gSXQgYWxzbyBhZGRzIGNvbmZpZ3VyYXRpb24gdmVy
aWZpY2F0aW9uIGZvciBjdXN0b20gZ2l0IHJlcG9zaXRvcnkgYW5kCj4gdGFyYmFsbCBVUkwuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBLb3J5IE1haW5jZW50IDxrb3J5Lm1haW5jZW50QGJvb3RsaW4uY29t
Pgo+IC0tLQo+Cj4gQ2hhbmdlIHNpbmNlIHYxOgo+IC0gVXBkYXRlIHRoZSB0ZXN0IGNvbmRpdGlv
biBvbiBjdXN0b20gdGFyYmFsbCBzZWxlY3Rpb24uCj4gLSBSZW1ldmVkIGV4dHJhIGVuZGluZyBw
YXJlbnRoZXNlcy4KPgo+ICBib290L29wdGVlLW9zL0NvbmZpZy5pbiAgIHwgMTEgKysrKysrKysr
KysKPiAgYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5tayB8IDI1ICsrKysrKysrKysrKysrKysrKysr
KysrLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2Jvb3Qvb3B0ZWUtb3MvQ29uZmlnLmluIGIvYm9vdC9vcHRlZS1v
cy9Db25maWcuaW4KPiBpbmRleCAwYmU2ZTY4YjBjLi5kNTZjZjUzYzhhIDEwMDY0NAo+IC0tLSBh
L2Jvb3Qvb3B0ZWUtb3MvQ29uZmlnLmluCj4gKysrIGIvYm9vdC9vcHRlZS1vcy9Db25maWcuaW4K
PiBAQCAtMjUsNiArMjUsOSBAQCBjb25maWcgQlIyX1RBUkdFVF9PUFRFRV9PU19MQVRFU1QKPiAg
ICAgICAgICAgVXNlIHRoZSBsYXRlc3QgcmVsZWFzZSB0YWcgZnJvbSB0aGUgT1AtVEVFIE9TIG9m
ZmljaWFsIEdpdAo+ICAgICAgICAgICByZXBvc2l0b3J5Lgo+Cj4gK2NvbmZpZyBCUjJfVEFSR0VU
X09QVEVFX09TX0NVU1RPTV9UQVJCQUxMCj4gKyAgICAgICBib29sICJDdXN0b20gdGFyYmFsbCIK
PiArCj4gIGNvbmZpZyBCUjJfVEFSR0VUX09QVEVFX09TX0NVU1RPTV9HSVQKPiAgICAgICAgIGJv
b2wgIkN1c3RvbSBHaXQgcmVwb3NpdG9yeSIKPiAgICAgICAgIGhlbHAKPiBAQCAtMzIsNiArMzUs
MTMgQEAgY29uZmlnIEJSMl9UQVJHRVRfT1BURUVfT1NfQ1VTVE9NX0dJVAo+Cj4gIGVuZGNob2lj
ZQo+Cj4gK2lmIEJSMl9UQVJHRVRfT1BURUVfT1NfQ1VTVE9NX1RBUkJBTEwKPiArCj4gK2NvbmZp
ZyBCUjJfVEFSR0VUX09QVEVFX09TX0NVU1RPTV9UQVJCQUxMX0xPQ0FUSU9OCj4gKyAgICAgICBz
dHJpbmcgIlVSTCBvZiBjdXN0b20gT1AtVEVFIE9TIHRhcmJhbGwiCj4gKwo+ICtlbmRpZgo+ICsK
PiAgaWYgQlIyX1RBUkdFVF9PUFRFRV9PU19DVVNUT01fR0lUCj4KPiAgY29uZmlnIEJSMl9UQVJH
RVRfT1BURUVfT1NfQ1VTVE9NX1JFUE9fVVJMCj4gQEAgLTUzLDYgKzYzLDcgQEAgZW5kaWYKPiAg
Y29uZmlnIEJSMl9UQVJHRVRfT1BURUVfT1NfVkVSU0lPTgo+ICAgICAgICAgc3RyaW5nCj4gICAg
ICAgICBkZWZhdWx0ICIzLjE3LjAiICAgICAgICBpZiBCUjJfVEFSR0VUX09QVEVFX09TX0xBVEVT
VAo+ICsgICAgICAgZGVmYXVsdCAiY3VzdG9tIiAgICAgICAgaWYgQlIyX1RBUkdFVF9PUFRFRV9P
U19DVVNUT01fVEFSQkFMTAo+ICAgICAgICAgZGVmYXVsdCBCUjJfVEFSR0VUX09QVEVFX09TX0NV
U1RPTV9SRVBPX1ZFUlNJT04gXAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYg
QlIyX1RBUkdFVF9PUFRFRV9PU19DVVNUT01fR0lUCj4KPiBkaWZmIC0tZ2l0IGEvYm9vdC9vcHRl
ZS1vcy9vcHRlZS1vcy5tayBiL2Jvb3Qvb3B0ZWUtb3Mvb3B0ZWUtb3MubWsKPiBpbmRleCA4OGYx
NGI0OGU0Li5jZGRjMWYyNDQ4IDEwMDY0NAo+IC0tLSBhL2Jvb3Qvb3B0ZWUtb3Mvb3B0ZWUtb3Mu
bWsKPiArKysgYi9ib290L29wdGVlLW9zL29wdGVlLW9zLm1rCj4gQEAgLTEzLDE0ICsxMywyMiBA
QCBlbmRpZgo+ICBPUFRFRV9PU19JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPiAgT1BURUVfT1NfSU5T
VEFMTF9JTUFHRVMgPSBZRVMKPgo+IC1pZmVxICgkKEJSMl9UQVJHRVRfT1BURUVfT1NfQ1VTVE9N
X0dJVCkseSkKPiAraWZlcSAoJChCUjJfVEFSR0VUX09QVEVFX09TX0NVU1RPTV9UQVJCQUxMKSx5
KQo+ICsjIEhhbmRsZSBjdXN0b20gVS1Cb290IHRhcmJhbGxzIGFzIHNwZWNpZmllZCBieSB0aGUg
Y29uZmlndXJhdGlvbgo+ICtPUFRFRV9PU19UQVJCQUxMID0gJChjYWxsIHFzdHJpcCwkKEJSMl9U
QVJHRVRfT1BURUVfT1NfQ1VTVE9NX1RBUkJBTExfTE9DQVRJT04pKQo+ICtPUFRFRV9PU19TSVRF
ID0gJChwYXRzdWJzdCAlLywlLCQoZGlyICQoT1BURUVfT1NfVEFSQkFMTCkpKQo+ICtPUFRFRV9P
U19TT1VSQ0UgPSAkKG5vdGRpciAkKE9QVEVFX09TX1RBUkJBTEwpKQo+ICtlbHNlIGlmZXEgKCQo
QlIyX1RBUkdFVF9PUFRFRV9PU19DVVNUT01fR0lUKSx5KQo+ICBPUFRFRV9PU19TSVRFID0gJChj
YWxsIHFzdHJpcCwkKEJSMl9UQVJHRVRfT1BURUVfT1NfQ1VTVE9NX1JFUE9fVVJMKSkKPiAgT1BU
RUVfT1NfU0lURV9NRVRIT0QgPSBnaXQKPiAtQlJfTk9fQ0hFQ0tfSEFTSF9GT1IgKz0gJChPUFRF
RV9PU19TT1VSQ0UpCj4gIGVsc2UKPiAgT1BURUVfT1NfU0lURSA9ICQoY2FsbCBnaXRodWIsT1At
VEVFLG9wdGVlX29zLCQoT1BURUVfT1NfVkVSU0lPTikpCj4gIGVuZGlmCj4KPiAraWZlcSAoJChC
UjJfVEFSR0VUX09QVEVFX09TKSQoQlIyX1RBUkdFVF9PUFRFRV9PU19MQVRFU1RfVkVSU0lPTiks
eSkKPiArQlJfTk9fQ0hFQ0tfSEFTSF9GT1IgKz0gJChPUFRFRV9PU19TT1VSQ0UpCj4gK2VuZGlm
Cj4gKwo+ICBPUFRFRV9PU19ERVBFTkRFTkNJRVMgPSBob3N0LW9wZW5zc2wgaG9zdC1weXRob24z
IGhvc3QtcHl0aG9uLXB5ZWxmdG9vbHMKPgo+ICBpZmVxICgkKEJSMl9UQVJHRVRfT1BURUVfT1Nf
TkVFRFNfUFlUSE9OX0NSWVBUT0dSQVBIWSkseSkKPiBAQCAtMTMwLDYgKzEzOCwxOSBAQCBpZmVx
ICgkKEJSMl9UQVJHRVRfT1BURUVfT1MpJChCUl9CVUlMRElORykseXkpCj4gIGlmZXEgKCQoY2Fs
bCBxc3RyaXAsJChCUjJfVEFSR0VUX09QVEVFX09TX1BMQVRGT1JNKSksKQo+ICAkKGVycm9yIE5v
IE9QLVRFRSBPUyBwbGF0Zm9ybSBzZXQuIENoZWNrIHlvdXIgQlIyX1RBUkdFVF9PUFRFRV9PU19Q
TEFURk9STSBzZXR0aW5nKQo+ICBlbmRpZgo+ICsKPiAraWZlcSAoJChCUjJfVEFSR0VUX09QVEVF
X09TX0NVU1RPTV9UQVJCQUxMKSx5KQo+ICtpZmVxICgkKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdF
VF9PUFRFRV9PU19DVVNUT01fVEFSQkFMTF9MT0NBVElPTikpLCkKCkhlcmUgd2UgZXhwZWN0IGEg
dGFyYmFsbCBmaWxlIHBhdGguIFNpbmNlIHRoZSBjb25maWcgc3dpdGNoIGlzIGRlZmF1bHQKcG9w
dWxhdGVkIHdpdGggYSBzdHJpbmcsIEkgdGhpbmsgdGhpcyBzaG91bGQgdGVzdCBmaWxlIHByZXNl
bmNlIHJhdGhlcgp0aGFuIHN0cmluZyBleGlzdGVuY2U6CgppZmVxICgkKHdpbGRjYXJkICQoY2Fs
bApxc3RyaXAsJChCUjJfVEFSR0VUX09QVEVFX09TX0NVU1RPTV9UQVJCQUxMX0xPQ0FUSU9OKSkp
LCkKb3IgbW9yZSBzaW1wbHk6CmlmZXEgKCQod2lsZGNhcmQgJChPUFRFRV9PU19UQVJCQUxMKSks
KQoKQnIsCmV0aWVubmUKCj4gKyQoZXJyb3IgTm8gdGFyYmFsbCBsb2NhdGlvbiBzcGVjaWZpZWQu
IFBsZWFzZSBjaGVjayBCUjJfVEFSR0VUX09QVEVFX09TX0NVU1RPTV9UQVJCQUxMX0xPQ0FUSU9O
KQo+ICtlbmRpZgo+ICtlbmRpZgo+ICsKPiAraWZlcSAoJChCUjJfVEFSR0VUX09QVEVFX09TX0NV
U1RPTV9HSVQpLHkpCj4gK2lmZXEgKCQoY2FsbCBxc3RyaXAsJChCUjJfVEFSR0VUX09QVEVFX09T
X0NVU1RPTV9SRVBPX1VSTCkpLCkKPiArJChlcnJvciBObyByZXBvc2l0b3J5IHNwZWNpZmllZC4g
UGxlYXNlIGNoZWNrIEJSMl9UQVJHRVRfT1BURUVfT1NfQ1VTVE9NX1JFUE9fVVJMKQo+ICtlbmRp
Zgo+ICtlbmRpZgo+ICsKPiAgZW5kaWYgIyBCUjJfVEFSR0VUX09QVEVFX09TICYmIEJSMl9CVUlM
RElORwo+Cj4gICQoZXZhbCAkKGdlbmVyaWMtcGFja2FnZSkpCj4gLS0KPiAyLjI1LjEKPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
