Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E36C2BB3F
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 15:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE91F81FC0;
	Sat, 18 Nov 2023 15:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE91F81FC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aMvBjwMXhasq; Sat, 18 Nov 2023 15:43:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 182ED8200F;
	Sat, 18 Nov 2023 15:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 182ED8200F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E2C41BF38C
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 15:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 356864187F
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 15:43:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 356864187F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bDKZJAkJMIPj for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 15:43:01 +0000 (UTC)
Received: from out203-205-221-245.mail.qq.com (out203-205-221-245.mail.qq.com
 [203.205.221.245])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2926741877
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 15:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2926741877
Received: from smtpclient.apple ([120.245.20.22])
 by newxmesmtplogicsvrsza12-0.qq.com (NewEsmtp) with SMTP
 id 7662EA6A; Sat, 18 Nov 2023 23:29:38 +0800
X-QQ-mid: xmsmtpt1700321378tx3x90cdb
Message-ID: <tencent_1946493A872A809D31D057B4A5F5A6D0FF06@qq.com>
X-QQ-XMAILINFO: OZsapEVPoiO6p98ZxRMYrnkzrw9J3AwEDVMUR+t0tNOjRrkRNmcA8Kg7E/a1g6
 NtHx9GWR1K/CJafPqsB7LP4ugPgpJl8/7YT+sk2ojncjXLM1YD4rcfHbWIpxKcAwG0wME4srQifT
 qjd+Y8BiwoBxRVc3N2eUcE2O4RK3jK5GNzNXyWh15ChgWvp2BlcA73PnAFco39PJpfTccJFhCiSs
 BgXdW6hb73aYK9H9V4GAM2uHGixySaFnhXXUCeH/MLfPKFr6yH/CBLKdq4HrgOzuF8wh5b1mO9LB
 zqTFeRFJ1SNp3nC9e3X30DIK/SM/dmpe47PEsTw3gcZgDV37Td1yEO6Vt5dJdATG/tUywTT1RwUY
 yJyJKFxYdKA4j3iLjUdPnT3UTBsAqWlGYiq6QnaOzxQJsWNm2DXuaVF/gPESfzh+l2ca2V3V6Ouc
 RGpOQ0HhdBiia3fCxE/hzgB0tFugYEhTaUNmWW/OLR4HoV+Df4M5RYDSNs63hNrqWNfkB2g3I6+p
 tOU0khUcDDc11CmQ0sXPWv7nI7Hcvz/gThWb0yMg9OaJLkfTXVAefRbj8k56h2UUFf6ivFFd6Ud7
 4lbfrrWT2Ge0q2+YP6ydZx36RMvrSWQm95Qzms+0KG80vX+1qCKpJxbLVZM8iwF9LE5kEwFOffk1
 IH75DcQLl0To8xETijVwB9vqTP49AOo7Hv1EB9KSJXLkPOuN45NVdSTvSwTK2jQHzpu/iuPJRtKU
 aesEO+l7JKEKcHslnW0SUuRBndWcV4dG/1xrgTGkr+IKpXNrrLFi3+UoeBRofTZO7hOY7VoRHLsk
 Ljaqvt7MOPTqlziitH8LxD2EhaZoNrSt4bwYiEVlskwnT1mVyVwhPyC1Lnvd4ecr/SXSG40gEBY6
 Hn6d8q5erAr9ATd5cmTpek8s7gt0nD1XJt9a9aozo0VC+0Qac7TCIxviH2hwBgsa1RHNT7X+dl/v
 EkFSSSZMYywqdMgldfwsC1Tm/NNR/9INvbhKkgXooxwuDLQ0IfsA==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.100.2.1.4\))
In-Reply-To: <20231118151127.GF996011@scaer>
Date: Sat, 18 Nov 2023 23:29:27 +0800
X-OQ-MSGID: <8FB2CF37-894B-4E9C-B068-983D361F4EEA@qq.com>
References: <tencent_757F73E3FFB48495C31F20C1B8F0CBDBD205@qq.com>
 <20231118151127.GF996011@scaer>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailer: Apple Mail (2.3774.100.2.1.4)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qq.com; s=s201512; 
 t=1700322177; bh=LmxCy9HHYwt+a0atFp5KpMK6kDFuD7oJLP7oW5vezHk=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=e55A5tM+KaPaqDOz/NG77LT8kOZyGulNvKQxT3NBEEEpEYAe2Rm/oX0pOdR+7TEdD
 GsB2lCOhqQeLTeqBWTesHRKSUbAQSTLOuiebgS2GoGpoCg9n37ohoHXUUKitIhUrro
 IQt+nhptqvh5rqRsg61hyq1OcCg258Pt/NQxHe70=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=e55A5tM+
Subject: Re: [Buildroot] [PATCH 1/1 RESEND] package/wiringX: add GPIO
 library wiringX
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
From: hanyuan via buildroot <buildroot@buildroot.org>
Reply-To: hanyuan <hanyuan-z@qq.com>
Cc: Samuel Martin <s.martin49@gmail.com>, Hanyuan Zhao <hanyuan-z@qq.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwKCkkgYXBvbG9naXplIGZvciBteSBtaXN1bmRlcnN0YW5kaW5nIG9mIHRoZSBS
RVNFTkQgd29yZC4gQnV0IEnigJlkIGxpa2UgdG8gZ2l2ZSBteSByZWFzb25zIGZvciB0aGUgZW1h
aWzigJlzIHJlc2VuZGluZy4KClRoaXMgZW1haWwgYW5kIHRoZSBhY2NvbXBhbnlpbmcgcGF0Y2gg
aGFkIGJlZW4gc2VudCBmb3IgbW9yZSB0aGFuIG9uZSBtb250aCwgaG93ZXZlciwgdW5mb3J0dW5h
dGVseSwgSSBzdGlsbCBnZXQgbm8gcmVwbHksIGV2ZW4gaWYgSSB3cml0ZSBhbiBlbWFpbCBhZ2Fp
biB0byBTYW11ZWwuIEkgYW0gbm90IGNsZWFyIHdoYXQgaGFwcGVuZWQuIE1heWJlIG15IGVtYWls
IGlzIGJsb2NrZWQgYnkgZ21haWwgYnkgZGVmYXVsdD8gU28gSSB0cmllZCB0byBlbWFpbCB0byB5
b3UuCgpPbmNlIGFnYWluLCBJIGFtIHNpbmNlcmVseSBzb3JyeSBmb3IgYW55IGluY29udmVuaWVu
Y2UgY2F1c2VkIGJ5IG15IHJlcGVhdGVkIGF0dGVtcHRzIHRvIGNvbnRhY3QgeW91LiBJIGFwcHJl
Y2lhdGUgeW91ciB1bmRlcnN0YW5kaW5nIGFuZCBhc3Npc3RhbmNlIGluIHRoaXMgbWF0dGVyLgoK
VGhhbmtzIQoKS2luZCByZWdhcmRzLApIYW55dWFuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
