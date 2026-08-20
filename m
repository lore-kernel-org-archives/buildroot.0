Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCF9C5DF81
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 18:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10A1A80F31;
	Thu, 20 Aug 2026 18:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4_t8PONK27NG; Thu, 20 Aug 2026 18:45:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787251507;
	bh=e2Y66J/V+w8rz9j5b6PPngje9xqVmwrc+nQ1mI1OZLQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DMszjjDpJt8UFgH2WWcdJXYrXwnjIbSBmU0LlasS+tRpEkDqKyA/RUqWQ7fqkibfx
	 oJ+YxgBis/H77xQI6oUWfqRvEKMrPabcqE/nV+vu/pZgJn0Pd6WV4lLHZUocXHp6iD
	 xTey7pjQHhcJo2GXX/7qE7LlM5ksKjCaDA+PHc6TT0ryg87fHHOalNG8WtbrTdEqBd
	 FRA9IcqgYu78YFGlAkmW0c0LsmDInsHwedBcYTvz+RS6BR74nzb9oimz59La9V6doG
	 vuKZk92AtEQuOV+jYkHLT6muSQURowbrX0gY5d0Y2KfY2l4F4Ic9yq4HQg8WfSk61U
	 gAlRFae3ev1tQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3019680F1B;
	Thu, 20 Aug 2026 18:45:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B470FEA3
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 18:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A97244040F
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 18:45:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z3psIL-OxseB for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 18:45:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CEFFD40363
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 18:45:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 273CA4E41305
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 18:45:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CE3685FF59;
 Thu, 20 Aug 2026 18:45:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F0F9811C76678; 
 Thu, 20 Aug 2026 20:44:55 +0200 (CEST)
Date: Thu, 20 Aug 2026 20:44:55 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: Buildroot List <buildroot@buildroot.org>
Message-ID: <aodK_V5XZwTZ3S_L@windsurf>
References: <20260713113710.1732927-1-chakrabortyshubham66@gmail.com>
 <aoNuO__aQMnMl0ni@windsurf>
 <CABvxksxYWcRQHZospOPy=dCRWqWkp6Cf2J8FpsDnqZZ0ObNY4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABvxksxYWcRQHZospOPy=dCRWqWkp6Cf2J8FpsDnqZZ0ObNY4Q@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/unrar: bump to version 7.2.7
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, Aug 20, 2026 at 10:32:08PM +0530, Shubham Chakraborty wrote:

> The Buildroot autobuilder reports that CVE-2022-30333 affects unrar=A0
> in the stable branches (specifically 2026.05.x, 2026.02.x, and 2025.02.x)=
, as
> shown in the automated emails.

But then for our stable branches the question is whether we want to
bump unrar or just backport the CVE fix. Also, if you don't explain
such things in the commit log, how are we expected to guess?

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
