Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECCCC021A4
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 07:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11EE2847BB;
	Fri, 14 Feb 2025 07:49:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PjIieECM2VRq; Fri, 14 Feb 2025 07:49:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF74C847C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF74C847C1;
	Fri, 14 Feb 2025 07:49:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F07FB1C6
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 07:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E03C84128F
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 07:49:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rod-Vo6j6jjm for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 07:49:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 82EAA412A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82EAA412A1
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82EAA412A1
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 07:49:15 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5439a6179a7so1761444e87.1
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 23:49:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739519353; x=1740124153;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kbnKh8F3QXSxjkkW0ySdsSKHiNp6rD7QM8qjFNEUagA=;
 b=enC/bXIimxKlDZR2k3CliMYmpaeBGaJZ1RmFUj1/lGFj3boBbte1Ek8RZF5lfoK3Il
 qBaqKHakEgPSOOFtulWdXe8u+MYG7mos3lvwvCs3J2KMkF9yh8iCp99zpaoFGj0WfCzr
 zVIFRO+TpSqRv1zkad/0uvMF8gM2cwQkmk8+rRQ0xIZFBLA4B/+7LMZd9cc4iq9RIwsi
 oLwzGY/PJl3arebQZ8cI/Y5yB5T1pvIe2aFEpHldAkBgYpoAgsumWMqnhh34OTRJzEJR
 Z9Ee1eCTWyxcP8Adivs3WJdzg5Arh8xFjh9ZgpaRdykdbwG9xkG3Be7DDadteE9hOFZU
 Vt+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWoKSCkN6FhUX19YvanaMo6MmwVFr9jxeGJeMZS2BRI0i+xc+fW2E6lLCDiaBtnKM0tdTRfhWsNIY=@buildroot.org
X-Gm-Message-State: AOJu0YxZlFscPfDgEK0X7bQl9GWfdd8WmnEwPaL+wFAR6RflaljnZosZ
 2vxEkFlNgjGGiXKgVsbD8SbCVvWMTmyzCUnW/croPONyR2KBd7BPcbYnR4Jq2GQjZQbIXQvZKde
 mKH3EH9SWytAuNIIs3Bu+aqpBC2g=
X-Gm-Gg: ASbGnct2oo+jFoQtPh/TU5Ey1RFjhxcbUBo1ZATWW3cFssFoGAMh7XVGDEEM3nBSko1
 GPI7LRLouj1qt2A1+g+kUqjlib80kJ3TuZS4hRHWpDVXiEYAmtPDhkzhoI/2IilcGkIG7LgZRVQ
 ==
X-Google-Smtp-Source: AGHT+IHMQF7BOrDkUGLTeevFUQxYmZ3W+3+rrX/x80bxHfj5MdYESzlIJYCDnTZyrtPQDE0+fQm0i2d07yGxU41vIZ8=
X-Received: by 2002:a05:6512:220b:b0:545:4ca:d395 with SMTP id
 2adb3069b0e04-5451e2f7c58mr1889788e87.2.1739519352756; Thu, 13 Feb 2025
 23:49:12 -0800 (PST)
MIME-Version: 1.0
References: <20250212135027.759121-1-fancp2007@gmail.com>
 <20250213045050.816782-1-fancp2007@gmail.com>
 <c281fbe54e343bcc61c8e08e623e10a0@free.fr>
 <Z652OsALpn1B5OJR@waldemar-brodkorb.de>
 <CAFkzVZbMTHBqRm1ABAnqMvRBCHGqT_MK9E4wZL+ieLf__e=T7A@mail.gmail.com>
 <Z668GPE9/vZROlga@waldemar-brodkorb.de>
In-Reply-To: <Z668GPE9/vZROlga@waldemar-brodkorb.de>
From: Scott Fan <fancp2007@gmail.com>
Date: Fri, 14 Feb 2025 15:49:00 +0800
X-Gm-Features: AWEUYZlOy1XGmK_T8uBEIODPWZZXX6guVNu4iT0WZ01XAP-KQ7F8_T4L0-XRKIM
Message-ID: <CAFkzVZa7ns0bBWcjVPLv7BkWLnxmJXKAcTK5-np-m8cUwXa1cQ@mail.gmail.com>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org,
 Bernd Kuhls <bernd@kuhls.net>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739519353; x=1740124153; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kbnKh8F3QXSxjkkW0ySdsSKHiNp6rD7QM8qjFNEUagA=;
 b=nG+MDySb52KbYHF+AD7s+bLpL3EP0OT4VWaDPjB3hzLpeBm7XLF1aBZ4fOKM8yVXhq
 nIOLQvSU76kX/xJAVtu/bBAONvhVaO6v2DNsAlV1Q+NML4J2KSAwXnedxBVCXjWt9Xwn
 FZn7USKMZDZBL3vgkBuP34pDoiZVWHSMiVYqOQYuETSCqPuF8IgKuZQGwRs8eGJ0vHe0
 KluMd8a7hffRyF7YJp2hM/0B6wZntImNfVJvo8PjJFTTgeP15Sbz6qN6hP/3MUnVypsd
 n4CrQsOmZKnlnzOc0yCH1kBfsxeFGHdo/PsIyd0rcM2vvo4fnH6diIL8kVQoquY3tTS3
 X3Jw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nG+MDySb
Subject: Re: [Buildroot] [PATCH v2] package/sqlite: fix build issue since
 bump to 3.49.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

SGkgV2FsZGVtYXIsCgpJIGhhdmUgc2VudCBhIG5ldyBwYXRjaCAodjIpLCBzZWUgdGhlIGxpbmsg
YmVsb3c6Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0
Y2gvMjAyNTAyMTQwNzQyMzUuOTE3MjQyLTEtZmFuY3AyMDA3QGdtYWlsLmNvbS8KCldpdGggdGhp
cyBwYXRjaCwgSSB0ZXN0ZWQgdGhlIGZvbGxvd2luZyBkZWZjb25maWcsIGl0J3Mgb2suCiQgY2F0
IGRlZmNvbmZpZwpCUjJfYWFyY2g2ND15CkJSMl9UT09MQ0hBSU5fQlVJTERST09UX0NYWD15CkJS
Ml9QQUNLQUdFX0FTVEVSSVNLPXkKCkNvdWxkIHlvdSB0YWtlIGEgbW9tZW50IHRvIHRlc3QgdGhp
cyBwYXRjaCBmb3IgeW91ciB3b3JrPyB0aGFua3MuCgpTY290dCBGYW4KCk9uIEZyaSwgRmViIDE0
LCAyMDI1IGF0IDExOjQ04oCvQU0gV2FsZGVtYXIgQnJvZGtvcmIgPHdieEBvcGVuYWRrLm9yZz4g
d3JvdGU6Cj4KPiBIaSBTY290dCwKPiBTY290dCBGYW4gd3JvdGUsCj4KPiA+IEhpIFdhbGRlbWFy
LAo+ID4KPiA+IFRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjay4KPiA+Cj4gPiBJIGhhdmUgc2Vu
dCBhIG5ldyBwYXRjaCB0byBmaXggaXQsIHNlZSB0aGUgbGluayBiZWxvdzoKPiA+IGh0dHBzOi8v
cGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNTAyMTQwMjE0
MTYuMzkyMzYzLTEtZmFuY3AyMDA3QGdtYWlsLmNvbS8KPiA+Cj4gPiBDb3VsZCB5b3UgdGFrZSBh
IG1vbWVudCB0byB0ZXN0IHRoaXMgcGF0Y2ggZm9yIHlvdXIgd29yaz8gdGhhbmtzLgo+Cj4gVGhh
bmtzIGZvciB0aGUgZmFzdCBwYXRjaC4gQnV0IGl0IG5vdyBmYWlscyB3aGVuIGNvbXBpbGluZyBz
aGVsbC5jOgo+IC9ob21lL3dieC9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvYmluL2FhcmNoNjQtYnVp
bGRyb290LWxpbnV4LWdudS1nY2MgLW8gc3FsaXRlMyBcCj4gICAgICAgICBzaGVsbC5jIHNxbGl0
ZTMuYyBcCj4gICAgICAgICAtSS4gLURTUUxJVEVfRU5BQkxFX01BVEhfRlVOQ1RJT05TIC1EU1FM
SVRFX09NSVRfSlNPTiAtRFNRTElURV9USFJFQURTQUZFPTEgLURIQVZFX1JFQURMSU5FPTEgLURT
UUxJVEVfSEFWRV9aTElCPTEgLURTUUxJVEVfT01JVF9SRUFETElORV9DT01QTEVUSU9OIFwKPiAg
ICAgICAgIC1EX0xBUkdFRklMRV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRfU09VUkNFIC1EX0ZJTEVf
T0ZGU0VUX0JJVFM9NjQgIC1PMiAtZzAgLURfRk9SVElGWV9TT1VSQ0U9MSAtRF9MQVJHRUZJTEVf
U09VUkNFIC1EX0xBUkdFRklMRTY0X1NPVVJDRSAtRF9GSUxFX09GRlNFVF9CSVRTPTY0IC1JL2hv
bWUvd2J4L2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9hYXJjaDY0LWJ1aWxkcm9vdC1saW51eC1nbnUv
c3lzcm9vdC91c3IvaW5jbHVkZSAgXAo+ICAgICAgICAgIC1XbCwtcnBhdGgsL3Vzci9saWIgIC1s
bSAgLWx6ICAgLWxlZGl0IC1sbmN1cnNlcwo+IHNoZWxsLmM6MTUxOjExOiBmYXRhbCBlcnJvcjog
cmVhZGxpbmUvcmVhZGxpbmUuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+ICAgMTUxIHwg
IyBpbmNsdWRlIDxyZWFkbGluZS9yZWFkbGluZS5oPgo+ICAgICAgIHwgICAgICAgICAgIF5+fn5+
fn5+fn5+fn5+fn5+fn5+fgo+IGNvbXBpbGF0aW9uIHRlcm1pbmF0ZWQuCj4KPiBUaGUgY29uZmln
dXJlIGNvbW1hbmQgcHV0cyBvdXQ6Cj4gICAgTk9URTogdGhlIGxvY2FsIGxpYmVkaXQgYnV0IHVz
ZXMgPHJlYWRsaW5lL3JlYWRsaW5lLmg+IHNvIHdlCj4gICAgIHdpbGwgY29tcGlsZSB3aXRoIC1E
SEFWRV9SRUFETElORT0xIGJ1dCB3aWxsIGxpbmsgd2l0aAo+ICAgICBsaWJlZGl0Lgo+Cj4gdGhh
bmtzIGZvciB3b3JraW5nIG9uIGl0Lgo+Cj4gYmVzdCByZWdhcmRzCj4gIFdhbGRlbWFyCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
