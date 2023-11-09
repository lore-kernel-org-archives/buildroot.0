Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969A9C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 04:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5008461266;
	Thu,  9 Nov 2023 04:01:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5008461266
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tAhUEavL7pJk; Thu,  9 Nov 2023 04:01:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A22CD60E5D;
	Thu,  9 Nov 2023 04:01:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A22CD60E5D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 420491BF2EA
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 04:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B18460E5D
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 04:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B18460E5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sax6gwn13rxS for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 04:01:36 +0000 (UTC)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB77660BAE
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 04:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB77660BAE
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-280165bba25so320754a91.2
 for <buildroot@buildroot.org>; Wed, 08 Nov 2023 20:01:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699502495; x=1700107295;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4BOaf1p8zm4eX+7ErlG4784pGssqBvuUiUqLl1mMJ1Q=;
 b=i50kHF5IgSoJyGQFBLr9VVTr2I888qSl/h1kJ8WyiA9l5CqR3JjA5CcG1ecKQcf0O0
 MN19RvaEED4YOmYcXrE+emmGk96wLXRym0VXAq/MBJGh4aBgwxx6JUspBUrHfqnWhUti
 JX/H17Idk0Qi0PqR9z5q4/8AclpZwVC1w7lVgN2MfrXcdy+9s06DygFd0hJKHLJ99Khx
 XnDhhzdZGbIR12sR0SqYL06OCOD7UrT5XivMApik8tbCrnZJTR0JQTLSNnzXK/SEZsM3
 /9FGmHKJNm5O8NMsZNVOE1MF37RiMlTaZ4WdzjZmriK7d62SpB78daaJdCO+zM2YU8N0
 NLvg==
X-Gm-Message-State: AOJu0Ywx/E4Ln4+VLwlkaLTTPXVQiGKW7IAss5KCpRAiHPg1y9yA8P7e
 hBAjMUkEX6xUiIZFTdVT97FspwRn6dxztmECD+DFJ2lW
X-Google-Smtp-Source: AGHT+IGUwR+9ZSQOxZO3RkpkqQhbUtbAtnBsLvrdFCAzpUu/ul5JQEEF6uEE/AxNTphSUgVeKHzdDZSwOCnlRYQWy2A=
X-Received: by 2002:a17:90b:4b0c:b0:281:3a2:80ee with SMTP id
 lx12-20020a17090b4b0c00b0028103a280eemr502338pjb.14.1699502494981; Wed, 08
 Nov 2023 20:01:34 -0800 (PST)
MIME-Version: 1.0
References: <20231109035947.1852675-1-Mr.Bossman075@gmail.com>
In-Reply-To: <20231109035947.1852675-1-Mr.Bossman075@gmail.com>
From: Jesse T <mr.bossman075@gmail.com>
Date: Wed, 8 Nov 2023 23:00:59 -0500
Message-ID: <CAJFTR8Rt3xHLiU8ANciO0MEwZX7iUd4G6J6cLO7eSuCkdPWjHA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699502495; x=1700107295; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4BOaf1p8zm4eX+7ErlG4784pGssqBvuUiUqLl1mMJ1Q=;
 b=BII/eDOChMqmGgIrarplMG+nyORU2LHGCuBYd4iSNEH8ZqCAOtTiWPjC9mjQSQLYj3
 SHSjP519sRlfN0hzPL3JRD+EJmIrRnjBhMCISV2ecivAuFFrkFSoGonxlyhoFsB3RsVl
 k1McKeQX8ahm25hPDNKundoiyKdBsWPqt3Murr85Ojk/5cAOzlfeaQNURU19drCJe+CS
 Kda6VQ4LzrP3/gyetPYM6CwLXUIZOynfMP16ulmSZdIXMObKC3hRS0kQVCXJRzfxW8jN
 6GzT0M74KFd9HdDv+q8Wg/YTdwcjHkRugCjljIYsMclwWUwpOkpnmijLnEY4C1UQi5hf
 9v1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BII/eDOC
Subject: Re: [Buildroot] [PATCH v1] configs/imxrt1050-evk: Bump Kernel and
 U-boot
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBOb3YgOCwgMjAyMyBhdCAxMDo1OeKAr1BNIEplc3NlIFRhdWJlIDxtci5ib3NzbWFu
MDc1QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBCdW1wIExpbnV4IHRvIDYuNiBhbmQgVS1Cb290IHRv
IDIwMjQuMDEtcmMyCj4KPiBTaWduZWQtb2ZmLWJ5OiBKZXNzZSBUYXViZSA8TXIuQm9zc21hbjA3
NUBnbWFpbC5jb20+Cj4gLS0tCj4gIGNvbmZpZ3MvaW14cnQxMDUwLWV2a19kZWZjb25maWcgfCA2
ICsrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvaW14cnQxMDUwLWV2a19kZWZjb25maWcgYi9jb25m
aWdzL2lteHJ0MTA1MC1ldmtfZGVmY29uZmlnCj4gaW5kZXggYWYwNjBmYjlmNC4uMGViNmY2MjZj
OSAxMDA2NDQKPiAtLS0gYS9jb25maWdzL2lteHJ0MTA1MC1ldmtfZGVmY29uZmlnCj4gKysrIGIv
Y29uZmlncy9pbXhydDEwNTAtZXZrX2RlZmNvbmZpZwo+IEBAIC03LDEyICs3LDEyIEBAIEJSMl9S
T09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9InN1cHBvcnQvc2NyaXB0cy9nZW5pbWFnZS5zaCIKPiAg
QlIyX1JPT1RGU19QT1NUX1NDUklQVF9BUkdTPSItYyBib2FyZC9mcmVlc2NhbGUvaW14cnQxMDUw
ZXZrL2dlbmltYWdlLmNmZyIKPgo+ICAjIFRvb2xjaGFpbgo+IC1CUjJfUEFDS0FHRV9IT1NUX0xJ
TlVYX0hFQURFUlNfQ1VTVE9NXzZfMT15Cj4gK0JSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVS
U19DVVNUT01fNl82PXkKPgo+ICAjIEtlcm5lbAo+ICBCUjJfTElOVVhfS0VSTkVMPXkKPiAgQlIy
X0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTj15Cj4gLUJSMl9MSU5VWF9LRVJORUxfQ1VTVE9N
X1ZFUlNJT05fVkFMVUU9IjYuMSIKPiArQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9W
QUxVRT0iNi42Igo+ICBCUjJfTElOVVhfS0VSTkVMX0RFRkNPTkZJRz0iaW14cnQiCj4gIEJSMl9M
SU5VWF9LRVJORUxfVUlNQUdFPXkKPiAgQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15Cj4g
QEAgLTMwLDcgKzMwLDcgQEAgQlIyX1BBQ0tBR0VfQlVTWUJPWF9DT05GSUc9InBhY2thZ2UvYnVz
eWJveC9idXN5Ym94LW1pbmltYWwuY29uZmlnIgo+ICBCUjJfVEFSR0VUX1VCT09UPXkKPiAgQlIy
X1RBUkdFVF9VQk9PVF9CVUlMRF9TWVNURU1fS0NPTkZJRz15Cj4gIEJSMl9UQVJHRVRfVUJPT1Rf
Q1VTVE9NX1ZFUlNJT049eQo+IC1CUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZBTFVF
PSIyMDIyLjEwIgo+ICtCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDI0
LjAxLXJjMiIKPiAgQlIyX1RBUkdFVF9VQk9PVF9CT0FSRF9ERUZDT05GSUc9ImlteHJ0MTA1MC1l
dmsiCj4gIEJSMl9UQVJHRVRfVUJPT1RfQ09ORklHX0ZSQUdNRU5UX0ZJTEVTPSJib2FyZC9mcmVl
c2NhbGUvaW14cnQxMDUwZXZrL3Vib290LmZyYWdtZW50Igo+ICBCUjJfVEFSR0VUX1VCT09UX0ZP
Uk1BVF9JTUc9eQo+IC0tCj4gMi40Mi4wCj4KClNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseSBVLUJv
b3QgaGFzIGEgcmVncmVzc2lvbi4KClRoYW5rcywKSmVzc2UgVGF1YmUKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
