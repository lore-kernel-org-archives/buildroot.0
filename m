Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFB9CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EA98845C6;
	Fri, 29 May 2026 18:25:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r0zb-GSpfkYG; Fri, 29 May 2026 18:25:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4905845B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780079134;
	bh=om8GkoJ5BX5+AxKbgGauWvBooJ4Afyze7d2aGTc33Fg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oSmqZjyJr2GYGMY3264RtfP11u+pzsnmEYC4+v4H+auTzsNINjXIJPHrvojnMsI/X
	 9osdMa5x4RDOdDYOUQoBgMkoTdJtaVv0zoKW4ROn38GqDxZIXCj060+uUqmB0/mSvb
	 7lB3GjZVdgslOVS30TPBUQ97F3aC7/h83F3L/W9A0BCDbArMGuvN7DLK5ll7j6Qnlu
	 9WDzEMMl8tZQ83jbp0y7uo8hjPPzN74TmsNXoIjW/pzQpRch9xFwqwXi6K+sjUo1cM
	 E8h4+/Zd6IF1EqHRyW/xfJ6HICo2ywIxWwd5iwOLwo6vFdOxQaVy0v8YEgy03NFS9f
	 m2ow7bvlzBywQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4905845B8;
	Fri, 29 May 2026 18:25:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E79B2D3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5D258458D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:25:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CpH7rB4m1Nu5 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:25:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EE834845B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE834845B6
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE834845B6
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:25:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 13D681A373C;
 Fri, 29 May 2026 18:25:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DE1F3601FA;
 Fri, 29 May 2026 18:25:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9F7BF10888CCD; 
 Fri, 29 May 2026 20:25:27 +0200 (CEST)
Date: Fri, 29 May 2026 20:25:26 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <ahnZwDLIPUGRd0Gp@windsurf>
References: <20260426102215.3100043-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260426102215.3100043-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780079128; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=Sdq6/PDglKwk8pbjPn6KCQMRQzzGeJnLb0/MJsxhqsA=;
 b=G8PybytB7C8LCHHTjkojsvdx1gvAhir4dPzSAbQdlECEVLLkZpuJa//dgAAOxddDUq0rxS
 jmL43GP4+frdYgNGn56yVMoBoUbKwjdBHORQvQVhi7GFx2xDSeE6OY55C+ggkP2wGfhUdq
 Vot0DKVRZ0oID6rRWOh4cwV+mENHTxZuc+TrPhjDeDtS917qCJFBbN3Uqc7qQbbdVCzZtm
 LK2QSmy8EAdhQLcXlJi5FH3AjL/br72WVfDp5wskYQtDRl84h1UOXsSH4xrzKimtgplOM5
 KqUAqlmQ0mJTiAzt+S8zPk/UEZVPX6oHrWV+xVilq97z3xEhQH/cZg0K2lTZsQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=G8PybytB
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux: fix non-MMU build
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

Hello Bernd,

On Sun, Apr 26, 2026 at 12:22:15PM +0200, Bernd Kuhls wrote:
> Buildroot commit 31af509b4f4fe52f67bd9109b8732a55b8f9cd2d bumped the
> package from 2.40.2 to 2.41.1. This bump includes upstream commit
> https://github.com/util-linux/util-linux/commit/a3f1255f1891ddbaf3bb6a32af28569c0e6f3b91
> which was added to version 2.41 and includes the usage of
> pthread_atfork() causing build errors on non-MMU platforms:
> 
> libuuid/src/gen_uuid.c: In function 'uuid_generate_time_generic':
> libuuid/src/gen_uuid.c:629:17: error: implicit declaration of function
>  'pthread_atfork'; did you mean 'pthread_join'?
>  [-Wimplicit-function-declaration]
>   629 |                 pthread_atfork(NULL, NULL, reset_uuidd_cache);
> 
> The oldest build error of this kind can be found on the 2025.11.x
> branch with version 2.41.1:
> https://autobuild.buildroot.net/results/87c/87c74435be14956fd45f730269eac102e70d56da/
> 
> A backport of this patch to the LTS branches should be considered.
> 
> Fixes:
> https://autobuild.buildroot.org/results/a21e81e64eccc866b575a4f3b1376c50f2ffd837/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/util-linux/util-linux.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index 1271bc7dc0..99a6be976e 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -130,6 +130,11 @@ UTIL_LINUX_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -Dstatic_assert=_Static_assert"
>  UTIL_LINUX_CONF_ENV += LIBS="$(UTIL_LINUX_LINK_LIBS)"
>  UTIL_LINUX_MAKE_OPTS += LIBS="$(UTIL_LINUX_LINK_LIBS)"
>  
> +# pthread support uses pthread_atfork, which is not available on nommu
> +ifneq ($(BR2_USE_MMU),y)
> +UTIL_LINUX_CONF_ENV += ac_cv_lib_pthread_pthread_atfork=no
> +endif

Thanks for the patch and the detailed explanation. However, the
configure script has a check to see if pthread_atfork() is available
or not. Why is this configure check finding that pthread_atfork()
exists... and the build then fails because it doesn't exist?

Basically, your patch is papering over the real problem/question of
why the configure check is not working as it should.

I've started a build to have a look, but if you have some insights,
I'm interested.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
