Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEEBCDD554
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 03:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 947F3427A7;
	Thu, 19 Sep 2024 03:21:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Gf0q8-Z3Te9; Thu, 19 Sep 2024 03:21:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6272E427BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6272E427BA;
	Thu, 19 Sep 2024 03:21:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B31761BF3DD
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 03:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A060B427BA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 03:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bIZiaGo3Fm78 for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 03:21:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1FCD3427A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FCD3427A7
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1FCD3427A7
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 03:21:37 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2f762de00fbso3406261fa.2
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 20:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726716095; x=1727320895;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+KuEZ5t5Efq7CGmxk8gpnyYQezbVMhqZoVr5CsVDa7A=;
 b=ocN7qKLD7Jo0QRpfDfiH9y7r9zV98gi6+H/6LNBRU53fWW8aISpTk+/XEGl+QlRgEO
 pDF6Bwg9cv/qMraPdigSANaj+JS+hFZXY+5BlUE3xj2VDGx4hEvt0zMS7RHd4z/BnB7c
 ljTqCqZYgUAENBXRJpiB+vv/GMWt2CIT9itZHiTQblLBr/JVSfyKd+xsbGqBHYKe8F5g
 O+iJjQKnBIVnEW+12tgw2Cnt4vQNqP8/f0xSRbml5pzr+xfI0AHkfLL1eaJU/m/WMvCf
 agrYtAec+r6XSA6mKSIYiLZY7XBTUz0q/aWTDxMbXO6xdlguhjl75j4mhGCrPiCnmlHt
 Q73w==
X-Gm-Message-State: AOJu0YwSsMwIkozY2fPTD3zH6VDVzeoCjPhCLQejTIhWfYA9b/5xSsZa
 F0R3ZoKlk2Eo3yr0wCbv/msCS2nvh5LI3sQMmwVH946ZVSWkJaBbXIjsjGDW2lVj2llSxDVtW7J
 SctDeyTrszi0Trrt+z/bLPa1WSaM=
X-Google-Smtp-Source: AGHT+IGft7/X8wCUk4/gvNqVD9NIUIASE5leMkYsaWBJn0vSHLtexX/oUeuxAzmXjzuc1iu1hxQ0L9UVCb4EcEVxIvM=
X-Received: by 2002:a2e:9003:0:b0:2f5:806:5d00 with SMTP id
 38308e7fff4ca-2f787f3b98bmr103913531fa.32.1726716094966; Wed, 18 Sep 2024
 20:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5D3LL=gCQt-k5e3350tQ+XULrzhV233q1GZbGFDD5f3Cg@mail.gmail.com>
 <20240724221001.7ec77c1b@windsurf>
In-Reply-To: <20240724221001.7ec77c1b@windsurf>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 19 Sep 2024 00:21:22 -0300
Message-ID: <CAOMZO5DbYXhKjwpyoLUFhV97_VZ076ExChBWmAzU8Z5FN-M6kQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726716095; x=1727320895; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+KuEZ5t5Efq7CGmxk8gpnyYQezbVMhqZoVr5CsVDa7A=;
 b=gz+gHcWS0bO9NHhWCdJ3s4VsPI7hAOoxPEh5p++OWYiHnidn4CKYvVX+wZ7AeeU2fk
 K3/O1I9qH3PqUhEiblIdbyt130OssvB1zvHLPsoP26ef8D1QhOT63Jv3y84NIGLwdpTS
 f2NLRxkZ77bCypJwAlK1CB/4Ykvreot7x6PdMB6R6MB5N3VlCdre/fVShAqL7PuYfal1
 k27UEB82l/IEhffceQESYai6w8bE+KXEw9JTOVFnWdcQ2Mhj98qlCbWFYknC9ftOHLz5
 Usm79FxixbcyakyNovSWng/qdT1o9mEbBD0dAIz+0h0kYQEyXgDOVWkwuVi7hORqAxe9
 PwQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gz+gHcWS
Subject: Re: [Buildroot] crucible: Build failure on riscv64/mips64el
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
Cc: Christian Stewart <christian@aperture.us>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpPbiBXZWQsIEp1bCAyNCwgMjAyNCBhdCA1OjEw4oCvUE0gVGhvbWFzIFBldGF6em9uaQo8
dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cgo+IEkgYWdyZWUgdGhhdCB3ZSBk
b24ndCByZWFsbHkgY2FyZSBhYm91dCBjcnVjaWJsZSBvbiBSSVNDLVYgNjQtYml0IGFuZAo+IG1p
cHM2NGVsLiBIb3dldmVyLCB0aGUgYnVpbGQgZmFpbHVyZXMgeW91J3JlIHBvaW50aW5nIHRvIGRv
bid0IHNlZW0gdG8KPiBiZSBjYXVzZWQgYnkgYW55dGhpbmcgQVJNLXNwZWNpZmljIGluIHRoZSBj
cnVjaWJsZSBjb2RlIGJhc2UuIEluc3RlYWQKPiB0aGV5IGxvb2sgbGlrZSByZWxhdGl2ZWx5IGdl
bmVyaWMgaXNzdWVzIHdpdGggb3VyIEdvIGludGVncmF0aW9uLgo+Cj4gQ2hyaXN0aWFuLCBkbyB5
b3UgdGhpbmsgeW91IGNvdWxkIGhhdmUgYSBsb29rIGF0IHRoZSBhYm92ZSB0d28KPiBmYWlsdXJl
cywgd2hpY2ggcmVhbGx5IGRvbid0IHNlZW0gdG8gYmUgcmVsYXRlZCB0byB0aGUgY3J1Y2libGUg
Y29kZSwKPiBidXQgbW9yZSBnZW5lcmFsIEdvIGlzc3Vlcy4KPgo+IFRoZSBmaXJzdCBvbmU6Cj4K
PiAkV09SSy9iMDcxL19wa2dfLmEoX3gwMDEubyk6IHVua25vd24gcmVsb2NhdGlvbiB0eXBlIDE3
OyBjb21waWxlZCB3aXRob3V0IC1mcGljPwo+ICRXT1JLL2IwNzgvX3BrZ18uYShfeDAwNS5vKTog
dW5rbm93biByZWxvY2F0aW9uIHR5cGUgMTc7IGNvbXBpbGVkIHdpdGhvdXQgLWZwaWM/Cj4KPiBp
cyByZWFsbHkgbXlzdGVyaW91cyB0byBtZS4KPgo+IFRoZSBzZWNvbmQgb25lOgo+Cj4gL2hvbWUv
YXV0b2J1aWxkL2F1dG9idWlsZC9pbnN0YW5jZS05L291dHB1dC0xL2hvc3QvbGliL2djYy9taXBz
NjRlbC1idWlsZHJvb3QtbGludXgtZ251LzEzLjMuMC8uLi8uLi8uLi8uLi9taXBzNjRlbC1idWls
ZHJvb3QtbGludXgtZ251L2Jpbi9sZDogL3RtcC9nby1saW5rLTIwNDQyNDg4MDMvZ28ubzogbGlu
a2luZyAtbW5hbj1sZWdhY3kgbW9kdWxlIHdpdGggcHJldmlvdXMgLW1uYW49MjAwOCBtb2R1bGVz
Cj4KPiBpcyByZWxhdGVkIHRvIHRoZSBmYWN0IHRoYXQgZGlmZmVyZW50IG9iamVjdCBmaWxlcy9s
aWJyYXJpZXMgaGF2ZSBiZWVuCj4gYnVpbHQgd2l0aCBkaWZmZW50IC1tbmFuIGFyZ3VtZW50cywg
YW5kIHdlIHRyeSB0byBsaW5rIHRoZW0gdG9nZXRoZXIsCj4gd2hpY2ggaXNuJ3QgY29ycmVjdC4g
VGhlIGNvbmZpZ3VyYXRpb24gaGFzIEJSMl9NSVBTX05BTl8yMDA4PXksIHNvCj4gd2UncmUgc3Vw
cG9zZWQgdG8gYmUgYnVpbGRpbmcgZXZlcnl0aGluZyB3aXRoIC1tbmFuPTIwMDgsIGJ1dCBpdCBz
ZWVtcwo+IGxpa2Ugc29tZSBHbyBzdHVmZiB0cmllcyB0byB1c2UgLW1uYW49bGVnYWN5IGluc3Rl
YWQuCj4KPiBJZiB5b3UgY291bGQgaGVscCB3aXRoIHRob3NlIHdlaXJkIEdvIGlzc3VlcywgaXQg
d291bGQgYmUgbXVjaCwgbXVjaAo+IGFwcHJlY2lhdGVkLgoKQ2FuIGFueW9uZSBwbGVhc2UgaGVs
cCB3aXRoIHRoZXNlIEdvIGlzc3Vlcz8KCkkga2VlcCBnZXR0aW5nIGJ1aWxkIGZhaWx1cmUgcmVw
b3J0cyBmb3IgdGhlIGNydWNpYmxlIHBhY2thZ2UuCgpIZXJlIGlzIGFub3RoZXIgb25lOgpodHRw
czovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvYjU2ZDkzNzZiZDc1ODA4MWUyN2Jj
MzQ5YzE5Mjc4M2VjZTIyYTRmYi9idWlsZC1lbmQubG9nCgpUaGFua3MKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
