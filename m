Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACA2C4167B
	for <buildroot@archiver.kernel.org>; Sun, 10 Dec 2023 17:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A07C81AA7;
	Sun, 10 Dec 2023 17:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A07C81AA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ryFvFTygrY6R; Sun, 10 Dec 2023 17:38:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB02C81E5F;
	Sun, 10 Dec 2023 17:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB02C81E5F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 308201BF21A
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 17:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0072E40423
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 17:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0072E40423
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I4EArvIASzEi for <buildroot@lists.busybox.net>;
 Sun, 10 Dec 2023 17:38:10 +0000 (UTC)
Received: from out203-205-221-164.mail.qq.com (out203-205-221-164.mail.qq.com
 [203.205.221.164])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E17704173A
 for <buildroot@buildroot.org>; Sun, 10 Dec 2023 17:38:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E17704173A
Received: from smtpclient.apple ([101.5.160.146])
 by newxmesmtplogicsvrsza1-0.qq.com (NewEsmtp) with SMTP
 id 96B0ACB8; Mon, 11 Dec 2023 01:37:43 +0800
X-QQ-mid: xmsmtpt1702229863tj81ygkku
Message-ID: <tencent_30C4D795E5D466EAFF63C90C072000A93106@qq.com>
X-QQ-XMAILINFO: MmPNY57tR1XnTdiK5+0PIG+zwJPsbjcY/lodIwM4A38trKKH2a9JMr5dJRHzdd
 vHG0YLZl7NxXFd5JLJ0HcDsVTsE4+ulKkAS/yYykalymQfC4EC+X4ciP4r8JPi23n1XbxwRs9wUO
 zPU2C1iQmgedljlne1KVx5WEhCq0cpNKDhdsst6v3hwXIH0hG9+czTsWvRh0B6nUefOl1RhWtAgL
 YI4JJBCtwZ4zexkBGVFqiQQr7BF4ggCEh1lRyzt3eesYF4f//uDZTLboOaFXtRoqTxTE2mU6lGVZ
 WDZFzqM7mkN+sG3IA5lJNB8mQ503kQT5I8b0W5JwVWKdRlTHBtjfpfwuIeg8hB8iY90hch2VLjv9
 hqggSygG8PT9YxvIwtloqOiy9m6hBKSMIfRYiQpdIij++LxwK+Yzn8r6+hVoJsbAuqwywcG6Cood
 qrRVBrETCBeoJ4px4PxhElFwV0GF6di0MWmhKc6LX8h3Fk80z5dfshjp/vyBG0PHsAD7foynRDQY
 8ehBSuVgOD4cHR+lxaSgfIokzVHcANDr1gBIupYK0U3EoTooK27bndhQIxcrKa4kNl+xEqdCmwV3
 JZh2uNKyDBXJKMVfYB+nXhJZ3vIldbwWEHwspQpwgC0d/qNMa3C3TYY3fMoLPLiOppW+xq1php83
 0aaEzPQ+ZBH2YxKPv96ILG7uPBkRT4xmdlLidWOxnpan+6i2OchgUPAu/AWVH/5jBxlLp1nfkWwv
 yqeirTsNMccv/5KEPOfAmjkt7C6ILSkEgvUl4zbhu+lMLl9APW+9i0KHqhPTiwAwUYQ0C91RHsmR
 2DsHyAWyCpY6Ehfe+0wC7h0Kduk8Ha+3VwVjWnPYLXXDhmGtFAR/NfpzDGsdIXugM/6lAx3Hm2vQ
 ox3MU6g2HsT+pAwfOcyS1jPA8Cf/1N6TYuewT+U93OGCcphKNr2bHvidoh076/wID3tGfwck8Z15
 ihemt+J5PyDnUw7nilcnfuMtsGCqAjck46HIxsPi/3OTY1/MTrZQ==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.100.2.1.4\))
In-Reply-To: <9f83b7b8-a4d9-43c2-bd36-2ce1a1509ef6@mind.be>
Date: Mon, 11 Dec 2023 01:37:33 +0800
X-OQ-MSGID: <48731580-90BB-4549-9196-290A02BCC41C@qq.com>
References: <tencent_3E8054E385AF0DCBE94DC17FAD12060E6707@qq.com>
 <6f2a8850-7610-4e6b-bc50-43394f6c2eeb@mind.be>
 <tencent_D458CE6C52FEF7947073D400B41A737C190A@qq.com>
 <781f37c6-6bf0-4214-8e33-c3ef51929172@mind.be>
 <tencent_DE40A3F1DD57B325D9A6C37F68893E470206@qq.com>
 <9f83b7b8-a4d9-43c2-bd36-2ce1a1509ef6@mind.be>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailer: Apple Mail (2.3774.100.2.1.4)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qq.com; s=s201512; 
 t=1702229865; bh=I3Kk88QOO48ZSq8cIrbxz3dFXoeqHBHXnymrLwbwOl8=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=mWt2pv8Sktq538ZzCeuGvp4UiTxi9+HLTkg0yPIWLFg3FVPVNvF60hqrZRoWEsHa1
 4SCbN7T4i9MY4mM+03PMKIv9MN3OXXSJ3omAvs9dnC0QfPxcWTrBucHe7amuESjzyR
 AbdAdsnRKCFakAyfDAvWuukDFRgm7wLLrSoyHxtw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=mWt2pv8S
Subject: Re: [Buildroot] [PATCH 1/2] configs/milkv_duo: new defconfig
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
Cc: Emil S <emil.soltys@outlook.com>, GP Orcullo <kinsamanka@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Arnout,

Glad to receive your review! These days we modified our patches and resubmitted them. Now there are two patches marked as v2 available, which almost meet your requirements. Could you please take a look on that? I am grateful for your patience and kind assistance.

Best regards,
Hanyuan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
