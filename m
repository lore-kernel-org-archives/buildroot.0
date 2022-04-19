Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A1FC433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 16:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63EA8403FD;
	Tue, 19 Apr 2022 16:00:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F7PBjg0RhK_1; Tue, 19 Apr 2022 16:00:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8591B40391;
	Tue, 19 Apr 2022 16:00:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E23101BF28F
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 16:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0502842E3
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 16:00:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 25ylGkd_zoex for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 16:00:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9211982BC3
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 16:00:35 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id s16so6592172oie.0
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 09:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=U8aPYhiv2HcejZsgMp7fBhtZn47NSdm7DkPNEMCwmcs=;
 b=LlxaMY6QXXf/U8xPuopD40lMqMWODyljlJs/KWo8Ss7iDz1N8JcRSLC+D/+2Ottc4D
 d3F3XUrIRoqansv6M7Aw/PM2TF9iMLsj/C5pwwQgrAvzpzHU2rAxukFGUQihn7xQaePQ
 q0wNaps6cicy7cOD61pkftjhcPyUVHIQ98tSdCD72MPkttW+p21DAeTQfX/yQARDOtuI
 W3oljiXVJQ0cHhqyF1+QAYi7WmguB7oe9ggx/iAoPAW2RGj8A2Y35t89BW9uKIG6odoI
 umkmGDA1mGWpP391qrDRudrluMV5pFJKJooR/Hkha/8JE3iUvIej/YPGfnHzfBo3maq+
 +DAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U8aPYhiv2HcejZsgMp7fBhtZn47NSdm7DkPNEMCwmcs=;
 b=y+SoWNqgIWq6T2n9ZJdXxt383AJ+tvxQsr5EVpuwzHN84YUO9jBh8gVDxABNNHMMoH
 NJ6bxGf7rCX92yrX5fpy7kYVW5kp4aTuSgWOKhBDLAYhJQ+FukUJ5+c1/HFlQ66ehQJl
 SjolktOMvVit1L59K/B+GGq3oNChEPQ8MhX1Bt/qPQU9wUadE+7VTue1kwTv8L4UuFRp
 pzVlRiqgqK1zgBeZzsgIjNqMFLeMtb3poHxKpuzvfuzYUyds/BfnvlHnbUzTdwT+gja+
 sOjObeiHA3T0otWgguD7kh7lm4PqgRNRYUCqihEclrqXWBTmiPGpYtgdQERedGXybT2y
 /lxw==
X-Gm-Message-State: AOAM532OD32DZ6kVzcJQBDlo2YxvHC7hIMrM60dS3y/vAcpW39H+oOCg
 27+h/lfW2KfeCjeODP52h+UELPErpIbKPYHoy21llHYS
X-Google-Smtp-Source: ABdhPJxqlg+AjEJI68PLuRpEnipcZ/iV7rPV8nhPrBGPBGRN4rnIFfQJzRD/ZlJA0nnoQ+zMM1HVCMuaBgSwxAnJayU=
X-Received: by 2002:aca:f1d5:0:b0:2ec:eaab:eb9b with SMTP id
 p204-20020acaf1d5000000b002eceaabeb9bmr7487132oih.228.1650384034611; Tue, 19
 Apr 2022 09:00:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220413193216.891178-1-fontaine.fabrice@gmail.com>
 <20220413223407.7e71113f@windsurf>
 <CAPi7W83vjfzR5J1q9_tKotNhzQZLVVHr0DwR_6OYcnJDS84Q8g@mail.gmail.com>
In-Reply-To: <CAPi7W83vjfzR5J1q9_tKotNhzQZLVVHr0DwR_6OYcnJDS84Q8g@mail.gmail.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 19 Apr 2022 17:58:31 +0200
Message-ID: <CAPi7W82RWqSQjqefJjfE32B=Rbb4RHcsAA08S2+PiNOJX03TJQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: disable on riscv
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

TGUgbWVyLiAxMyBhdnIuIDIwMjIgw6AgMjI6NDMsIEZhYnJpY2UgRm9udGFpbmUKPGZvbnRhaW5l
LmZhYnJpY2VAZ21haWwuY29tPiBhIMOpY3JpdCA6Cj4KPiBMZSBtZXIuIDEzIGF2ci4gMjAyMiDD
oCAyMjozNCwgVGhvbWFzIFBldGF6em9uaQo+IDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29t
PiBhIMOpY3JpdCA6Cj4gPgo+ID4gT24gV2VkLCAxMyBBcHIgMjAyMiAyMTozMjoxNiArMDIwMAo+
ID4gRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+IHdyb3RlOgo+
ID4KPiA+ID4gcmlzY3YgaXMgbm90IHN1cHBvcnRlZCBzaW5jZSBzd2l0Y2ggdG8gaW50ZXJuYWwg
YmluZCByZXN1bHRpbmcgaW4gdGhlCj4gPiA+IGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIHNpbmNl
IGNvbW1pdAo+ID4gPiAwYzhkZDZlYmQ2NTZlMDZjZjk5YTYzZWI5MzM0MzcxNWY0ODUzNTAzOgo+
ID4gPgo+ID4gPiBJbnZhbGlkIGNvbmZpZ3VyYXRpb24gYHJpc2N2NjQtYnVpbGRyb290LWxpbnV4
LW11c2wnOiBtYWNoaW5lIGByaXNjdjY0LWJ1aWxkcm9vdCcgbm90IHJlY29nbml6ZWQKPiA+Cj4g
PiBUaGlzIHNlZW1zIG9kZC4gV2hhdCBpbiBkaGNwIGlzIGFyY2hpdGVjdHVyZS1zcGVjaWZpYz8K
Pgo+IE5vdGhpbmcgdG8gbXkga25vd2xlZGdlLCBidXQgYmluZC05LjExLjM2L2NvbmZpZy5zdWIg
ZXh0cmFjdGVkIGZyb20KPiBiaW5kLnRhci5neiBkb2Vzbid0IGNvbnRhaW4gYW55IG1lbnRpb24g
b2YgcmlzY3YgcmVzdWx0aW5nIGluIHRoZQo+IGFib3ZlIGZhaWx1cmUuCgpJIGZvdW5kIGEgYmV0
dGVyIHNvbHV0aW9uIGJ5IHVudGFyaW5nIGludGVybmFsIGJpbmQuCkknbGwgc2V0IHRoaXMgcGF0
Y2ggYXMgc3VwZXJzZWRlZC4KCj4KPiA+Cj4gPiBUaG9tYXMKPiA+IC0tCj4gPiBUaG9tYXMgUGV0
YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCj4gPiBFbWJlZGRlZCBMaW51eCBhbmQg
S2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+ID4gaHR0cHM6Ly9ib290bGluLmNvbQo+
Cj4gQmVzdCBSZWdhcmRzLAo+Cj4gRmFicmljZQoKQmVzdCBSZWdhcmRzLAoKRmFicmljZQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
