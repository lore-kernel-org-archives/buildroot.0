Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCFBEEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3E4480E7E;
	Thu,  1 Jan 2026 09:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rFXC0NEugfQt; Thu,  1 Jan 2026 09:47:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC20A81498
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260862;
	bh=/UozNpFOaiakiu+VsuHBwbunAsEjlfZ907YZjf/JxqU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=q2EdLqwVx4ldrfe278Z18V4J6WLGBvG8A5Uh7Ha2bagbnbCtsYRgSsE2+i1No9pAQ
	 qbdblLBeQqHuQfWY8mOQ3v1w/9Oe6e88YDAD1WL1Gvq0HjiViRgVJNxc7ckRRrs3rh
	 z91APzjy/QzM6AGLBJYFHBbP5rl1IXgkj+q+/N5KcunGq9LLfNOuGbRs3Nsm/yzS7a
	 KF5AMqlj2hOFD/5tE9gJS/7zhUqUUYxSIadJPIDr8K1SBb1VfM8blXjFFqpe+LScGv
	 jhyLJodO0OhkzjK8dufxiiZYvslamj5/l3cod3RxLjYmpIkpcnkDBNlQoN3j4beEm9
	 JNW6bCB9j7VRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC20A81498;
	Thu,  1 Jan 2026 09:47:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F4221351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D72654049F
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:47:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbn5YVQrwEks for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:47:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B1BCE40490
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1BCE40490
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1BCE40490
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:47:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 8ACD84E41ED3;
 Thu,  1 Jan 2026 09:47:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5FCEB606B6;
 Thu,  1 Jan 2026 09:47:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CF817113B072B; Thu,  1 Jan 2026 10:47:36 +0100 (CET)
Date: Thu, 1 Jan 2026 10:46:02 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, =?UTF-8?B?RmzDoXZpbyBUYXBhasOzcw==?=
 <flavio.tapajos@newtesc.com.br>
Message-ID: <20260101104602.1a20e0e5@windsurf>
In-Reply-To: <20251231191345.3991740-1-james.hilliard1@gmail.com>
References: <20251231191345.3991740-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767260858; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6gO0UoYC0jVLE2SS1ahlh4f+3zRtEeRLxDb5KhTHLcE=;
 b=ncKPq0TEoYBZjLdbaCBSy4GRRfgqTJ7YifhbrpiMuBJuiRwCMe2pxRGJ+CTOmMXRhM0Cc0
 sNi5KU4ktNix6Ubcmacv2uimQV7zV3sKrK1F9TeqDZl0fCq9Vo0t1yt9AZMYBvNv9wBjG9
 MBWzq0edhC2tX3j8WUOR4/AaR9yO3HWZQO66ccBT25VANu+O5DOp0w2SLs5U/o/OWVr5Ao
 0GvvDH4oHvDexR5yuyuGDM0MC2xZjUnRiBwt8YkcS2rn/NJzm4NJ8RSoDvqS5GDq9psSC+
 8sbIYF3U9NLsqxq6KFTlM70drIypqPc4G54nYV32IA1bBXTWxXeTYxpUJKiYEA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ncKPq0TE
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: bump to
 version 2.0.45
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

On Wed, 31 Dec 2025 12:13:45 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-sqlalchemy/python-sqlalchemy.hash | 4 ++--
>  package/python-sqlalchemy/python-sqlalchemy.mk   | 4 ++--
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
