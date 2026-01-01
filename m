Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D8FEEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E60781BF4;
	Thu,  1 Jan 2026 09:47:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dqMvwKTCj8ZD; Thu,  1 Jan 2026 09:47:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CE138188A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260871;
	bh=vx0psqrfxG82o0QcYSIDUG5LfV2uJf6MaJuxaCCpit4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sxRCEw8j7/l9xOUFEHnsvwhVqi+JcPhLN9UIdGWRnDavsSlpQJ16Fg7IpPk6iquZw
	 D3IvA1nqv/AMj1RU6TvmrEZ8q5hVD0h2lOHmNMe4AhGK2qlVZrYIUN1RnUW58YlUaK
	 mLA6PeKgfkWH6vbJ4KRZBMABMV6D4WIbg5ImtHNxj5z1l7N68O7AHo6y8f5ZmIBFrm
	 GWFmrXeTNA5ZUGBEBNJ0HFgfUyIW+U3q8LWizPJ5Us8BxLHnEzFSEeuEKllt7QNuy5
	 myrcjB/VHqC6RY2gvAE46GqCjQv/NeGBHzObc+Zfuuv3mpebM5UK0yROfwrlLJ4svW
	 gZFjAn7dfOurQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CE138188A;
	Thu,  1 Jan 2026 09:47:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C2B0206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82D6440168
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ufygnq4cIob for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:47:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 74CEF400A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74CEF400A5
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74CEF400A5
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:47:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B6C534E41ED2
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:47:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 87BEA606B6;
 Thu,  1 Jan 2026 09:47:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AA090113B071F; Thu,  1 Jan 2026 10:47:45 +0100 (CET)
Date: Thu, 1 Jan 2026 10:47:24 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260101104724.07c6e9eb@windsurf>
In-Reply-To: <20251231232010.748783-1-james.hilliard1@gmail.com>
References: <20251231232010.748783-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767260866; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=pUSfhCL4nV27co1AsWC0tfNInpq7OTGOQjK96iESJxs=;
 b=wTu8NuwEXZRlXjvpJHfXX9UG2BdvbNNwWxByBeq7AhwyaitSDkkyt6lMSDwCJPxNxgIIWL
 O1kPNX3JX2sw8N5QDohA4q1AOqFx5YnibwW20WtWJka5vJmsL10Z088U4Z5IpeeFR1ecEp
 Wqe93P9KR7s9jXvxNOAD5Rpv4sXm+bbo1ZwjU0LXubxLWmW2SgweBUs2W0xjg9eOp+cnqR
 MBmjsVo5KlYWmdJLbuyGxcAIyabYy2+RANjOcmv25o7s4nubpGB6SYJll8N4CjSJfqjQkA
 VIt+5XxSerrppxQKYXY8e85kuyhAieUTdQ9J9WTRbEF/zNQ0SoSv8jHV2EPztw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=wTu8NuwE
Subject: Re: [Buildroot] [PATCH 1/1] package/python-poetry-core: bump to
 version 2.2.1
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

On Wed, 31 Dec 2025 16:20:10 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-poetry-core/python-poetry-core.hash | 4 ++--
>  package/python-poetry-core/python-poetry-core.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
