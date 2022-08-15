Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C62BC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 20:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0830F60BFC;
	Mon, 15 Aug 2022 20:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0830F60BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rRbWP6Z7SjBS; Mon, 15 Aug 2022 20:22:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3730460BC9;
	Mon, 15 Aug 2022 20:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3730460BC9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6585C1BF33F
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 20:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4060381767
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 20:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4060381767
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hOvmj3ne5w2m for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 20:22:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEF9E81766
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BEF9E81766
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 20:22:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1C68C240005;
 Mon, 15 Aug 2022 20:22:02 +0000 (UTC)
Date: Mon, 15 Aug 2022 22:22:02 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220815222202.7e091cb3@windsurf>
In-Reply-To: <20220809193425.9359-1-ju.o@free.fr>
References: <20220809193425.9359-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660594923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B022k++4fLyzjGiqLXsFvixHGe16u2XUMWgnhheYqIQ=;
 b=YFxahXFHExABHRgCVf2Exofu+2CK6VVZlREMYKSpDj0ZCiptl+ildxABTYP69ffqSekBuZ
 tQd1Ne271SNvfBZ9NFXPWw6Jfwt0qcQ2Wiprq09d+PBTr+zaHS0MBMEjwSDZXjm1DdqKoZ
 j3ZX5est9K+85tSm0Q8PAQghwJUrTuClFY6Rh3ZtzYQJ7pHmAC7/MP1oY1xQca+45f/m5w
 s9C9NPwqmMN5R/twLfYFyvYd9mn3ccg2PuzKi9Ryee6tYWVLPlepliXn4zkBgwZYBcFl6e
 aW6EQ2LeNwgXdDPmnPwypax2gI3YP8GqTy7QpkVzEgl43zerGb5a9djYWwtSmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YFxahXFH
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual/prerequisite.txt: add
 findutils in dependencies
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Aug 2022 21:34:25 +0200
Julien Olivain <ju.o@free.fr> wrote:

> The "find" and "xargs" commands, from the "findutils" package are used
> during the build process. See for example [1].
> 
> Even if it's a quite common package which is almost sure to be present
> on the host, it should be listed here. When writing new recipes, hooks
> and scripts, it is generally safe and portable to restrict to the
> host dependencies listed in those prerequisites.
> 
> This commit just add the missing "findutils" package in this list.
> 
> [1] https://git.buildroot.org/buildroot/tree/Makefile?h=2022.05.1#n737
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  docs/manual/prerequisite.txt | 1 +
>  1 file changed, 1 insertion(+)

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
