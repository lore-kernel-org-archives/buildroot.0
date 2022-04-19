Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50048C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 19:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB225408E1;
	Tue, 19 Apr 2022 19:36:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mwUNHLTKp2tP; Tue, 19 Apr 2022 19:36:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A7CC408E8;
	Tue, 19 Apr 2022 19:36:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 43A0D1BF867
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 19:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4046C828C5
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 19:36:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nnIzHviEd-Ut for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 19:36:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A277828AA
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 19:36:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 06F4E240004;
 Tue, 19 Apr 2022 19:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650396979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u0BafXSVBEsDtT8lk3Cm/ak157bEh9nqaCkXNG1a/UM=;
 b=ePrZEaszdVIX+7UPXQOKe4dYadL3ILgUsiSrObN2JQ1cjxwZyHBsN+V2xGk/jmIFnyk14j
 VTvqsABhUAcCbk9XYZ5+FsFx2mE7/zz7sKBVR4/7kmwTuINIstwhuRPgoOYha15EolBVQh
 WjRB7fgmz66aw/8GZP0BzusaEEF1ro/xf4oUUsfu3RItoKZ8oTD1K3YvWVBR6yXmZ1Xwbn
 fQCZR6rVo4Iy9ogSUidaSpGAlXIc+QUO2szjdQTkjrWb3pj81MJdq1WvcSSih32zh1Qi33
 4TtTg6ZgUeUL5ccsGJ9u7Gm9FOUze4Dn5QSueWlktFkVQmGq7VrrJNHhveibaw==
Date: Tue, 19 Apr 2022 21:36:18 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220419213618.58920b81@windsurf>
In-Reply-To: <20220419121409.2055818-1-fontaine.fabrice@gmail.com>
References: <20220419121409.2055818-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] boot/shim: disable on mips64el
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 19 Apr 2022 14:14:09 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure on mips64el raised since commit
> 11b347c03ab0b38389ec11b48f63236a3b4d6547:
> 
> In file included from shim.h:47,
>                  from shim.c:14:
> /nvmedata/autobuild/instance-17/output-1/build/shim-15.4/include/system/stdarg.h:72:2: error: #error what arch is this
>    72 | #error what arch is this
>       |  ^~~~~

As usual, I don't like this kind of fixes that consist in simply "let's
disable in the specific case that causes problem". If you look at that
include/system/stdarg.h, you see:

#if defined(__aarch64__) || defined(__arm__) || defined(__i386__) || \
        defined(__i486__) || defined(__i686__)

...

#elif defined(__x86_64__)

...

#else
#error what arch is this
#endif

So basically, any architecture other than the ones listed above is
going to raise this build issue, not just mips64el.

Yes, BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS already disables on most CPU
architectures, but shim also has its own list of CPU architectures it
supports. So we probably want a BR2_TARGET_SHIM_ARCH_SUPPORTS, which
depends on BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS and then adds an explicit
list of architectures that shim supports.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
