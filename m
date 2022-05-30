Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA22C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 20:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2471B40C9B;
	Mon, 30 May 2022 20:58:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D_XUVLIaWTIT; Mon, 30 May 2022 20:58:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 503BA40C88;
	Mon, 30 May 2022 20:58:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EA00C1BF31A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D82C140C88
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:58:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xSf93Jrjj12M for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 20:58:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BCFAA40AEF
 for <buildroot@buildroot.org>; Mon, 30 May 2022 20:58:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BC64EC0006;
 Mon, 30 May 2022 20:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653944325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zt8oFDGPVHgThXEPZ+W2AljmPgl+zAFO44AvsI3SVUQ=;
 b=CIk2ODOBvC0WMuEFi74hV+C9qomXnEVN7Km1fnt3oIwS2pp5/8Xx2zqfOKl7fFo51BVoqd
 BjEMEDXvCLzgK8ZjQoSQTOeNwYnJFYC+q1TTZbWrgDLNjO34OO5nsxyd3/udDVKFvFh55C
 nXj/jj5HMd4j1Naq7ssLAMaRHvHla38QjF1r5R899Js9HHU+7J+tsobRLGO+eUc06QYUU/
 w9IUkzjL5t1UKiCt0mOo5fW9MzEFj8H0my6DFK04xvYVwhotWmB3eBkzkACFvflY0+aRQx
 NZj8WG2ek3PUTF+KA04STxZWYfaNa9dZmhH+25YroZ/wnFzyk40Sj6BHO7N68g==
Date: Mon, 30 May 2022 22:58:44 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220530225844.541fd44c@windsurf>
In-Reply-To: <20220521122922.207122-1-fontaine.fabrice@gmail.com>
References: <20220521122922.207122-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/boost: fix boost-log build
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

On Sat, 21 May 2022 14:29:22 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with boost-log raised since bump to
> version 1.79.0 in commit 7fa88b8eb637f5ec4927ac1bd05309dea7d60bc9 and
> https://github.com/boostorg/log/commit/3cbc2585c3b7ff5d884a6c337a99525b57fa184b:
> 
> error: at libs/log/build/Jamfile.v2:59
> error: Unable to find file or target named
> error:     '/boost/architecture//mips'
> error: referred to from project at
> error:     'libs/log/build'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/edcc7c7f3586993a77b6cc06ed02363a42c09a83
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ips1-to-mips-and-alias-mips1-to-mips.patch | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/boost/0002-Rename-mips1-to-mips-and-alias-mips1-to-mips.patch

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
