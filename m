Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5217D68BEA
	for <buildroot@archiver.kernel.org>; Sat, 16 Nov 2024 11:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22CD984968;
	Sat, 16 Nov 2024 11:41:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4q0iuldyQRBi; Sat, 16 Nov 2024 11:41:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D59A84985
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D59A84985;
	Sat, 16 Nov 2024 11:41:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F5F71EB8
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 11:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DA82848AD
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 11:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5o80X_G05Ll0 for <buildroot@buildroot.org>;
 Sat, 16 Nov 2024 11:41:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8BD3D84985
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BD3D84985
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BD3D84985
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 11:41:05 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:ec16:eb41:83aa:c38c])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id EB2C52003DC;
 Sat, 16 Nov 2024 12:41:02 +0100 (CET)
Date: Sat, 16 Nov 2024 12:41:02 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <7opalrcyhtutrjkml3fft75cwwl552wzrbjqaadcknxcabkyfz@vdsn7euegqyq>
References: <20241115224753.1074295-1-ju.o@free.fr>
 <rdst6ihihplrkwh3gmueiwb3ge5q5kzamczdsi62qsenuijhbj@n44frqrgrkcw>
 <6c73b165f5bf165e5d63633a25dd6087@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c73b165f5bf165e5d63633a25dd6087@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731757264;
 bh=9pjLyOR40rmc4aTUu/rSkNJvCHVFKhaWoiBBalcZPxY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LhpVhZsZOouv/j09Xi72ItIcWsA+IIAaGgs2CmsGGKwn44CfhTT/EkuXBFgotDhge
 O4wleYUJ9G6gKDYHbiNmdnNN3n+tOx0N8MDzNdIj+PSsRywj1JfAQSqRkMBX2emI/Z
 pDSRL9qs03gd1IA2xCIUHksdl+jk6ReWVaOdnboKbcoem4hRfeIqlZFY5197ZDONxM
 eI85rdICfLVbn3+FDvSyxgmXHq+k/wSCs9GLqHNFV81B/dYsw264NJveySN3GGp/qh
 lfHBb8TtzjnSnbZ95UiWSqkqJkvtbieo3rErm3hzUPQdeTWIFcUsAeYiVpfiriESDD
 sshzKzZCC6pYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LhpVhZsZ
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: new ltp-testsuite
 runtime test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Nov 16, 2024 at 11:28:56AM UTC, Julien Olivain wrote:
> The primary intent of this test is to check the Buildroot package recipe
> is able to compile the ltp-testsuite correctly and install it on target
> properly to be functional. It will be also useful when updating the
> package.

OK, it did not inderstand that it was the primary intend. I was guessing
that the intends were to have a broader LTP scope of tests.

> What did you have in mind exactly? Testing more extensively a
> specific defconfig? This could be done outside the Buildroot Gitlab CI,
> for example, by a defconfig maintainer?

I understand your point. We can limit the time allocated to running the Buildroot
test suite, while LTP+Buildroot could be managed as a separate GitLab CI/project.

So the current proposal for LTP check is OK.

Reviewed-by: Vincent Jardin <vjardin@free.fr>

Best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
