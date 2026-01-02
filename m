Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EF4FA3750
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7B2981EC1;
	Fri,  2 Jan 2026 22:07:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id blWjOSHSXJ7B; Fri,  2 Jan 2026 22:07:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F24281D7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767391652;
	bh=DyZHLWdL4KQOH5JBINZ+H0Wqu1/mkZf4UViL5Lt5WgA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SQ5ZFhpgUeNln2LTlBEPUNjt0VI+K5kuuhiwG3sTInmEWlYBFXnBlSbXQxMsYK0Ev
	 7782ff7KZAwmCP753h5/q9SRpm+p+oykCyotnF8XHQAA6xTnwwe09Cle6J/4luw18c
	 Y4nblPDk4qZm8X3be7yzmxS4znc3qwKAz/DfTuJF++3hXr+xRqU57Jra+i/nyXILns
	 nQW4tiGOOGtu90B92AxQdvh+g+7OKwGdfmMFcLX2uZstS+zqteTeVrTROblgLBZuhK
	 9gpU85Yl8mMZyJaNVJG95eOtUP5QDf2IKxNmzvbEoqeDDGhu35FT6yS7+Xc9vZCko0
	 J7JpyzNJIkCFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F24281D7C;
	Fri,  2 Jan 2026 22:07:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B239319D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2FD160725
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O_2IFI2_EInW for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:07:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9C7996063B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C7996063B
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C7996063B
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:07:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 0FCD94E41F05;
 Fri,  2 Jan 2026 22:07:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D409C606C7;
 Fri,  2 Jan 2026 22:07:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2003A113B023D; Fri,  2 Jan 2026 23:07:28 +0100 (CET)
Date: Fri, 2 Jan 2026 23:07:27 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260102230727.3f6ece64@windsurf>
In-Reply-To: <20260102213303.101526-1-james.hilliard1@gmail.com>
References: <20260102213303.101526-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767391648; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=9FXve0lk+0UrJH/b3MKtR5HG9rJHS4pH8EIJAJtsyTE=;
 b=zQjGdq/lGzhCxD7mhPsFf9BAY44s3gw3djiLeCB8rPaD8ql3tniwuLzvbWhOteHKuHtCdh
 q5JoTZfUWK32JZ21tSwWDLE2ZSOPEaR4x5wHXhEzY4PSskQA8iVyF3bj/rAli9QwhzUBg/
 Qu3OfEIrAMAon2SJOnb8efARfhPa5wFQn+KYoeQX1AjhzcQowlw3BnEy3t3J/Jivu2QLCH
 ExOXzIp0nS8XOpUNCk2i5TEGlOYBltExp9g1LIW1+ugWyfStMESb/h9aCz1XKhShOM7uDs
 c+/ogZke+virXzm3R/9oXrlqL9GbNLqBScmqx4ddKvOot4I8za0yEGVzEGKeew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=zQjGdq/l
Subject: Re: [Buildroot] [PATCH 1/1] package/python-logbook: bump to version
 1.9.2
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

On Fri,  2 Jan 2026 14:33:03 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Migrate from setuptools cython based build to setuptools-rust.
> 
> Add new python-typing-extensions runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-logbook/Config.in           |  2 ++
>  package/python-logbook/python-logbook.hash |  5 ++---
>  package/python-logbook/python-logbook.mk   | 10 +++++-----
>  3 files changed, 9 insertions(+), 8 deletions(-)

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
