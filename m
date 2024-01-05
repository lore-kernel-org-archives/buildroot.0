Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17468C47079
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 13:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B63E1436F1;
	Fri,  5 Jan 2024 13:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B63E1436F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZInwqeAQuJqV; Fri,  5 Jan 2024 13:06:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0DBC437A2;
	Fri,  5 Jan 2024 13:06:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0DBC437A2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 56E661BF990
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2131543748
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:03:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2131543748
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rwWwaEK5aAG0 for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 13:03:37 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D908943703
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 13:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D908943703
Received: by mail.gandi.net (Postfix) with ESMTPSA id 103C4240009;
 Fri,  5 Jan 2024 13:03:34 +0000 (UTC)
Date: Fri, 5 Jan 2024 14:03:34 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240105140334.6ac1bbe4@windsurf>
In-Reply-To: <20231226221952.2006884-1-fontaine.fabrice@gmail.com>
References: <20231226221952.2006884-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704459815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dbmlBRO8ESMeYviHEoOPwmPJJ92/qevooM47zvkS98A=;
 b=T3WGzwMV3i7Z4kSp/C/uthftnCgvwT2neB9oYk67weL0H6vFlZgRdEH1hxDP2OWjuAc1BO
 JhFwfSVkwpNK+dQXVmCxxQGWAw8VwV/4i9hSScYV/ZDmCRyoaBlINuXpM02A07UFIDLr+A
 we0rHAB+/ARU0jht9+J2j7PnSjy2QJvXhYkULpOMilFdhRRwqoxzSnMF+u9pXzc6MMmYVk
 1wPgGt8OECvDo1y6q7yflF3wLB033mO9Lp6K8DSTiXvrGGWg+7I9u0vQXPqRMJq7mbKeEV
 mby8JGdo/8qQ8Ux4el2ipe0PF00AOppAoD0kR9e5z2zZW3rqp0G1XzMDwY8eJw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T3WGzwMV
Subject: Re: [Buildroot] [PATCH 1/1] package/libwebsockets: fix wolfssl build
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

Hello Fabrice,

On Tue, 26 Dec 2023 23:19:52 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following wolfssl build failure raised since commit
> d6319d97a7864314088dcc6d1199f35029cfcecb:
> 
> -- Checking for one of the modules 'wolfssl'
> CMake Error at lib/tls/CMakeLists.txt:79 (message):
>   You must set LWS_WOLFSSL_LIBRARIES and LWS_WOLFSSL_INCLUDE_DIRS when
>   LWS_WITH_WOLFSSL is turned on.

Ideally, in such cases, it would be nice to extend a little bit the
commit log to explain how the issue is resolved: "adding a patch that
does XYZ, and making the wolfssl dependency only trigger when
BR2_PACKAGE_WOLFSSL_ALL=y because ...".

> +Fixes:
> + - http://autobuild.buildroot.org/results/fe062b9f0b330e71309334d7605d64ea73761b59
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

The Upstream: tag was missing here. So I dug in the upstream repo, and
found that your fix had been merged, so I added a reference to it here.

Applied, thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
