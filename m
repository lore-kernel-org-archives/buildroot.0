Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451ABC27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 22:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6226606B9;
	Fri,  7 Jun 2024 22:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kVJLMDv-2mWi; Fri,  7 Jun 2024 22:04:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E963860805
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E963860805;
	Fri,  7 Jun 2024 22:04:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 29D491BF46D
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 22:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15A50409E1
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 22:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hs0hCRYghS91 for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 22:04:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CF565402F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF565402F6
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF565402F6
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 22:04:40 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-62a2424ed01so28371767b3.1
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 15:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717797879; x=1718402679;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DuR8/5QZ1gt3UKafpp3gKQ/N1Q9yUZoAx9RvxpTQMzM=;
 b=idrPsnmcE99Z62AdhyMLuXmpXlzvOxoF5cNWgGxl88cLIqERBt/JO4TZb+DBkHuxRM
 9HO/fyC0yNbS7R1PFhD+/W3YKYAjhb+i+Zef11NOOY5Pf1cqDFK10KgWstu9oE9EMj8z
 u6vfBrb4TsfrDzMU3/zSaQwC6SIGzlMip4jBhP5IZU+IKsqd+l6zHt+7xTIcD49BzCQm
 idrTNLDdVr09zunOiv3/klFe64gzffoVbBT3Qg02WThQcQAsE6qNg/ryx7CDviPjcty8
 apfZHtK7oFvD+0JYk4NhNQvVG91xb/77OZ0hM4frIoulCjNslFdZXr+jF+2EwK4LnaX3
 kzJA==
X-Gm-Message-State: AOJu0YwXh9BUrhC5lSBVk3p04CGrLZVR2VnmwFNEe6kGh/MJ/nj99FgC
 e2slct+KBzJWPX0aC0B6a0QYDo4hmolZcoXb0+XOFA9XCmZRlrpyUqxf6aE89FgJ1QXh0wo8MoO
 jcSiH8L/OJfy+EkJdaOgjqNMyE+U=
X-Google-Smtp-Source: AGHT+IFcCeuVppPjvxBd1c7Wk4MtZjS/PW7FGdh3tr1sBnhjXNgGH5nVkE5xoUKe7kanbSoGhtTtwG14Phq+9BdsUJw=
X-Received: by 2002:a5b:8:0:b0:dfb:5c7:6ccd with SMTP id
 3f1490d57ef6-dfb05c77313mr2249316276.42.1717797879396; 
 Fri, 07 Jun 2024 15:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1717779951.git.yann.morin.1998@free.fr>
 <8f7f18c9f67543b5e6b534bc0562c4a8a44a73c4.1717779951.git.yann.morin.1998@free.fr>
In-Reply-To: <8f7f18c9f67543b5e6b534bc0562c4a8a44a73c4.1717779951.git.yann.morin.1998@free.fr>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 7 Jun 2024 16:04:27 -0600
Message-ID: <CADvTj4rcjwuSj_A-OQH7UCDu3u1OoUn1qA-dXaeYXJVaYiPOPA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717797879; x=1718402679; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DuR8/5QZ1gt3UKafpp3gKQ/N1Q9yUZoAx9RvxpTQMzM=;
 b=LONmv2Ox6NFjwQDu2hTwZ079wTyZ9koDpuF750yUEwd8ltZWbJCvVIPmI1syOBmybu
 AffmOdKD8dAFE4S2PPZPc3J/2E2GbVpFE9EFXknpZJEGJmzpcvh+hqi5z4K5xQcgME0i
 SLWehNSOVd59jPNdeBeHrtstrv8YP1t3ixdLKk0HQJRLZszpSTTyAO9YpbZTHZ28LCfS
 +i4B+FX1+tEtE8eVSooIUN/09jKSowHUqhdr4xwlZS6W0Z8KmeDvQtweFCSlE7XCwn6V
 SUBWcYTbalaeBbbxQhZweBtgtudlnuCnWHkpiyZmbQz9ub2PV0jgvnt7C7/xpYqhAtt8
 6Dww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LONmv2Ox
Subject: Re: [Buildroot] [PATCH 12/20 v2] package/python-bcrypt: use
 post-process opts to pass Cargo manifest path
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCBKdW4gNywgMjAyNCBhdCAxMTowNuKAr0FNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9y
aW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IFNpZ25lZC1vZmYtYnk6IFlhbm4gRS4gTU9SSU4g
PHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgo+IENjOiBBc2FmIEthaGxvbiA8YXNhZmthN0BnbWFp
bC5jb20+Cj4gQ2M6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+
IENjOiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Cj4gLS0tCj4g
IHBhY2thZ2UvcHl0aG9uLWJjcnlwdC9weXRob24tYmNyeXB0Lm1rIHwgNSArKy0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvcHl0aG9uLWJjcnlwdC9weXRob24tYmNyeXB0Lm1rIGIvcGFja2FnZS9weXRo
b24tYmNyeXB0L3B5dGhvbi1iY3J5cHQubWsKPiBpbmRleCBmMzEzNzQwMWQ3Li5mMDljNjc0NDFl
IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWJjcnlwdC9weXRob24tYmNyeXB0Lm1rCj4g
KysrIGIvcGFja2FnZS9weXRob24tYmNyeXB0L3B5dGhvbi1iY3J5cHQubWsKPiBAQCAtMTksOSAr
MTksOCBAQCBQWVRIT05fQkNSWVBUX0VOViA9IFwKPiAgICAgICAgIFBZTzNfQ1JPU1NfTElCX0RJ
Uj0iJChTVEFHSU5HX0RJUikvdXNyL2xpYi9weXRob24kKFBZVEhPTjNfVkVSU0lPTl9NQUpPUiki
Cj4gICMgV2UgbmVlZCB0byB2ZW5kb3IgdGhlIENhcmdvIGNyYXRlcyBhdCBkb3dubG9hZCB0aW1l
Cj4gIFBZVEhPTl9CQ1JZUFRfRE9XTkxPQURfUE9TVF9QUk9DRVNTID0gY2FyZ28KPiArUFlUSE9O
X0JDUllQVF9ET1dOTE9BRF9QT1NUX1BST0NFU1NfT1BUUyA9IC1tIHNyYy9fYmNyeXB0L0Nhcmdv
LnRvbWwKPiAgUFlUSE9OX0JDUllQVF9ET1dOTE9BRF9ERVBFTkRFTkNJRVMgPSBob3N0LXJ1c3Rj
Cj4gLVBZVEhPTl9CQ1JZUFRfRExfRU5WID0gXAo+IC0gICAgICAgJChQS0dfQ0FSR09fRU5WKSBc
Cj4gLSAgICAgICBCUl9DQVJHT19NQU5JRkVTVF9QQVRIPXNyYy9fYmNyeXB0L0NhcmdvLnRvbWwK
PiArUFlUSE9OX0JDUllQVF9ETF9FTlYgPSAkKFBLR19DQVJHT19FTlYpCgpUaGVyZSdzIGEgcGVu
ZGluZyBwYXRjaCB3aGljaCBjb252ZXJ0cyB0aGlzIHBhY2thZ2UgdG8gdXNlIHNldHVwdG9vbHMt
cnVzdAppbmZyYXN0cnVjdHVyZToKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0
L2J1aWxkcm9vdC9wYXRjaC8yMDI0MDYwMjIxMzMzMy4yNTk3OTgxLTEtamFtZXMuaGlsbGlhcmQx
QGdtYWlsLmNvbS8KCj4KPiAgJChldmFsICQocHl0aG9uLXBhY2thZ2UpKQo+IC0tCj4gMi40NS4x
Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
