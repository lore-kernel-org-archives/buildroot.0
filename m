Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4240C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 16:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63E8E41912;
	Thu, 10 Mar 2022 16:00:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9SsaU7V5cwoa; Thu, 10 Mar 2022 16:00:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92BB6418FF;
	Thu, 10 Mar 2022 16:00:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7EB8B1BF375
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 16:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A3D761211
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 16:00:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pvwzncAlYhcH for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 16:00:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B37B611C2
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 16:00:39 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id m12so7531335edc.12
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 08:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vQsO+NS0DnjBTt6HTO1d/Xfb6wVhYvEYljmkL4rVX4g=;
 b=w8ERax22XUVBzI3cmAQLwIcNpxZuqu9fG41bJGf8yqWO77QI+jBsLingjjrn5Bq9N9
 ju3iTdhuIpvNQq5qEIZ3k8UQ7J4cr7xEaK2JPoDzOvAooRe5SdueRt4oPRdv//q9Xoko
 jvV//kXkFjumMBLDGOyEYNsCd4PX3IivIzgJcntXGoI5xatUqAwOolURgnYi/s7kuLi3
 Mx0scEmAPW32lJZ9OXxCRsnDGZIOH2CCR7KNuTEtQAaK04aXrcj7VUxTu9n84xmZAs48
 sxehxRpyqRJV7PYHQJj4Yy8BULxFTgXUqjuyUFo4Da6PG0BAKnBFCIKkID6vRAGsE56B
 rnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vQsO+NS0DnjBTt6HTO1d/Xfb6wVhYvEYljmkL4rVX4g=;
 b=SXXiHJDdm410ormU5OskoYNhk4MuljHUPW/1yfwqH1Ipoi+1O2zLYGzdKiAoglCc1g
 amPEavAn0VtGMbWQTh4Sv5/W1Y6WYQiVFEfmVaB+dLTH2hwg6uRcDoYDy8KBICLt4ujY
 qTQZpxzSVvcRcxR5ot4lUT4ww6sM3nTvNVDlPrYo8AeDzSe7s4Ofk+wZA6+Oh7AL019y
 4oRyRd8gMxaOuTVezhNBi9sDlIvogdHsz0edTDULmb4AsBJMgU56M9nr1N0D5/MnWhNS
 ViDLmu/oWDLNROz1pyuJXbl040kD+4leKLH1jRjGeg3Fxy7nEBmvSheAXSjih8VdrCrw
 ZBDA==
X-Gm-Message-State: AOAM533qmAYIIuzEee5v6Bc6mYIx18Mz8gcgHDFjWcY5tbk4BNRPwos8
 4ywK4lx36LODjeOjyCp50wjm4CvqpQETN3lKVWlMb3FvysxGJq1/
X-Google-Smtp-Source: ABdhPJxszZBcnPs6V0xDJJT+Uolateukm7f68Rl/hge+SlnIjqi2m6mLYp/tLdKTzFtpfrOk1cMzEneLsjutbb83tWk=
X-Received: by 2002:aa7:d5d9:0:b0:416:1dd3:7714 with SMTP id
 d25-20020aa7d5d9000000b004161dd37714mr5050769eds.256.1646928037340; Thu, 10
 Mar 2022 08:00:37 -0800 (PST)
MIME-Version: 1.0
References: <20220310080745.16903-1-clement.leger@bootlin.com>
 <20220310142836.2c8e1787@fixe.home>
In-Reply-To: <20220310142836.2c8e1787@fixe.home>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Thu, 10 Mar 2022 17:00:26 +0100
Message-ID: <CAN5uoS-XqPQhf8V3R22OQAVoDBuBNXHXit65bV2B-ZP2FWMwGQ@mail.gmail.com>
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Subject: Re: [Buildroot] [PATCH 0/3] boot/optee-os: support new optee-os
 3.16.0 build dependencies
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQ2zDqW1lbnQsCgpUaGFua3MgZm9yIHVwZ3JhZGluZyBvcHRlZS4KClJlZ2FyZHMsCkV0
aWVubmUKCk9uIFRodSwgMTAgTWFyIDIwMjIgYXQgMTQ6MzAsIENsw6ltZW50IEzDqWdlciA8Y2xl
bWVudC5sZWdlckBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBMZSBUaHUsIDEwIE1hciAyMDIyIDA5
OjA3OjQyICswMTAwLAo+IENsw6ltZW50IEzDqWdlciA8Y2xlbWVudC5sZWdlckBib290bGluLmNv
bT4gYSDDqWNyaXQgOgo+Cj4gPiBOZXdlciB2ZXJzaW9ucyBvZiBvcHRlZS1vcyAoPj0gMy4xNi4w
KSB1c2VzIHB5dGhvbi1jcnlwdG9ncmFwaHkgaW5zdGVhZAo+ID4gb2YgcHl0aG9uLXB5Y3J5cHRv
ZG9tZXggdG8gYnVpbGQuIFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCB0byBidWlsZAo+ID4gaG9z
dC1weXRob24tY3J5cHRvZ3JhcGh5IGFuZCB1c2VzIGl0IGluIG9wdGVlLW9zIHBhY2thZ2UgdG8g
YnVpbGQgdGhlCj4gPiAzLjE2LjAgdmVyc2lvbi4KPiA+Cj4gPiBDbMOpbWVudCBMw6lnZXIgKDMp
Ogo+ID4gICBwYWNrYWdlL3B5dGhvbi1jcnlwdG9ncmFwaHk6IGVuYWJsZSBob3N0IHBhY2thZ2UK
PiA+ICAgYm9vdC9vcHRlZS1vczogYWRkIHN1cHBvcnQgdG8gYnVpbGQgd2l0aCBweXRob24tY3J5
cHRvZ3JhcGh5Cj4gPiAgIGJvb3Qvb3B0ZWUtb3M6IGJ1bXAgdG8gdmVyc2lvbiAzLjE2LjAKPiA+
Cj4gPiAgYm9vdC9vcHRlZS1vcy9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAxMyArKysrKysrKysrKy0tCj4gPiAgYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5oYXNoICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMyArLS0KPiA+ICBib290L29wdGVlLW9zL29wdGVlLW9zLm1r
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA3ICsrKysrKy0KPiA+ICBwYWNrYWdlL3B5dGhv
bi1jcnlwdG9ncmFwaHkvcHl0aG9uLWNyeXB0b2dyYXBoeS5tayB8ICA3ICsrKysrKysKPiA+ICA0
IGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPgo+Cj4g
QWN0dWFsbHksIGFsbCBvcHRlZSBwYWNrYWdlcyBuZWVkcyB0byBiZSB1cGRhdGVkIHRvIDMuMTYu
MC4gUGxlYXNlCj4gaWdub3JlIHRoaXMgdmVyc2lvbi4gSSdsbCBzZW5kIGEgVjIgdXBkYXRpbmcg
b3RoZXIgcGFja2FnZXMuCj4KPiBUaGFua3MsCj4KPiAtLQo+IENsw6ltZW50IEzDqWdlciwKPiBF
bWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyIGF0IEJvb3RsaW4KPiBodHRwczovL2Jv
b3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
