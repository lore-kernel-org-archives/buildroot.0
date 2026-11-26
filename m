Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC10606A31C
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 19:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mqzO77lU;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=SFXi9dzX
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C5BC409FC;
	Thu, 26 Nov 2026 19:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rF94_sjBpHAt; Thu, 26 Nov 2026 19:23:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 92AED409E9
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795721035;
	b=QD/RZl84KPkg7+GjUgZgbHFjbYABFYbH1fRY3lyr+o+7GiaJOQITEvPtCICNMHup9WxI
	 IdI7ICqcpjaOTVXGk7bPJHisPlfnIt1Pl50ZiJ+LOA+CCG5A+Wgual+3YVhkTP/YLomYc
	 SiS7kLh6i3zQvXygQCXAGQAiATloXbHuBewMQxB+oPA0N+JtHiNt8ZGnLTrip8rhltQL1
	 AJb9FodMw+DCFZMaul50sGm5Yh0HW8AWoHmAPcUtC3gQRUhfTfeMBwWzr9Wx7ReQOZiFj
	 u6bwXm6swuGNwLxaRM8VJrC8KDBP3gXMKQRPS42u5rT1u5qZI6JFr7uYAA+ha3L9JjQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795721035;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ECB+f9UBJtBOr+O6YjRAOuwlbH9BqA/f7cH08Q6lAsg=;
	b=CdH0OyyxgdoWDtY40/tkk0TJoQRWXbCfibGGUdGsiIRljTV3rTb5BUGKUVxfD9v5/9sl
	 pg3j5D9oMtJs28gSkrFlXga9KmlkdEtXFLIDnq5C5fvpAfVZy3LQfqZRBztTMY+5titUZ
	 oQZypn6rOuRTc5Mj4ZgtnEvaG4vwKQ7Zj9PcncduGxSF5qsCXoXc3ulV7vx98NPeC8uz2
	 ftv4KGPop6gowajEQgpVeaC8pgpiQ92TIPQ9UqSdFZAUm1szOtTHhzNhmC9oTBfVbLylk
	 /lcluXMZXBuhW+fLBL4BF5tjz+WEgGFxsRgZp6WFVU/QktjzIYrBZVr346V22B1EsCw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795721035;
	bh=ECB+f9UBJtBOr+O6YjRAOuwlbH9BqA/f7cH08Q6lAsg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mqzO77lUVdJKH41B0x5ovHM32rZ1Z8oGALtElxhmRaNY4enXzmFNn9kGMZl3MLmE8
	 XDr9OBBEN1FUeXITZ0RH91TQOE1SIDH8YtyEGqBDt54Y7ZJjzAnlWxrbHVzk8BlLXs
	 xy93KnZivPXDTpz9HsLcemKS8JApEsBvsMqLMIRtOFTwDNZsodzrhqrc2OQAJnn954
	 a5iXc0Ayjc8krBu+F23ZyEbjlaTLCMkCfjN/+Q+GarEPa49B2HR4paygysQ1vX+hWk
	 CNas03RR1tG8o7ZR2ue8m0uWjljhytOsk99xPFTB1MTgx5WA3H4hW54rl1t8rs+OCj
	 rngBle4FiNneg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92AED409E9;
	Thu, 26 Nov 2026 19:23:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F463260
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1564740540
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:23:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kw5lmbTNtL6M for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 19:23:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org EC825400E6
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::1131"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1131; helo=mail-yw1-x1131.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=SFXi9dzX
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC825400E6
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:23:52 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-8b10d24345dso67270827b3.3
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 11:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795721031; x=1796325831;
 darn=buildroot.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ah3B7k693FhG4jpHnUkq6yUPMUpfo4T5w1+9MzOJ2qA=;
 b=SFXi9dzX44NJArq5Smf+J4y6TTVkTwFM8J7G1W8P3Ie6qp++PjNKWtSdlgkEgORCkN
 TJiLhiE6henvbRbHFYdgOdWQoYBDIsqX4/1K7Gk+WKL1vK9VwGM4iBP57dV3rxnn7qAZ
 6jMtRN7FVQ+YaSrwWkhDOSvt3O5EDco7x652A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795721031; x=1796325831;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ah3B7k693FhG4jpHnUkq6yUPMUpfo4T5w1+9MzOJ2qA=;
 b=VF0c8FZevAp2Y6l4kVMv4cQsdJpDkZ6w5QP4Ishs0S8trVEs8J3q5zizcT0w2JmIYY
 dzfhGknJupmbX1PK4kAElLjg/QwxLwhaU3JLZiGDk4oYP98lKXIStAipiGSH+o1aHixU
 J5MqYzqwNeLP0WfE14xbyVCmF59byApIMzXhQESN7ppsnuYkrghJDzP1pRe/WzaR3aW0
 fGfmtlozapkDq2Vs9IxR22Hkc24rHc/KWac0ViVhO8COdarslwv8qtlmsuc9ekHR5aqC
 UspEN3BWzhkmRswBSysu2UY1osKvH5YzBKTRA9gVxtUcN41E6Obk+9UHPafi5o4L1HHH
 2q2Q==
X-Gm-Message-State: APuU4Z9M9XgQemQx3FyCZLa1QjgiD7ihnpMnN4KChCJfRde48NlDfpqB
 O0mkZJiVReMiLIEm9wEgV2s1rbNiz3QwY6Iqq+wNcsOIlYHmm/u9Lg8lZ1fTukO7FK/j+wbWzSO
 9wmgQ9VuPZ26excoEBNGdQpLJl60wdeejuPcKbXZKYg==
X-Gm-Gg: AZFdTZfRxcMsB9pGRWwRrUpfPUioQO9ezMB/YXnRuqgtCBCSnYt0TnoM9j9LEFNEiVJ
 BtFDC6gd1ji1gH64qwNYTOuOXdu/lhQgrcCmUd4x4sz2KhTDjJuFAV/gbiMoUidktcl03aghKiH
 S5Jh1BAHp11bwIavzeFj5bXTp8yYLWkYxNQKDFKRgKMJmXcCID105sdheT9QmMGkpkgb8V1oSQD
 fH8wd+Vppzv5MZwjYIs6ryDtmsagzyUyHaN9yLvOL6Lo1tE5zcfe6+S6R5Mh5UvROUUjQYDqDxE
 qiuXw6+jYf2jnpRFrmvmV2QlIItnWIqHHrAXRxKcsxw+wt1R2OK3847sXV3gs9KdFcqacjPdfZ0
 QZeveKSOMr7cTVZP8X+9xx0Zcav9MxjNjcy/OlouL6iiUHekdqls8s3QSPg0vMlPwSQ==
X-Received: by 2002:a05:690c:3705:b0:8b3:9115:a1b2 with SMTP id
 00721157ae682-8b52051fdfbmr79028117b3.64.1795721031467; Thu, 26 Nov 2026
 11:23:51 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029164212.672884-1-dario.binacchi@amarulasolutions.com>
 <d5623df9-16aa-415c-a5a4-390c11572512@gmx.de>
In-Reply-To: <d5623df9-16aa-415c-a5a4-390c11572512@gmx.de>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 26 Nov 2026 20:23:39 +0100
X-Gm-Features: Aa3M54rqZauO1aU4MIMlT7oIsUKS0UAxsXr0XORdSRMO3xbPTtUqDBAr5elW52k
Message-ID: <CABGWkvp5aGrXNJ83Ui_iQV9SYjprdcgmqiALsa-tPfpkEDA46A@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, linux-amarula@amarulasolutions.com
Subject: Re: [Buildroot] [PATCH 1/1] package/eudev: S10udevd: wait for udevd
 before triggering events
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgRmlvbmEsCgpPbiBUaHUsIE5vdiAyNiwgMjAyNiBhdCA1OjEy4oCvUE0gRmlvbmEgS2x1dGUg
PGZpb25hLmtsdXRlQGdteC5kZT4gd3JvdGU6Cj4KPiBBbSAyOS4xMC4yNiB1bSAxNzo0MiBzY2hy
aWViIERhcmlvIEJpbmFjY2hpOgo+ID4gc3RhcnQtc3RvcC1kYWVtb24gc3RhcnRzIHVkZXZkIGlu
IHRoZSBiYWNrZ3JvdW5kIGFuZCByZXR1cm5zIGJlZm9yZQo+ID4gdWRldmQgbGlzdGVucyB0byBr
ZXJuZWwgZXZlbnRzLiBUaGUgY29sZHBsdWcgZXZlbnRzIGdlbmVyYXRlZCByaWdodAo+ID4gYWZ0
ZXIgYnkgInVkZXZhZG0gdHJpZ2dlciIgbWF5IHRoZW4gZ2V0IGxvc3QsIHNvIHRoYXQgbm8gbW9k
dWxlIGlzCj4gPiBsb2FkZWQgYXQgYm9vdDoKPiA+Cj4gPiAgICBTdGFydGluZyBuZXR3b3JrOiBX
YWl0aW5nIGZvciBpbnRlcmZhY2UgZXRoMCB0byBhcHBlYXIuLi4uLi4uLi4uLi4uLi4gdGltZW91
dCEKPiA+Cj4gPiBXYWl0IHVudGlsIHVkZXZkIGFuc3dlcnMgb24gaXRzIGNvbnRyb2wgc29ja2V0
IGJlZm9yZSB0cmlnZ2VyaW5nIHRoZQo+ID4gZXZlbnRzLgo+Cj4gTm90IGFuIGlzc3VlIEkndmUg
c2VlbiwgYnV0IHllYWgsIHRoYXQgdGltaW5nIGlzIHJhbmRvbS4KPgo+ID4gRml4ZXM6IDQxMjU4
YTgxOTQ4ZmRkZmE3ZmM4YWMwNmI2OWQ3N2ZhMDUxYjc0NGQgKCJwYWNrYWdlL2V1ZGV2OiByZWZh
Y3RvciBpbml0IHNjcmlwdCBhbmQgcmVuYW1lIGl0IHRvIFMxMHVkZXZkIikKPiA+IFNpZ25lZC1v
ZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNv
bT4KPiA+IC0tLQo+ID4gICBwYWNrYWdlL2V1ZGV2L1MxMHVkZXZkIHwgOCArKysrKysrKwo+ID4g
ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvZXVkZXYvUzEwdWRldmQgYi9wYWNrYWdlL2V1ZGV2L1MxMHVkZXZkCj4gPiBpbmRleCA4
YmI4ZjZlYjNhMDEuLjY2MDJlOTJjMmM4NiAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvZXVkZXYv
UzEwdWRldmQKPiA+ICsrKyBiL3BhY2thZ2UvZXVkZXYvUzEwdWRldmQKPiA+IEBAIC0zNSw2ICsz
NSwxNCBAQCBzdGFydCgpIHsKPiA+ICAgICAgIHN0YXR1cz0kPwo+ID4gICAgICAgaWYgWyAiJHN0
YXR1cyIgLWVxIDAgXTsgdGhlbgo+ID4gICAgICAgICAgICAgICBlY2hvICJPSyIKPiA+ICsgICAg
ICAgICAgICAgIyBzdGFydC1zdG9wLWRhZW1vbiByZXR1cm5zIGJlZm9yZSB1ZGV2ZCBsaXN0ZW5z
IHRvIGtlcm5lbCBldmVudHM6Cj4gPiArICAgICAgICAgICAgICMgd2FpdCBmb3IgaXQsIG9yIHRo
ZSBldmVudHMgdHJpZ2dlcmVkIGJlbG93IG1heSBnZXQgbG9zdAo+ID4gKyAgICAgICAgICAgICBp
PTAKPiA+ICsgICAgICAgICAgICAgd2hpbGUgISB1ZGV2YWRtIGNvbnRyb2wgLS1zdGFydC1leGVj
LXF1ZXVlIDI+L2Rldi9udWxsOyBkbwo+Cj4gV2hhdCBpcyB0aGUgcHVycG9zZSBvZiAtLXN0YXJ0
LWV4ZWMtcXVldWUgaGVyZT8gSWYgeW91IGp1c3Qgd2FudCB0byBiZQo+IHN1cmUgdWRldmQgaXMg
YWN0dWFsbHkgdXAgYW5kIHJlc3BvbmRpbmcgdG8gY29udHJvbCBtZXNzYWdlcywgd291bGRuJ3QK
PiAtLXBpbmcgYmUgc3VmZmljaWVudD8KCmV1ZGV2J3MgdWRldmFkbSBjb250cm9sIGhhcyBubyAt
LXBpbmcgb3B0aW9uIChjaGVja2VkIG9uIDMuMi4xNCBhbmQKMy4yLjE1KSwgc28gLS1zdGFydC1l
eGVjLXF1ZXVlIGlzIG9ubHkgdXNlZCB0byBjaGVjayB0aGF0IHVkZXZkCmFuc3dlcnMgb24gaXRz
IGNvbnRyb2wgc29ja2V0LiBJJ2xsIGV4cGxhaW4gaXQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgoK
Pgo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGk9JCgoaSArIDEpKQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIFsgIiRpIiAtZ2UgNTAgXSAmJiBicmVhawo+Cj4gTm90IGNyaXRpY2FsIGJlY2F1
c2Ugd2UgZG9uJ3QgdXN1YWxseSBydW4gaW5pdCBzY3JpcHRzIHdpdGggInNldCAtZSIsCj4gYnV0
IGRvaW5nCj4KPiBbICIkaSIgLWx0IDUwIF0gfHwgYnJlYWsKCk9rLgoKPgo+IGluc3RlYWQgd291
bGQgYXZvaWQgYSBub24temVybyByZXR1cm4gY29kZSBmb3IgdGhpcyBsaW5lLgo+Cj4gPiArICAg
ICAgICAgICAgICAgICAgICAgc2xlZXAgMC4xCj4gPiArICAgICAgICAgICAgIGRvbmUKPiA+ICAg
ICAgIGVsc2UKPiA+ICAgICAgICAgICAgICAgZWNobyAiRkFJTCIKPiA+ICAgICAgIGZpCj4KPiBO
b3QgY2F1c2VkIGJ5IHRoZSBwcm9wb3NlZCBjaGFuZ2UsIGJ1dCBpZiBzdGFydGluZyB1ZGV2ZCBm
YWlsZWQKPiBjb250aW51aW5nIHRvIGNhbGwgdWRldmFkbSB0cmlnZ2VyL3NldHRsZSBkb2Vzbid0
IHJlYWxseSBtYWtlIHNlbnNlLiBJZgo+IHlvdSBhZGQgYSAicmV0dXJuICRzdGF0dXMiIGluIHRo
ZSBGQUlMIGJyYW5jaCB0aGUgd2FpdCBjYW4gYmUgb3V0c2lkZQo+IHRoZSBpZiwgd2hpY2ggaXMg
bW9yZSByZWFkYWJsZS4KCk9rLCBJIHdpbGwgZG8gdGhhdCBpbiB2Mi4KClRoYW5rcyBhbmQgcmVn
YXJkcywKRGFyaW8KCj4KPiBCZXN0IHJlZ2FyZHMsCj4gRmlvbmEKPgoKCi0tIApEYXJpbyBCaW5h
Y2NoaQpTZW5pb3IgRW1iZWRkZWQgU29mdHdhcmUgRW5naW5lZXIKTS4gKzM5IDMyOCAwNjI1MjQ2
CmRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tCuKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAlQpBbWFydWxhIFNvbHV0aW9ucyBTUkwKIFZpYSBGZWxp
Y2UgQ2F2YWxsb3R0aSAyNUQsIDQxMDEyIENhcnBpLCBNTywgSVQKaW5mb0BhbWFydWxhc29sdXRp
b25zLmNvbQp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
