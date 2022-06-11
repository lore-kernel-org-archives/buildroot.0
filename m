Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB82C43334
	for <buildroot@archiver.kernel.org>; Sat, 11 Jun 2022 20:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A239141B5E;
	Sat, 11 Jun 2022 20:41:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cvDafFv7gs0i; Sat, 11 Jun 2022 20:41:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DC9941960;
	Sat, 11 Jun 2022 20:41:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 949A01BF5DF
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 20:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 753D041960
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 20:41:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rB7qfkS8uM7C for <buildroot@lists.busybox.net>;
 Sat, 11 Jun 2022 20:41:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3868741959
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 20:41:26 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-100eb6f7782so3593694fac.2
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 13:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mob7WDks9yJ+kaDwDUPZTyNIPyO59HzWq8eTNwkgZ9Q=;
 b=ADFz7JHJjmykxZ5X6ld5kaQYEJUeZmXkI8qg1fEihecU+0jZSY25hx5TOYCJ01aeIQ
 bkZ3c++CSt8d/ILCXmysAr1DpIrwxWhh6foTyhD7lNDYr0WZccL0UVKDYNnQWTt/L+Pw
 WTkwTwpNk8gxPT3pJjMmnCVvukzsW0h6iBDj2RdKTl6g+OhbVJJwVCjyukqGWjotUg1V
 4Mqr7WTrmPBFu6/FZ/t5k8VMU3v5Io6VCxLIuavTsFPxVDIO4spH0djCRB+OpMDI4ISH
 Gm/v2uUPx7epmjAm723B8XlIpyKJP4fT+feC21fO1T2l65aGpPOLLm28BmLJ63AU0JF4
 IUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mob7WDks9yJ+kaDwDUPZTyNIPyO59HzWq8eTNwkgZ9Q=;
 b=nyFzTz235WhCoQhskGQYSnWCxN6vm7DVnLw/QOgDFyJ/N4ONIm436jYGEH9Le4kOEY
 hyw/30sklXg4iBWuDPdUNXJMJiAzg8kSg8FcukZGRNAeRXnxu3mA8NklP4hpfCnyqp3c
 0i+BO+gleXhL2D4oMByEJhUNsoiD6fcM+fF4HN8sl3P5/lsuz8U0DvlCJa854Cv4iyKA
 KkhNFJgCL+u4NFmj7bdvw6atmDWa6arWdnk09HWKk+fzNWcP/iGFbOxZY5CO4don9Iw/
 lIxqCsMnWUTHqz8mFthH33w7YW7qPK15WcjYVnmy5NAqa1h+WXJPmyDrLes7z3iNl8cK
 K7xA==
X-Gm-Message-State: AOAM5332E4zn/g10D3ZB5FBx2vg9pY7NpNb3Gp1Rb6+uTgUM7agovZg/
 KF+fcBdepjiGdUCL743jrQIU2UYvbiGRPIEom28KGlCw2rc=
X-Google-Smtp-Source: ABdhPJz2z0sFbOmoy9EeCrkeTOwX38+YsXY1mT5iMlKdsfBHNJ62FFgtc96od9+i19jTNn2LukDsG15JRNmLU8fZoZ4=
X-Received: by 2002:a05:6870:d210:b0:f5:dcdf:53da with SMTP id
 g16-20020a056870d21000b000f5dcdf53damr3361457oac.228.1654980084874; Sat, 11
 Jun 2022 13:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220611143544.844613-1-fontaine.fabrice@gmail.com>
 <20220611143544.844613-2-fontaine.fabrice@gmail.com>
 <df8cd05af52ef475efc5f6ad26b4e340@tpm.dev>
In-Reply-To: <df8cd05af52ef475efc5f6ad26b4e340@tpm.dev>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 11 Jun 2022 22:38:42 +0200
Message-ID: <CAPi7W81ydL4GF9YT4fndgthxFnhQ17yXCAugF=gqQDJ-UxYnNA@mail.gmail.com>
To: Dimi Tomov <dimi@tpm.dev>
Subject: Re: [Buildroot] [PATCH 2/2] package/wolftpm: drop
 WOLFTPM_CPE_ID_VENDOR
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

TGUgc2FtLiAxMSBqdWluIDIwMjIgw6AgMjI6MjQsIERpbWkgVG9tb3YgPGRpbWlAdHBtLmRldj4g
YSDDqWNyaXQgOgo+Cj4gd29sZnNzbFsxXSBhbmQgd29sZlRQTVsyXSBhcmUgb3Blbi1zb3VyY2Ug
cHJvZHVjdHMgb2YgdGhlIHNhbWUgY29tcGFueSwKPiB3b2xmU1NMIEluYy4gWzNdCj4KPiBUaGVy
ZWZvcmUsIHRoZSB3b2xmc3NsIGFuZCB3b2xmdHBtIHBhY2thZ2Ugc2hhcmUgdGhlIHNhbWUKPiBX
T0xGVFBNX0NQRV9JRF9WRU5ET1IuCj4KPiBJbiBjYXNlIHRoYXQgdGhlIENQRV9JRF9WRU5ET1Ig
aXMgaW5jb3JyZWN0IHRoZW4gdGhpcyBpcyB0cnVlIGFsc28gZm9yCj4gdGhlIHdvbGZzc2wgcGFj
a2FnZSB3aGVyZSB0aGUgdmFsdWUgb3JpZ2luYXRlZC4KCndvbGZzc2wncyBDUEUgSUQgaXMgY29y
cmVjdCBhcyBpdCBpcyByZWdpc3RlcmVkIGluIHRoZSBOVkQgTklTVCBkYXRhYmFzZSBbMV0uCgpI
b3dldmVyLCB3b2xmdHBtIHByb2R1Y3QgaGFzIG5vdCBiZWVuIHJlZ2lzdGVyZWQgdG8gdGhlIE5W
RCBOSVNUCmRhdGFiYXNlIChwcmVzdW1hYmx5IGJlY2F1c2Ugbm8gQ1ZFcyB3ZXJlIGZvdW5kIHll
dCBpbiB3b2xmdHBtKS4KU28sIHRoaXMgcGF0Y2ggaXMgY29ycmVjdC4KSWYgeW91IHdhbnQgdG8g
cHV0IGJhY2sgV09MRlRQTV9DUEVfSURfVkVORE9SLCBJIHdvdWxkIGFkdmlzZSB0byBmaXJzdApz
ZW5kIGFuIGVtYWlsIHRvIGNwZV9kaWN0aW9uYXJ5QG5pc3QuZ292IFsyXSB0byByZWdpc3RlciB3
b2xmdHBtCnByb2R1Y3QuCgpbMV0gaHR0cHM6Ly9udmQubmlzdC5nb3YvcHJvZHVjdHMvY3BlL3Nl
YXJjaC9yZXN1bHRzP25hbWluZ0Zvcm1hdD0yLjMma2V5d29yZD1jcGUlM0EyLjMlM0FhJTNBd29s
ZnNzbCUzQXdvbGZzc2wKWzJdIGh0dHBzOi8vbnZkLm5pc3QuZ292L3Byb2R1Y3RzL2NwZQo+Cj4g
VGhhbmsgeW91IGZvciBicmluZ2luZyB0aGlzIHRvcGljIHVwIGZvciBkaXNjdXNzaW9uLgo+Cj4g
WzFdIGh0dHBzOi8vd3d3LndvbGZzc2wuY29tL3Byb2R1Y3RzL3dvbGZzc2wvCj4gWzJdIGh0dHBz
Oi8vd3d3LndvbGZzc2wuY29tL3Byb2R1Y3RzL3dvbGZ0cG0vCj4gWzNdIGh0dHBzOi8vd3d3Lndv
bGZzc2wuY29tLwo+Cj4gUmVnYXJkcywKPiBEaW1pCj4gLS0KPiBGb3VuZGVyIG9mIFRQTS5kZXYK
Pgo+IE9uIDIwMjItMDYtMTEgMDU6MzUgUE0sIEZhYnJpY2UgRm9udGFpbmUgd3JvdGU6Cj4gPiBj
cGU6Mi4zOmE6d29sZnNzbDp3b2xmdHBtIGhhcyBuZXZlciBiZWVuIGEgdmFsaWQgQ1BFIGlkZW50
aWZpZXIgZm9yCj4gPiB0aGlzCj4gPiBwYWNrYWdlOgo+ID4KPiA+Cj4gPiBodHRwczovL252ZC5u
aXN0Lmdvdi9wcm9kdWN0cy9jcGUvc2VhcmNoL3Jlc3VsdHM/bmFtaW5nRm9ybWF0PTIuMyZrZXl3
b3JkPWNwZSUzQTIuMyUzQWElM0F3b2xmc3NsJTNBd29sZnRwbQo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ID4gLS0t
Cj4gPiAgcGFja2FnZS93b2xmdHBtL3dvbGZ0cG0ubWsgfCAxIC0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dvbGZ0cG0vd29s
ZnRwbS5tayBiL3BhY2thZ2Uvd29sZnRwbS93b2xmdHBtLm1rCj4gPiBpbmRleCBmMGNmMGRmMGQz
Li4wNDJjY2QyMmUxIDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS93b2xmdHBtL3dvbGZ0cG0ubWsK
PiA+ICsrKyBiL3BhY2thZ2Uvd29sZnRwbS93b2xmdHBtLm1rCj4gPiBAQCAtOSw3ICs5LDYgQEAg
V09MRlRQTV9TSVRFID0gJChjYWxsCj4gPiBnaXRodWIsd29sZlNTTCx3b2xmVFBNLHYkKFdPTEZU
UE1fVkVSU0lPTikpCj4gPiAgV09MRlRQTV9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPiA+ICBXT0xG
VFBNX0xJQ0VOU0UgPSBHUEwtMi4wKwo+ID4gIFdPTEZUUE1fTElDRU5TRV9GSUxFUyA9IExJQ0VO
U0UKPiA+IC1XT0xGVFBNX0NQRV9JRF9WRU5ET1IgPSB3b2xmc3NsCj4gPiAgV09MRlRQTV9DT05G
SUdfU0NSSVBUUyA9IHdvbGZ0cG0tY29uZmlnCj4gPgo+ID4gICMgd29sZlRQTSdzIHNvdXJjZSBj
b2RlIGlzIHJlbGVhc2VkIHdpdGhvdXQgYSBjb25maWd1cmUgc2NyaXB0LApCZXN0IFJlZ2FyZHMs
CgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
