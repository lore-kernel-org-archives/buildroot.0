Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E81C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 22:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6ABD400FF;
	Sun,  3 Mar 2024 22:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9l7jsRIpoUnB; Sun,  3 Mar 2024 22:34:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1BA240278
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1BA240278;
	Sun,  3 Mar 2024 22:34:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E4761BF292
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 22:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A9F940278
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 22:34:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KbgznBKLF164 for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 22:34:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 66000400FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66000400FF
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 66000400FF
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 22:34:31 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5132010e5d1so3884067e87.0
 for <buildroot@buildroot.org>; Sun, 03 Mar 2024 14:34:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709505269; x=1710110069;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iYtr2K70AF4QDQn/XEGvD+iQ3yCGJJkOrruzQ7ocwZE=;
 b=HwmkpY6LL4+CCI98Zp67302Howd0tAj4G7h4NagsvHhsy7AJv22uzKLjQBY4+GsNom
 dnUbD36qGZ1/KHu2V35PfC7nHz6xZAsCtJRLtrqW6xWJxrg0wxfOOy0706Zdk9W2ZRHl
 c1ieV1gVpuLzjplutZBwxsElHTyjBwHwcQSatMfe2+r94Ogzv7DaV/QDhU6FKMXVZjnI
 oYOEibo9U9TPErfbICVAp9BwiqaG7z2RnPys3FDPVvBurkWrs0Tad6NNWbtFMi14oE62
 dV4QLItM/vOkzaABzRh1vgoPzrMdYJ9+f1mTtAAgGUojI5frqe8P8ovTZY4fve4SKiT9
 7ueA==
X-Gm-Message-State: AOJu0Yx3FeFtmCs50zaRLLqdMfTamcNn40492mi1C9p3j2L6ZiFqp7Bo
 vlLhjxC93vw7TvqT1egU9BM8vKbSc0gKtaZq11YmQ4u0uYQIdagvNOc1fOsT4R1ziBMDxvwRbSr
 ra/2ZZFD9wzlORF/lFRuDPdhcYr4vK1D8kOY=
X-Google-Smtp-Source: AGHT+IFnPEuMoiBLoOmd3kUyDmPocVQ9FnILZbjcd30CRByB/mXwkkrkTzjBxoYNeKtneSaab7TCHQo7OmOP8GBAhp8=
X-Received: by 2002:a19:e042:0:b0:513:2508:d2cf with SMTP id
 g2-20020a19e042000000b005132508d2cfmr4550882lfj.23.1709505268930; Sun, 03 Mar
 2024 14:34:28 -0800 (PST)
MIME-Version: 1.0
References: <20240303212411.1139387-1-fontaine.fabrice@gmail.com>
 <20240303231700.55fe7c0b@windsurf>
In-Reply-To: <20240303231700.55fe7c0b@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 3 Mar 2024 23:34:17 +0100
Message-ID: <CAPi7W80PD21cWRc6Gu=5YDSnCd9mB7h2oqALzSrfxoLRfe_aOw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709505269; x=1710110069; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iYtr2K70AF4QDQn/XEGvD+iQ3yCGJJkOrruzQ7ocwZE=;
 b=R93LuukJ6mWQPXaANACsUO+CUONyQw483wZ7fCWQLnsvWxOZufKEEF2f2l/tD/AGHM
 Hf9Y/1eBOjf/n2U0V3Jgrhn+6TV5JOhUOBAW4kdwHTrUuOddm/kCGpV5e6VIuTqHcIAP
 hGkjfhqElyoriJGfhLXNKQTRJg+ettAMY9oncRsbfOB68AxNQuD76HbGqqtil0jvbY6z
 tbBeM3sxxhQJ6wZHERAnxCm2sUE8WdW9eXSKiHYnxnO59hGm0FLgQcun42iccbLf/aJN
 a6Tp7FJOa4K76yR+I+fkVhyyTXOVvAGaOvdOBvTbbS9jPqkERyH8ySkEXwtTkegD40qR
 nvMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=R93LuukJ
Subject: Re: [Buildroot] [PATCH 1/1] package/fluent-bit: fix build with
 BR2_TIME_BITS_64
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgZGltLiAzIG1hcnMgMjAyNCDDoCAyMzoxNywgVGhvbWFzIFBldGF6em9uaQo8dGhvbWFzLnBl
dGF6em9uaUBib290bGluLmNvbT4gYSDDqWNyaXQgOgo+Cj4gT24gU3VuLCAgMyBNYXIgMjAyNCAy
MjoyNDoxMSArMDEwMAo+IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwu
Y29tPiB3cm90ZToKPgo+ID4gSW5kZWVkLCB0aGlzIExGUyB3b3JrYXJvdW5kIHdhcyBwcmVzZW50
IHNpbmNlIHRoZSBhZGRpdGlvbiBvZiB0aGUKPiA+IHBhY2thZ2UgaW4gY29tbWl0IDZhMGY3YzM5
YmNiNDhmYzEzYWEyY2UzZmM0OTk2YmFmMWJlNjY0ODMgYW5kIGlzCj4gPiBwcm9iYWJseSBub3Qg
bmVlZGVkIGFueW1vcmUKPgo+IFRoaXMgcGFja2FnZSB3YXMgYWRkZWQganVzdCBhIHllYXIgYWdv
LCBzbyBJIGJlbGlldmUgInByb2JhYmx5IG5vdAo+IG5lZWRlZCBhbnltb3JlIiBpcyBtb3N0IGxp
a2VseSBub3Qgc3VmZmljaWVudGx5IGFzc2VydGl2ZS4gQ2FuIHdlIGdldAo+IHNvbWUgbW9yZSBj
bGFyaXR5IG9uIHRoaXMsIGJ5IHJlcHJvZHVjaW5nIHRoZSBvcmlnaW5hbCBpc3N1ZSB0aGF0IGxl
YWQKPiB0byB0aGlzIEZMVUVOVF9CSVRfQ0ZMQUdTICs9IC1VX0ZJTEVfT0ZGU0VUX0JJVFMgbWFn
aWMsIGFuZCB0aGVuIGZpZ3VyZQo+IG91dCBob3cgaXQgZ290IHJlc29sdmVkLCBpZiBpdCBkaWQ/
CgpDb21tZW50IGFib3ZlIHRoaXMgIm1hZ2ljIiBpcyBwb2ludGluZyB0byBhIHBvbGljeWNvcmV1
dGlscyBkZWZlY3QKb3BlbmVkIDE0IHllYXJzIGFnbyBpbiAyMDEwLgpJIGFzc3VtZSB0aGF0IGl0
IGNvdWxkIGJlIGxpbmtlZCB0byBnbGliYyA8IDIuMjMgYXMgZm9yIHRoZSBvdGhlciBwYWNrYWdl
cy4KSG93ZXZlciwgSSdsbCBsZXQgVGhvbWFzIGFuc3dlcnMgb24gd2h5IHRoaXMgIm1hZ2ljIiB3
YXMgbmVlZGVkLgoKPgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIg
YW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcg
YW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQoKQmVzdCBSZWdhcmRzLAoKRmFicmlj
ZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
