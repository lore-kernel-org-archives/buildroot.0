Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51A3C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70EA6831A2;
	Tue,  6 Feb 2024 17:59:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rSLGzpkEEcKd; Tue,  6 Feb 2024 17:59:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 738AE83196
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 738AE83196;
	Tue,  6 Feb 2024 17:59:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F43B1BF27C
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6C3E41696
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:59:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6C3E41696
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UWNSLXJThjQp for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:59:14 +0000 (UTC)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75E2540A39
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:59:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75E2540A39
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5114cd44fdbso5141376e87.2
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 09:59:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707242352; x=1707847152;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iPZnSmijU+THnDIs+5dF1nap2aq7k4yxxLXZuZjntqw=;
 b=fGpdngOAh/lgKQmLIhSUh5anptkHqcufJrINJOWBZrgR3c/SIvytxfXr4BuwDUAtwe
 VpOvk+290isbD83MFYjrI9d3Kr6pGGWS8Kv6kgHQeoplQonBKz5BvfZONNkPcbBdCsnN
 MflpKZzQWs2rIxiRUSI8cdgTF+C1I2wyNw5UTgL1CD4T+MCiSKyx7GKNg+enwnGIs5N8
 sv5i0tnZtGQo0a4OhyPKaUpeyFLz2Wp0h0Tp98OnpnH0K7UOP57ZewqaAhvLfXm75UXT
 7cSFX1BeuB0M+XJmRdwpNBR1YmVIFVE0EwsJDw8uVIkLte36dhNFr9QfNZBhf1R+q5WV
 tmxw==
X-Gm-Message-State: AOJu0YxVfQu16EwTa2Df+aqwqfIwVmi2KWnN7FCDRAx2I//ydwh2G7Cx
 0apSLrhhxr/U/Mxb0/RHwXGchkiD3XT+yjviUwhmX9wdtHNyOSuL1A3WdZoHZxvG04TmjT1kz/W
 0HrS2m8PE6SYlGk4rwv7rqAVY9poEqP6ag+3uXg==
X-Google-Smtp-Source: AGHT+IH4Mpa43djDutnNBi+BxmgVmiXnFMxgqucw9x0AyszW+JtYaO01iBiZCE3F6jpqLzY3eGFLYR2B9ZwoF/slX4E=
X-Received: by 2002:a19:8c46:0:b0:50e:b2cf:4e20 with SMTP id
 i6-20020a198c46000000b0050eb2cf4e20mr2334599lfj.24.1707242352028; Tue, 06 Feb
 2024 09:59:12 -0800 (PST)
MIME-Version: 1.0
References: <20240106101202.495801-1-fontaine.fabrice@gmail.com>
 <2be6d0df-6165-4da9-b69c-ad0deb5444be@smile.fr>
In-Reply-To: <2be6d0df-6165-4da9-b69c-ad0deb5444be@smile.fr>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 6 Feb 2024 18:59:00 +0100
Message-ID: <CAPi7W81fffV_0zMh50hgB7bw7++JZzkdSpFUXXbHMPMKmHtbQw@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707242352; x=1707847152; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iPZnSmijU+THnDIs+5dF1nap2aq7k4yxxLXZuZjntqw=;
 b=QTDXfOvoX8XpdWHPFj8KPPMvdSvN/ExAiW/pNYao6XlWRvp+b8jPNyhaPXDTzQJOUA
 33vKti55kcO6oeYm1gPbYA/0ECC0uQMvA92NeIMqQ+91AeHsH+93/BYMbnBHfHc4nGg0
 ezHjkLODikKUj25ZEh7Dgk+h0j2nporT+8B/Dqam+G8lFJ62/0ario8s1ElFDHwvUL1+
 uCLaHSY4mTh49N7JBZ18qT+z210+Yb1omeG6pjFjFtSOgOSWTFQVjJYlH4R/pIU2lRG2
 WDn/5Iu6SUi/FnNz81KhVdgzh0Kez1hMZ6jj4Koi3H5UK7Rg8c9Y9VxCPykFSNIT5T+O
 VNoQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QTDXfOvo
Subject: Re: [Buildroot] [PATCH 1/1] package/ncmpc: don't set NLS
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUm9tYWluLAoKTGUgbWFyLiA2IGbDqXZyLiAyMDI0IMOgIDE4OjMyLCBSb21haW4gTmFv
dXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4gYSDDqWNyaXQgOgo+Cj4gSGVsbG8sCj4KPiBMZSAw
Ni8wMS8yMDI0IMOgIDExOjEyLCBGYWJyaWNlIEZvbnRhaW5lIGEgw6ljcml0IDoKPiA+IG5jbXBj
IGlzIGFibGUgdG8gYXV0b21hdGljYWxseSBkZXRlY3QgTkxTIHN1cHBvcnQgc2luY2UgdmVyc2lv
biAwLjQ3IGFuZAo+ID4gaHR0cHM6Ly9naXRodWIuY29tL011c2ljUGxheWVyRGFlbW9uL25jbXBj
L2NvbW1pdC9jMjY0ZGIwNGRkMzBhZjMwMWU3ZDg1YzlkMTQ1YmIxZjFhZTNmZWEzCj4gPiBzbyBs
ZXQgaXQgaGFuZGxlIGF1dG9tYXRpY2FsbHkgdG8gYXZvaWQgdGhlIGZvbGxvd2luZyBidWlsZCBm
YWlsdXJlIHdpdGgKPiA+IGEgYm9vdGxpbiB0b29sY2hhaW4gd2hpY2ggZW1iZWRzIGEgZ2V0dGV4
dCBkZWZpbml0aW9uIGluIGxpYmludGwuaCB3aGljaAo+ID4gd2lsbCBjbGFzaCB3aXRoIHRoZSBm
YWtlIGdldHRleHQgZGVmaW5pdGlvbiBwcm92aWRlZCBieSBuY21wYyBzaW5jZQo+ID4gaHR0cHM6
Ly9naXRodWIuY29tL011c2ljUGxheWVyRGFlbW9uL25jbXBjL2NvbW1pdC85NWFmMjdhYjJkM2Nl
YjlkZjI2ZWJiNGUwZDkzNmUzOTJhODRjMTUzOgo+ID4KPiA+IEluIGZpbGUgaW5jbHVkZWQgZnJv
bSAuLi9zcmMvc2F2ZV9wbGF5bGlzdC5jeHg6ODoKPiA+IC9ob21lL2J1aWxkcm9vdC9hdXRvYnVp
bGQvaW5zdGFuY2UtMi9vdXRwdXQtMS9ob3N0L29yMWstYnVpbGRyb290LWxpbnV4LWdudS9zeXNy
b290L3Vzci9pbmNsdWRlL2xpYmludGwuaDozOToxNDogZXJyb3I6IGV4cGVjdGVkIHVucXVhbGlm
aWVkLWlkIGJlZm9yZSAnY29uc3QnCj4gPiAgICAzOSB8IGV4dGVybiBjaGFyICpnZXR0ZXh0IChj
b25zdCBjaGFyICpfX21zZ2lkKQo+ID4gICAgICAgfCAgICAgICAgICAgICAgXn5+fn5+fgo+ID4g
L2hvbWUvYnVpbGRyb290L2F1dG9idWlsZC9pbnN0YW5jZS0yL291dHB1dC0xL2hvc3Qvb3Ixay1i
dWlsZHJvb3QtbGludXgtZ251L3N5c3Jvb3QvdXNyL2luY2x1ZGUvbGliaW50bC5oOjM5OjE0OiBl
cnJvcjogZXhwZWN0ZWQgJyknIGJlZm9yZSAnY29uc3QnCj4gPiAuLi9zcmMvaTE4bi5oOjIyOjIw
OiBub3RlOiB0byBtYXRjaCB0aGlzICcoJwo+ID4gICAgMjIgfCAjZGVmaW5lIGdldHRleHQoeCkg
KHgpCj4gPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICBeCj4gPgo+ID4gSW5kZWVkLCBldmVu
IGlmIE5MUyBpcyBkaXNhYmxlZCBieSB0aGUgdXNlciwgbGliaW50bC5oIHdpbGwgYmUgaW5jbHVk
ZWQKPiA+IGJ5Cj4gPiAvaG9tZS9mYWJyaWNlL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9vcHQvZXh0
LXRvb2xjaGFpbi9vcjFrLWJ1aWxkcm9vdC1saW51eC1nbnUvaW5jbHVkZS9jKysvMTMuMi4wL29y
MWstYnVpbGRyb290LWxpbnV4LWdudS9iaXRzL21lc3NhZ2VzX21lbWJlcnMuaAo+ID4gdGhvdWdo
IGluY2x1ZGUgPGNocm9ubz4KPgo+IFdlIHVzdWFsbHkgd2FudCB0byBleHBsaWNpdGx5IGhhbmRs
ZSBzdWNoIG9wdGlvbiBmcm9tIEJ1aWxkcm9vdCBwYWNrYWdlIHRvIG5vdAo+IHJlbHkgb24gYXV0
b21hdGljIGRldGVjdGlvbiAoYXMgY3VycmVudGx5IGRvbmUpLgo+Cj4gSXQgbG9vayBsaWtlIG1v
cmUgYSBidWcgaW4gbmNtcGMgYnVpbGQgc3lzdGVtPwoKSSBkb24ndCBrbm93LCB1cHN0cmVhbSB3
YW50cyB0byBoYXZlIHRoZSBzYW1lIGNvZGUgd2l0aCBhbmQgd2l0aG91dApOTFMsIHNvIHRoZXkg
ZGVjaWRlZCB0byBkZWZpbmUgYSBnZXR0ZXh0IG1hY3JvIHdoZW4gTkxTIGlzIGRpc2FibGVkLgpJ
IGNvdWxkIGZpbmQgYW4gdXBzdHJlYW1hYmxlIHNvbHV0aW9uIGFzIHVwc3RyZWFtIHdpbGwgcHJv
YmFibHkgcmVqZWN0CmEgcGF0Y2ggdGhhdCByZW1vdmVzIHRoaXMgZ2V0dGV4dCBkZWZpbmUgYW5k
IHB1dHMgI2lmZGVmIEVOQUJMRV9OTFMKYmVmb3JlIGV2ZXJ5IGdldHRleHQgY2FsbHMuCkRvIHlv
dSBoYXZlIGFuIHVwc3RyZWFtYWJsZSBzb2x1dGlvbiBvciBzaG91bGQgd2UganVzdCBhZGQgYSBO
TFMKZGVwZW5kZW5jeSB0byBuY21wYz8KCj4KPiBCZXN0IHJlZ2FyZHMsCj4gUm9tYWluCj4KPgo+
ID4KPiA+IEZpeGVzOgo+ID4gIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3Vs
dHMvYzg2MGU2NDkwOWRkM2I3ZmEwMzNkYjA5NzBlMWNmYzEzNzZjNGVjNQo+ID4gIC0gaHR0cDov
L2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvMzZlYWI1NTZmYWM4MDEyNDc1NWJmZjQx
MTBhZjNlNDNmZTZlZGQ3OAo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUg
PGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgcGFja2FnZS9uY21wYy9u
Y21wYy5tayB8IDMgKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRl
bGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL25jbXBjL25jbXBjLm1rIGIv
cGFja2FnZS9uY21wYy9uY21wYy5tawo+ID4gaW5kZXggYmM4YTYyZGFlYS4uMDk2NTk4MWYyMyAx
MDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvbmNtcGMvbmNtcGMubWsKPiA+ICsrKyBiL3BhY2thZ2Uv
bmNtcGMvbmNtcGMubWsKPiA+IEBAIC0yMCw4ICsyMCw3IEBAIE5DTVBDX0NQRV9JRF9WRU5ET1Ig
PSBuY21wY19wcm9qZWN0Cj4gPgo+ID4gIE5DTVBDX0NPTkZfT1BUUyA9IFwKPiA+ICAgICAgIC1E
Y3Vyc2VzPW5jdXJzZXMgXAo+ID4gLSAgICAgLURkb2N1bWVudGF0aW9uPWRpc2FibGVkIFwKPiA+
IC0gICAgICQoaWYgJChCUjJfU1lTVEVNX0VOQUJMRV9OTFMpLC1EbmxzPWVuYWJsZWQsLURubHM9
ZGlzYWJsZWQpCj4gPiArICAgICAtRGRvY3VtZW50YXRpb249ZGlzYWJsZWQKPiA+Cj4gPiAgaWZl
cSAoJChCUjJfUEFDS0FHRV9MSVJDX1RPT0xTKSx5KQo+ID4gIE5DTVBDX0RFUEVOREVOQ0lFUyAr
PSBsaXJjLXRvb2xzCj4KCkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
