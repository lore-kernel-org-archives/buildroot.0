Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C028AC19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 20:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45F42402F7;
	Thu, 11 Aug 2022 20:43:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45F42402F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 63UVw8ILf_Ne; Thu, 11 Aug 2022 20:43:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67BDA4013D;
	Thu, 11 Aug 2022 20:43:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67BDA4013D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 736D61BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 599CA40341
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 599CA40341
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5WgWUDQikyBr for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 20:43:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08D7840296
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08D7840296
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 20:43:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EBC0D240004;
 Thu, 11 Aug 2022 20:43:40 +0000 (UTC)
Date: Thu, 11 Aug 2022 22:43:40 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220811224340.28c115cb@windsurf>
In-Reply-To: <20220810200241.34141-1-fontaine.fabrice@gmail.com>
References: <20220810200241.34141-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660250621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jp0ba0kOXNDsHGIE+9teR7w1GVskNIt0n9+RS1Y2GNU=;
 b=Bv+tBq3nxgyT1vag73Qgsck2ycBQFCE8LTuidOje9gmyRTWvMwsTIC9JV1Ai7kk6IUNRxA
 oJoGKzDM+IgUahiZUHlFV+yvZv5aCZegng8ZQZwJX+E9OTg6WgKk1dCzY+9ZVnRmSn6h3K
 KJSVtU9ZooQiT6xFOKPZqle79O/i1+jf8h/FV3UM8YKvaprNo2txDcGZgachVD6PN/FVDi
 6/OdxMpfIE1SfUxamFoQA0/hlnDHj8dZj8oBY32SKb/FDUPinCyfSuF4zSmbgjRyy7K31p
 FPdvhxXyOsvsLO3TZuRkeaTienE/GvJsThIdCwczWq81yQj1Ljp76uoN/+mw5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Bv+tBq3n
Subject: Re: [Buildroot] [PATCH 1/1] package/ljsyscall: fix build with
 aarch64_be
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

On Wed, 10 Aug 2022 22:02:41 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> luajit supports aarch64_be since commit
> 28e5c2f2bdd147dbb9aefbc040fc618f46ee0663
> 
> However this raise a build failure with ljsyscall because aarch64_be
> directory does not exist so use arm64 instead
> 
> /usr/bin/install: cannot stat '/home/buildroot/autobuild/instance-1/output-1/build/ljsyscall-0.12/syscall/linux/aarch64_be/*.lua': No such file or directory
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/78397c83e84dbfc09990f92be93e0b8a10d014c5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ljsyscall/ljsyscall.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
