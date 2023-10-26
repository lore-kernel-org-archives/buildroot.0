Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 335CDC25B6B
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 10:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D48E8417D8;
	Thu, 26 Oct 2023 10:27:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D48E8417D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KN8wAlQ3XXxI; Thu, 26 Oct 2023 10:27:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79B8241527;
	Thu, 26 Oct 2023 10:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79B8241527
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 42DEF1BF3F3
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 10:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DA7860864
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 10:27:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DA7860864
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0seZpvqC40_I for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 10:27:46 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC2DD606A0
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 10:27:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC2DD606A0
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-507a55302e0so822416e87.0
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 03:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698316063; x=1698920863;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uHs/e8UAzfxKIxxT/mrrLxYIF+2M5OlTPRR4mk95aXQ=;
 b=Awvy+uyPz1CvNBBvK6JDKFUf71mt3DgGsm5ytUwo5A/6G+TB80bfaLufnLjZGwMlvi
 1su8KJk6zdT8SBZc/+g1cO1feN4b1iITKyLQiUoyIChpHi+lY/wnalxTtrRFueWt5Pxe
 iSeq6BWNF1uPhvmu3QXZRlUjnx8RKLJZ7YBoUrZAJsd17uKmKqqVCz+myhgNkwtDC0VM
 eEq6CwN/afEzTKX9BwSX6PKncgujAEbp0IR/pO7cj6wOrhSQAHeA8/Z0ol8OBW9+0N3r
 sbEmcahLod8SqoyBUkagn/DL2NN2ArsxrkTmpAboQu8sa+jJFUMpNczqJgidV5FrPMoh
 oT9A==
X-Gm-Message-State: AOJu0YzWAFnGAphlTOFqN13u89uzHSLw0eaIL5hy8/BlKC9X7bbsQ899
 IMfpEq+JrT7leoKROCN2wDnyfQ==
X-Google-Smtp-Source: AGHT+IH4Egq/f2JG3uyCMNR6uNpN4WOiSrQV8uwkX3ZaBfOPowd0YADeNQL/T9pa/Ij66FH/AKMZ8A==
X-Received: by 2002:a05:6512:711:b0:507:a9b7:f071 with SMTP id
 b17-20020a056512071100b00507a9b7f071mr13125446lfs.1.1698316063576; 
 Thu, 26 Oct 2023 03:27:43 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a5d4e51000000b0032d09f7a713sm13959207wrt.18.2023.10.26.03.27.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 03:27:43 -0700 (PDT)
Message-ID: <c94f3836-fcfe-43ed-ac3b-870648a7c05a@smile.fr>
Date: Thu, 26 Oct 2023 12:27:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabien Thomas <fabien.thomas@smile.fr>, buildroot@buildroot.org
References: <20231026095506.876284-1-fabien.thomas@smile.fr>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20231026095506.876284-1-fabien.thomas@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1698316063; x=1698920863;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uHs/e8UAzfxKIxxT/mrrLxYIF+2M5OlTPRR4mk95aXQ=;
 b=ydKpJKI1pMuV6wx4Snk4ylZNqrfBvQEVZKVhc5kxySGvEdFSXyowmtbhaGGdNE7XwH
 eR4Al5OLrjjrhnU0MXD7lMX3NDNhu4oS0P42yBNWhvXNUjY2z5Z40rJg1ssVpJUYYvZK
 3DFvwRor6Py/h9551Ffh9NDdgtM6F6H5M+vbwH38WS8DHkP5+guNe0L2D6VWID18Vs+/
 1Z0BnwPr5o4TqgpNhq+p84EzZ1ltL+HyPeTX/Q7BWv+6WObavODC72G9gZHixCv98mKn
 nfI5hllFwux/b9OifOkBKxHPiukjfK1PeK0sur7UvxKrSEbCQPdqxyjj+T43V9/zNQAE
 mrrg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ydKpJKI1
Subject: Re: [Buildroot] [PATCH] package/nettle: add missing host-gmp
 dependency
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

SGkgRmFiaWVuLAoKTGUgMjYvMTAvMjAyMyDDoCAxMTo1NSwgRmFiaWVuIFRob21hcyBhIMOpY3Jp
dMKgOgo+IFNpbmNlIHRoZSBnZW5lcmljIHBhY2thZ2UgaW5mcmFzdHJ1Y3R1cmUgcmVtb3ZlZCBh
dXRvIGRlcml2YXRpb24gb2YKPiBob3N0IGRlcGVuZGVuY2llcyBbMV0gKDIwMTYuMDgpLCB0aGUg
aG9zdCBkZXBlbmRlbmNpZXMgbXVzdCBiZQo+IGV4cGxpY2l0bHkgc2V0Lgo+IAo+IFdoaWxlIGFk
ZGluZyB0aGUgbmV0dGxlIGhvc3QgdmFyaWFudCBbMl0gdGhlIGdtcCBkZXBlbmRlbmN5IHdhcyBu
b3QKPiBkdXBsaWNhdGVkIGFuZCBob3N0LW5ldHRsZSB3YXMgYnVpbHQgd2l0aG91dCBob3N0LWdt
cCAob3IgYnVpbHQgd2l0aAo+IGdtcCBpbnN0YWxsZWQgb24gdGhlIGJ1aWxkIG1hY2hpbmUpLgo+
IAo+IFdoaWxlIGJ1aWxkaW5nIGhvc3QtZ251dGxzIHJlcXVpcmVkIGZvciBidWlsZGluZyBta2Vm
aWNhcHN1bGUgdS1ib290Cj4gdG9vbCwgdGhlIGNvbmZpZ3VyZSBzY3JpcHQgY2hlY2sgaWYgTGli
aG9nd2VlZCAobmV0dGxlJ3MgY29tcGFuaW9uCj4gbGlicmFyeSkgaXMgYnVpbGQgd2l0aCBsaWJn
bXAgc3VwcG9ydC4KPiAKPiBJZiBpbnRlcm5hbCB0b29sY2hhaW4gaXMgdXNlZCwgbHVja2lseSBo
b3N0LWdtcCBpcyBidWlsdCBiZWZvcmUKPiBidWlsZGluZyBob3N0LW5ldHRsZSAoYW5kIGhvc3Qt
Z251dGxzKS4gQnV0IHdoZW4gdXNpbmcgcHJlYnVpbHQKPiBleHRlcm5hbCB0b29sY2hhaW4sIGZv
bGxvd2luZyBlcnJvciBzaG93cyB1cCA6Cj4gCj4gTGliaG9nd2VlZCAobmV0dGxlJ3MgY29tcGFu
aW9uIGxpYnJhcnkpIDMuNiB3YXMgbm90IGZvdW5kLiBOb3RlIHRoYXQgeW91IG11c3QgY29tcGls
ZSBuZXR0bGUgd2l0aCBnbXAgc3VwcG9ydC4KPiAKPiBbMV0gaHR0cHM6Ly9naXRsYWIuY29tL2J1
aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzRiZGIwNjdlMzgwZTcyYzNhNmNiOWM2Y2Nm
Mzc5MWE2Y2Y4NjYxZTAKPiBbMl0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVp
bGRyb290Ly0vY29tbWl0L2RhYzZlMzAxMTg4M2NlM2IzNWNiZjY0ZWMxNTYxODYxNTNiZjAwMzIK
PiBbM10gaHR0cHM6Ly9naXRsYWIuY29tL2dudXRscy9nbnV0bHMvLS9jb21taXQvZWIyNGJmYTgw
OGVlMDI5ZTliM2IxOThkNjZkMjkyNTZlZWEzZmQwOAo+IAo+IFNpZ25lZC1vZmYtYnk6IEZhYmll
biBUaG9tYXMgPGZhYmllbi50aG9tYXNAc21pbGUuZnI+CgpSZXZpZXdlZC1ieTogUm9tYWluIE5h
b3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+CkFja2VkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFp
bi5uYW91ckBzbWlsZS5mcj4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+IC0tLQo+ICBwYWNrYWdl
L25ldHRsZS9uZXR0bGUubWsgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9uZXR0bGUvbmV0dGxlLm1rIGIvcGFja2FnZS9u
ZXR0bGUvbmV0dGxlLm1rCj4gaW5kZXggZGQ0ZGZiYmUzOC4uZTJlMzIxOTA1NyAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL25ldHRsZS9uZXR0bGUubWsKPiArKysgYi9wYWNrYWdlL25ldHRsZS9uZXR0
bGUubWsKPiBAQCAtMTUsNiArMTUsOCBAQCBORVRUTEVfQ1BFX0lEX1ZFTkRPUiA9IG5ldHRsZV9w
cm9qZWN0Cj4gICMgd2l0aCBzdGF0aWMgbGlua2luZwo+ICBORVRUTEVfQ09ORl9PUFRTID0gLS1k
aXNhYmxlLW9wZW5zc2wKPiAgCj4gK0hPU1RfTkVUVExFX0RFUEVOREVOQ0lFUyA9IGhvc3QtZ21w
Cj4gKwo+ICAjIEFSTSBhc3NlbWJseSByZXF1aXJlcyB2NisgSVNBCj4gIGlmZXEgKCQoQlIyX0FS
TV9DUFVfQVJNVjQpJChCUjJfQVJNX0NQVV9BUk1WNSkkKEJSMl9BUk1fQ1BVX0FSTVY3TSkseSkK
PiAgTkVUVExFX0NPTkZfT1BUUyArPSAtLWRpc2FibGUtYXNzZW1ibGVyCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
