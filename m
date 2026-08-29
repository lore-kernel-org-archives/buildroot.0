Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C64C61DD6
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 21:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EBB960611;
	Sat, 29 Aug 2026 21:30:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v7OLSf9JE_L3; Sat, 29 Aug 2026 21:30:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788039045;
	bh=K53XyIq7HfI+3yuRGQwuTFwDoMvt7HbGl16ccGCqqWg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qkM3HihQ4iQu75C3KPnUfLP2ozuSl4QOTVq3TBR/rHIX7eMMSKgCHqpS86lJg63yv
	 ywRy/g/AWOPEvIoZT/zCopGL82MjzZGQqjEApVc8poAwUyO66qnKZjr9IB+4GPgO8Z
	 +KFx5McMql/XKFtFV2YIXT0SUwj6rQitjtR6mKiwUPg/b37sEDPyf6LzzMPTIyQZp6
	 TmIxLsBWkCOaEO7Q1Z9BmSqSiAjGWsDBDzuNbEkXrF7CBcVF9ks9PXT/PRFfopRFuj
	 auZLvzCitKu+Ghe3PMDNbrLwNVyZPcl4ehy4Y8TujuCDteNcCVEUBm96gw0dWmRRJ6
	 AhGYZ38cXm+lA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 720F6605EE;
	Sat, 29 Aug 2026 21:30:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2ADAA355
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 197DD40689
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:30:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OfWAhQFzaQ4t for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 21:30:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46D5340680
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:30:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 082DB4E41427
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:30:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AF9346053C;
 Sat, 29 Aug 2026 21:30:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A861211C781D9; 
 Sat, 29 Aug 2026 23:30:35 +0200 (CEST)
Date: Sat, 29 Aug 2026 23:30:34 +0200
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: buildroot@buildroot.org
Message-ID: <apNPP38PPcl1Qsfj@windsurf>
References: <e74945f5-b386-78e7-722b-38add0d4dda1@crashcourse.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e74945f5-b386-78e7-722b-38add0d4dda1@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] docs/manual: post-image.sh/post-build.sh
 should use '-', not '_'
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

On Wed, Jul 29, 2026 at 12:26:54PM -0400, Robert P. J. Day wrote:
> 
> Even though it's only documentation, the form of the names of the
> post-image.sh and post-build.sh scripts should be consistent with the
> names of those scripts used in the code base, using hyphen, not
> underscore.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 

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
