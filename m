Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9383CA5FA1
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA29460632;
	Mon, 28 Sep 2026 21:08:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0peOhBDbCdz; Mon, 28 Sep 2026 21:08:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 72BAA60615
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790629716;
	b=VivqsW6bcK93sL2NxkQuq4d3xeyURh8sCrE+nXfp95Sw+IDd5hFv/BoVt/sLAiibN8Qb
	 t+m5ovKUDFi73GcV0y+zSLVf+KFOC0LgKb/aw3apmmDT6piLi5fJ6ZpXcUcGCTazFgkkP
	 NtOcqboZe3/5ek8bnOKlFWaB0EMi3zFuf3bjCjJdHcLEAGyhPAkAB88OuPLNYLSW41isV
	 3PgeeIgXGTL18EF08YsdekrmkyLGlTKuJDwobMIT5+aHD7lKpHvkiZ5/Z/rk4sXPJMbfC
	 pU5Uxun8q0+tNN349ZbM3SM0DhdZIudIHUUT+1+yoiVgFm21Yfx7qpQP8gcfeG04Ogg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790629716;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wp8jC2d29p3recAIwt3N3ObyVQLln5+kE3vWQ3fzbbk=;
	b=FU7xi3rpz9YVWRKp2/2NoGmirvHQ6zR0BNsaXaoAA1pLKsvGEVIY4NW+ot8z2+WH1fdl
	 5wdiPvJtAdNniyBHHwE1EzlZQeinijnOXtRxDSFYey7MXfRTxBgnkA+7+poUQck6rSQPN
	 DB+iSi/cm83ESQnjCpZVDUNLt1q7IaoNU429WctuJc8zl92ZtCV27klv0OhVwqrZUigfB
	 0ghlGuir3q4WZi8fnbT0/LoE1U31RaRanMH6+bcpc72y1Q0VQ5Rc0HxyaJS/HsH153e7Q
	 YELMJiAnuL15BFH6vg3xjU0+HGm+sxtTouWKiCpMMqGqXSheDc7FAEUKq13kY7B4uFg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790629716;
	bh=wp8jC2d29p3recAIwt3N3ObyVQLln5+kE3vWQ3fzbbk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZVeChpL9rZnuK7hgguQOTMOIHPlbnn3719T0sczO4IvH9LH5cLV3Ru4bFZu/rHKKy
	 AzlTL5rdT36qKOAVYpgCI1gD/FNNYzz2Nl7z44SRFveW3jkoVwcILYUATnsaWSXUL8
	 HHKFHamTMJhWcJT+Q/HJTr/sw412+wOivX3iP4zgpRGlEg0IJVJ1A1eUQXAJjzJSiV
	 RMBJOuIp2GIay3ghK5JlNENHnoE/yhjlIcdtyIq95qrQd12g5SVXa6aPvF86ubdJ2H
	 iPui5WnxGGTqL8sMjyeQLCZ6wHOdEMuswnRnYm1srGzsOFgQ8YflwqBcxatZfgKV0b
	 1w831R+w/+AMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72BAA60615;
	Mon, 28 Sep 2026 21:08:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EB48F3D8
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD02E404E0
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:08:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RRlGPA4Uzjl4 for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:08:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5079E404A8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790629713;
 b=ic95FeGok1VXeTE5bNJEDhgmdFIGrd5onmBnAdrOXZ+81wV/I9yXrOQ8rV0+fH0g8wWE
 1IehwmBJiso+95b8DH+SvhGsI8IEx1jFpS1CJv2iL8PfpX9OPau+36gOoWsDQkfTJeqMA
 WYJwb7yZR38b5k+tV+mJPy2xJKPwvKU+yyZ/lOKDAji7DmYiDqrhjFUgNc21y0U5/LAQV
 Ji6++KA+XU37QMbebPxVBoYqCq3dXSpLK4+w3utWFq6I7u8HhCg+N6GIlXNA0sJ5yay9q
 QAUqECkzuXucBY/w8ePEcvmOOfLxF5NPyQk2VStDg7mQq212kdAl9W2YlUP61fwzd/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790629713;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=8lvHDInGYOdJZciQoK1hIl7FixjHGIZaZpz/wZK+hTY=;
 b=EPIOesAE+MtQG5+z6t5ccbmkTQAcStU+1shg/HNJuP5YZ3NwivTERfit97OL9VgSYYXY
 zebwPbv8hl/Xns/f+JJg8e2wl2W0F9c636eRMSfzGflkylI2DLHqFYxekkAI+LyzSoxAU
 kSCc3faDIFfAyHXGnmDBgmgfoV/F7w8tIzrsWIbucxgrxR/oz+Ij6gWFuW+owAO22qMRd
 Y9AIzc8JwrFXiCsIuuysIN2li2ggKnZhsKf4BidbIgnmNosmZwUjpqH8r7NxgeiMGvR/Z
 ic7dQAvPMVXkJFVjim0wkjGBwlXsdnfo15b9blPYcRep2lh2S88K108cJbC5F01M+Bw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=wqYDK6Gj; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5079E404A8
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:08:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E599C4E410A4;
 Mon, 28 Sep 2026 21:08:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B915F601BD;
 Mon, 28 Sep 2026 21:08:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7C2661032975B; 
 Mon, 28 Sep 2026 23:08:29 +0200 (CEST)
Date: Mon, 28 Sep 2026 23:08:28 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <arrXRtDO_Fb9QAgJ@windsurf>
References: <20260928154804.1214400-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260928154804.1214400-1-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/wireshark: bump to the latest
 upstream v4.6.9
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Sep 28, 2026 at 05:48:04PM +0200, Titouan Christophe via buildroot wrote:
> Wireshark 4.6 is the current Stable version, while 4.4 is the Old Stable,
> see https://www.wireshark.org/download.html
> 
> See the major changes from Wireshark 4.4 to 4.6 in these release notes:
> https://www.wireshark.org/docs/relnotes/wireshark-4.6.0.html. Of notable
> interest, libxml2 is now a required dependency.
> 
> This is not considered a security update because all important security fixes
> that landed in Wireshark 4.6 patch releases are also available in
> Wireshark 4.4.19 (currently in Buildroot).
> 
> Side discussion: Wireshark 4.2 is now EOL, see
> https://www.wireshark.org/docs/wsug_html/#ChIntroEndOfSupportPlanning
> As of today, Buildroot LTS 2025.02.x distributes Wireshark 4.2, and
> therefore we should consider bumping it to 4.4.19, or even apply this
> patch to bump to Wireshark 4.6.9 which will be supported for longer.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
