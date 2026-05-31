Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996C9CD5BD1
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 12:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 292DC41F1E;
	Sun, 31 May 2026 12:10:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WocT091jZVTp; Sun, 31 May 2026 12:10:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CE4A42BEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780229411;
	bh=rtm4+ncWPvlc1UQM2epGAb6Mf+8xB+909Ok+i2CrDrI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jcTSUvCa7Yb324Y2lJXwDV/1cyrSbP4hGfo0XG6/b7tqCzkCJOF96d+dUqDQDrcUC
	 sVmHkdr3W7XC4KAbzyb3mDzya4WbnsD6tCFlDmyZc/VQHPXGFaYMnlBXdDa1yPi5fi
	 KyPIu4aR9F920G9wrDRG3hK+dieakpHuPjtkXgGrHnyRKsEaFUDWYFhIT4PLbUUswx
	 R56XdTHW5tPIGEv36CeSWDBY0UrW64RacsuEVI3A83+c5vEfAOlX2B1OhG3eaK8l5Q
	 uLEMXSlTIYgotAP6mngRyQkBjiL4xNDq+M6osN9leB3V7HEoTChUXX3q8Gg4Rwe5dr
	 N+rfQh/+TvuuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CE4A42BEE;
	Sun, 31 May 2026 12:10:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FD4CF4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 12:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 111E042BEE
 for <buildroot@buildroot.org>; Sun, 31 May 2026 12:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q9LDrPN8xwRO for <buildroot@buildroot.org>;
 Sun, 31 May 2026 12:10:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0580341F1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0580341F1E
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0580341F1E
 for <buildroot@buildroot.org>; Sun, 31 May 2026 12:10:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 3BB6DC62474
 for <buildroot@buildroot.org>; Sun, 31 May 2026 12:10:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AC76360230;
 Sun, 31 May 2026 12:10:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BC47110888CC7; 
 Sun, 31 May 2026 14:10:04 +0200 (CEST)
Date: Sun, 31 May 2026 14:10:04 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <ahwkx2cSTCf4sJjF@windsurf>
References: <20260221081458.865721-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260221081458.865721-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780229405; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=UBytrhrQ+EaJ9JppWfLWa+Mbrk8BqXQcwTZtjARQuXU=;
 b=N0F7im+fBWOWnKuTFW5HFPayPXhKvArV6rqgNp+xcnP/BTzsBPa9XzEDHiqKocWo5ExJIG
 PkQv4cMfn3/lziOhkBm9dhPrVdP4CIwQpMdPSMaFUl+2WUqxA0I3GA2IMXNuX40vRIsqNj
 ed5aTIf3XT5fdiBBNsTpvyF8AvbzZQJf8XDp229VPcOalVikGfIiz0TuPHBxEdlhMf/YKP
 NFdyKdP+ynnz6l8TuB0/+pHVrM6pSQQqn3ZqjUCgr2brOAlT29oVaLhqrRzQxJs/3BP97f
 OjC7NH2XK2kLannrfWA9+VtSk5t08U9VI3VrODnjdG1KwCf98s5KhMr2jNo7GQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=N0F7im+f
Subject: Re: [Buildroot] [PATCH] package/libmpeg2: fix build with GCC 15
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

On Sat, Feb 21, 2026 at 01:44:58PM +0530, Shubham Chakraborty wrote:
> GCC 15 defaults to C23, which no longer allows K&R-style empty parameter
> list declarations. Fix getopt(), getopt_long(), getopt_long_only(), and
> _getopt_internal() in src/getopt.h and src/getopt.c to use explicit
> typed prototypes. Also convert K&R-style function definitions to modern
> prototype style and replace the bare getenv() declaration with a proper
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

When fixing build issues, please either a reference to an autobuilder
failure being fixed (for example in this case
https://autobuild.buildroot.net/results/53d/53daf0b4bd8b476252ca219e53a966405ece7e51/build-end.log)
or if none is available, a defconfig that exhibits the issue.

> diff --git a/package/libmpeg2/0005-fix-getopt-modern-c.patch b/package/libmpeg2/0005-fix-getopt-modern-c.patch
> new file mode 100644
> index 0000000000..a95e443df2
> --- /dev/null
> +++ b/package/libmpeg2/0005-fix-getopt-modern-c.patch
> @@ -0,0 +1,108 @@
> +--- a/src/getopt.h
> ++++ b/src/getopt.h

Patches must have a commit log, a Signed-off-by line, and an Upstream:
tag showing that they have been submitted upstream.

The Git repository is at https://code.videolan.org/videolan/libmpeg2.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
