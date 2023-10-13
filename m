Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38305CDB483
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 21:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE5DA60F90;
	Fri, 13 Oct 2023 21:43:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE5DA60F90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OzEfCIcO4TKF; Fri, 13 Oct 2023 21:43:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9D1460B3D;
	Fri, 13 Oct 2023 21:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9D1460B3D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 64AAD1BF3C0
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 21:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D5288140B
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 21:43:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D5288140B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tEBHq4h2BDXB for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 21:43:36 +0000 (UTC)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66DF9813F0
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 21:43:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66DF9813F0
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-503056c8195so3411031e87.1
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 14:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697233414; x=1697838214;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j1XQN9blDhaqHa0c7/i0VDG8E5CVjM5er0drGboKYRw=;
 b=d7EZj0GCIFauNRVLIpgBMCX907mYbMcr1Z7ww0SPbspPNVKOpZupMYxQcLWNuxGR23
 5OzmI+QvcBPyp2BPHFlM9IV/H27NLbT36hLW1tsJNt+I424CoMldRSPbfJorLxCW8tfs
 LkKnH6R5JbZAqgk7hSiUojC0+Zwa1mSolBp+ceA0l8wFVb/zY/nN4BB6Skl/aiU8gKf8
 hh1M20WOSGV+/Z9RK8iDUXYYhmoY9m5byIOiRtbScB0UTI+1KxKziBby++0Y6SomHobt
 bbAqnFCN/34zBRtT96IVKyBoDIOLVvddfYNHL7LLqWk9Nd4S3nHw+znaAPKD4C9qKtu0
 DeEw==
X-Gm-Message-State: AOJu0Ywv5plF9VPLfPwe9oI0yg7U7BDkhx7QDvit+lCwmJdDTUROYqPA
 kjC2or+eDWNlFByYBUgxaOf3/zGZHDTvSQLhrb68PkuR
X-Google-Smtp-Source: AGHT+IG5NK/4qgQHXvC8NQP2ceq9Visavba6/Ml56JeZmE1EBIy4G0XmNTGAs615p1r6xX5Giav2Ty8FJPcrmQDwtA8=
X-Received: by 2002:ac2:52b9:0:b0:507:96fd:d3ee with SMTP id
 r25-20020ac252b9000000b0050796fdd3eemr3275116lfm.32.1697233413699; Fri, 13
 Oct 2023 14:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <CABRndgyUFq2nfXU2Bi0o+aVjfuQ7eMtWbEFSJ1V9ipOHjaN_Aw@mail.gmail.com>
 <87wmvqyzvw.fsf@48ers.dk>
In-Reply-To: <87wmvqyzvw.fsf@48ers.dk>
From: Zvi Vered <veredz72@gmail.com>
Date: Sat, 14 Oct 2023 00:43:22 +0300
Message-ID: <CABRndgy_HzmfRLn0Y6hPqbYC=cAhggg7CR8Bp6zoaZHNoVu=pw@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697233414; x=1697838214; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j1XQN9blDhaqHa0c7/i0VDG8E5CVjM5er0drGboKYRw=;
 b=Vfej58VOnr6jIfqWqfn9t/UuDN/wN3PB0282keQLHE4gjs6hFHVwFyskRmLsCKmg82
 UjsBntsgJC4XCQCJqXHLLkyGRPmKe3mbdN5NGBv74R6da2hZCEH5IrFrMlOQujP15JQ2
 r8VxYOfZLlymxQidMSrBsGhEfZjMbRMAiuoy6VEo/1CJ3DgczYSvjuigSw0uvrPPuAZG
 pfBE3K5smIMGjV2O1N75/pwCpuZCZ+NMNStbc6ggAK1su1Dg8wpYWYcpQ/cKnoNN4oU1
 nvThDWt9GDCaVceRcSR0dr1BHO1l0/CamUU/dG0jPkymG4+kjQ5s47UQOqEpfqoyUU2C
 RakQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Vfej58VO
Subject: Re: [Buildroot] buildroot 2021.02.1: black screen after Xorg
 launched
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

SGkgUGV0ZXIsCgpJIHJhbjoKZXhwb3J0IERJU1BMQVk9OjAKYW5kIHRoZW4sIHhleWVzIHdvcmtz
ICEKCkRvZXMgaXQgbWFrZSBzZW5zZSB0byBpbnNlcnQgdGhpcyBleHBvcnQgaW4gcm9vdGZzLnRh
ciBjcmVhdGVkIGJ5IGJ1aWxkcm9vdCA/CgpUaGFuayB5b3UgdmVyeSBtdWNoLgpadmlrYQoKT24g
U2F0LCBPY3QgMTQsIDIwMjMgYXQgMTI6MzDigK9BTSBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtv
cnNnYWFyZC5jb20+IHdyb3RlOgo+Cj4gPj4+Pj4gIlp2aSIgPT0gWnZpIFZlcmVkIDx2ZXJlZHo3
MkBnbWFpbC5jb20+IHdyaXRlczoKPgo+ICA+IEhlbGxvLAo+ICA+IFVzaW5nIGJ1aWxkcm9vdCAy
MDIxLjAyLjEgZm9yIHg2NCBJIGJ1aWx0IHJvb3QgZmlsZSBzeXN0ZW0gdGhhdCBjb250YWluIFhv
cmcuCj4gID4gUmlnaHQgYWZ0ZXIgWG9yZyBpcyBsYXVuY2hlZCBJIGdvdCBibGFjayBzY3JlZW4u
Cj4KPiAyMDIxLjAyLjEgaXMgYSByZWxlYXNlIGZyb20gYWxtb3N0IDMgeWVhcnMgYWdvLCB3aGlj
aCBoYXMgYmVlbiBlbmQgb2YKPiBsaWZlIHNpbmNlIEFwcmlsIDIwMjIuIFBsZWFzZSB1c2UgYSBz
dXBwb3J0ZWQgdmVyc2lvbiAoRS5HLiAyMDIzLjAyLnggb3IKPiAyMDIzLjA4LngpLgo+Cj4gID4g
QWNjb3JkaW5nIHRvIFhvcmcuMC4wLmxvZyAoYXR0YWNoZWQpIHRoZXJlIGlzIG5vIGVycm9yLgo+
ICA+IEkgdHJpZWQgdG8gcnVuOiB4ZXllcyBhbmQgZ290Ogo+ICA+IENhbid0IG9wZW4gZGlzcGxh
eQo+Cj4gRG9lcyBpdCB3b3JrIGlmIHlvdSBzZXQgdGhlIERJU1BMQVkgZW52aXJvbm1lbnQgdmFy
aWFibGU/Cj4KPiBleHBvcnQgRElTUExBWT06MAo+Cj4gLS0KPiBCeWUsIFBldGVyIEtvcnNnYWFy
ZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
