Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC736C4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 21:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B954400D2;
	Tue, 30 Apr 2024 21:41:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yKL_5kZ_yl86; Tue, 30 Apr 2024 21:41:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2B4C41564
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2B4C41564;
	Tue, 30 Apr 2024 21:41:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C2DB1BF2CF
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 21:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04CD140191
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 21:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HwlYk4UVkGNw for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 21:41:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 98CA44018F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98CA44018F
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98CA44018F
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 21:41:33 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41ba1ba5592so31807215e9.1
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 14:41:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714513292; x=1715118092;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EbUg+ZeXd8hcRQxMtr314v+UUTzEmVlvYgW9GRl0l+8=;
 b=r5KJxGlER9jqRvmdQD5ReRVWQSRPACA2gjO3xMnLWqglcOIAPO0WWwuGek1dFVzqim
 Y5GsaLgiXE4nz5Prhs7SG0Fy8K+wPnwCKOJ5ucu6SdY2FvmrQQWYjJWcUFaWYe78G/LL
 ulhNKk9WwusDWUUoK4I62MFl/lAWIyTIiIOsIkds7RJZ2w7P5KUoFNMJX0uYjf/Mafyt
 +09IzPftwy/tSENyO2fmbTbIMLuHg92UkVoWZCP6ZOS4FRc9wSsqunzsvJJ8mbRc7CLW
 2ZyKyErVl4Q5svnkYsXodX462VF+6n2tjmBu0tpAViDdU5RBx6TK1IoAftNK4Xkbj+Mg
 koqw==
X-Gm-Message-State: AOJu0YygAcn+Dc/J9V8eoL2yGgu00qZusdujoAimly3JnvRGyN7nd+In
 x/KyJCkcAy6BN4g7wQ2j/HyrSW3xRd8AlCSiod6SXUGrlzxRyBQ1HGEFoxMRN2/aKJlaitbNACR
 E
X-Google-Smtp-Source: AGHT+IFcpcIEPtAUwZ2SQB3FEn5agkmUWhSbQanUyyG34JHt6uk/HEwTuNOa3Oy2Q2F/L4Lhcgf2Ug==
X-Received: by 2002:a05:600c:6542:b0:41b:60ae:7827 with SMTP id
 dn2-20020a05600c654200b0041b60ae7827mr570217wmb.24.1714513292138; 
 Tue, 30 Apr 2024 14:41:32 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a7bc407000000b0041674bf7d4csm142819wmi.48.2024.04.30.14.41.31
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 14:41:31 -0700 (PDT)
Message-ID: <0785bb5e-2a0a-4476-8161-c9a61c4c7c44@smile.fr>
Date: Tue, 30 Apr 2024 23:41:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20240424201033.550180-1-romain.naour@smile.fr>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240424201033.550180-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714513292; x=1715118092;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EbUg+ZeXd8hcRQxMtr314v+UUTzEmVlvYgW9GRl0l+8=;
 b=JI55WAYlagg85IW0gelym/kRn7btTBMUrHU6BwU5yt1EDs0zndEWwHplKy6rFGQmJU
 8cu2Sj0EgkWTPRA/fOvNgSTo5ad49WcfVws7zXEu+fVlZdR6L9fhKmuEPT1uFteYCFb/
 YiDXSuGU51xA1anDEoVMWQ/n6kphI1I7xNug7+VqKU3XtD89t76mHIsOSN8ns4JQlJcx
 6OXB31paZZT/BQoYXpqJCaBw7CD7xWqFLwtCg/IHmLxPWk4Bxc3w0/arDHXP4E0Nghei
 S8DW6uIemYEpUkHUYig6WGG4YFVAB/Qs4jezx8AXavpHcOzu5kEc474HvWn9H7fRJKgV
 pDhA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=JI55WAYl
Subject: Re: [Buildroot] [PATCH] support/testing: TestF2FS: update kernel to
 4.19.310
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMjQvMDQvMjAyNCDDoCAyMjoxMCwgUm9tYWluIE5hb3VyIGEgw6ljcml0wqA6Cj4gU2luY2Ug
dGhlIHRvb2xjaGFpbiBCb290bGluIHVwZGF0ZSB0byAyMDIzLjExLTEgWzFdLCB0aGUgYXJtIExp
bnV4Cj4ga2VybmVsIGJ1aWxkIGlzIGJyb2tlbiB3aXRoIGJpbnV0aWxzID49IDIuNDEgd2l0aDoK
PiAKPiAgIGFyY2gvYXJtL21tL3Byb2MtdjcuUzogQXNzZW1ibGVyIG1lc3NhZ2VzOgo+ICAgYXJj
aC9hcm0vbW0vcHJvYy12Ny5TOjY0MDogRXJyb3I6IGp1bmsgYXQgZW5kIG9mIGxpbmUsIGZpcnN0
IHVucmVjb2duaXplZCBjaGFyYWN0ZXIgaXMgYCMnCj4gCj4gQSBzaW1pbGFyIGlzc3VlIGhhcyBh
bHJlYWR5IGJlIGZpeGVkIGZvciBxZW11IG02OGsgWzJdLgo+IAo+IEJ1bXAgdG8gdGhlIGxhdGVz
dCBrZXJuZWwgNC4xOSB0aGF0IGFscmVhZHkgaW5jbHVkZSB0aGUgYmFja3BvcnQKPiBvZiA3OTA3
NTZjN2UwMjIgKCJBUk06IDg5MzMvMTogcmVwbGFjZSBTdW4vU29sYXJpcyBzdHlsZSBmbGFnIG9u
IHNlY3Rpb24gZGlyZWN0aXZlIikKPiAKPiBbMV0gN2UwZTZlM2I4NjE4YWI5NDJmMjViMTFlZTcy
ZmJjNWE0ZGVlZmRmMQo+IFsyXSBhMWNlOTQ3NGU0MGY3MzFmMzI3MDM1ZDhjMDk2MmFiYjE2ZjAw
ZmY3Cj4gCj4gRml4ZXM6Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRy
b290Ly0vam9icy82NzAzMjIyMzgzCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxy
b21haW4ubmFvdXJAc21pbGUuZnI+Cj4gLS0tCj4gIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9mcy90
ZXN0X2YyZnMucHkgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvZnMvdGVz
dF9mMmZzLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2ZzL3Rlc3RfZjJmcy5weQo+IGluZGV4
IDQyNWZiZTMxY2EuLjgyNjA3N2FjOTQgMTAwNjQ0Cj4gLS0tIGEvc3VwcG9ydC90ZXN0aW5nL3Rl
c3RzL2ZzL3Rlc3RfZjJmcy5weQo+ICsrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9mcy90ZXN0
X2YyZnMucHkKPiBAQCAtMjAsNyArMjAsNyBAQCBjbGFzcyBUZXN0RjJGUyhpbmZyYS5iYXNldGVz
dC5CUlRlc3QpOgo+ICAgICAgICAgICMgQlIyX1RBUkdFVF9ST09URlNfVEFSIGlzIG5vdCBzZXQK
PiAgICAgICAgICBCUjJfTElOVVhfS0VSTkVMPXkKPiAgICAgICAgICBCUjJfTElOVVhfS0VSTkVM
X0NVU1RPTV9WRVJTSU9OPXkKPiAtICAgICAgICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJT
SU9OX1ZBTFVFPSI0LjE5LjIwNCIKPiArICAgICAgICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9W
RVJTSU9OX1ZBTFVFPSI0LjE5LjMxMCIKPiAgICAgICAgICBCUjJfTElOVVhfS0VSTkVMX1VTRV9E
RUZDT05GSUc9eQo+ICAgICAgICAgIEJSMl9MSU5VWF9LRVJORUxfREVGQ09ORklHPSJ2ZXhwcmVz
cyIKPiAgICAgICAgICBCUjJfTElOVVhfS0VSTkVMX0NPTkZJR19GUkFHTUVOVF9GSUxFUz0ie30i
CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
