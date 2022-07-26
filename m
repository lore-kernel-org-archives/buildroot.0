Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0759C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 20:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69D8F408E1;
	Tue, 26 Jul 2022 20:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69D8F408E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iP7GnIY7XJRo; Tue, 26 Jul 2022 20:01:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43E11408D3;
	Tue, 26 Jul 2022 20:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43E11408D3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3800C1BF27A
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1283160644
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:00:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1283160644
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id leO6f0wjawf5 for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 20:00:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E960A60608
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E960A60608
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 20:00:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 100001BF203;
 Tue, 26 Jul 2022 20:00:38 +0000 (UTC)
Date: Tue, 26 Jul 2022 22:00:38 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220726220038.0405c026@windsurf>
In-Reply-To: <20220726195248.44796-1-fontaine.fabrice@gmail.com>
References: <20220726195248.44796-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658865639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CjZEoBVhqCmTrb2CnCaNpJoBX+S12arfmQn1me+JMyg=;
 b=GUToj9EijQ4eijIXbrIsBv/6GGg/KQLLPQBMS+SkuizltC6FcE2bTQG2pu3fWXcDAUCBCy
 kWt/2WywyKjqRjeXWt7wWP1bMUvJ19GXoO6EklZUCNKYdTdmccc8HioLbNcG9z0f2h7IyG
 x93WJSP4Xp83782V3bsGBv8Ksu1srpr5zRYdstF26FfG+tdsC9JiU07oxvcR8XaSfKpitd
 88AudvBHfED0UXxaSjC3f3h+TJGGCUtkyPM7Tb61Wm5L86UkL2+MM4asvx7kyGQ1Af5c7u
 wjRvDGM9MCEGtWy4Wf8+4z0bJzUwYug73Oa5Q8T89mrUmtKQAEJY9Rxxktmfwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GUToj9Ei
Subject: Re: [Buildroot] [PATCH 1/1] package/fscryptctl: fix build with gcc
 4.8
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

On Tue, 26 Jul 2022 21:52:48 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with gcc 4.8 raised since bump to
> version 1.0.0 in commit ib832f6eb9d86920907c50901a99f13b44dd94647 and
> https://github.com/google/fscryptctl/commit/9dba7224cbde07df25ba01146a2f6fb897bb9e56:
> 
> fscryptctl.c: In function 'string_to_mode':
> fscryptctl.c:214:3: error: 'for' loop initial declarations are only allowed in C99 mode
>    for (size_t i = 0; i < ARRAY_SIZE(mode_strings); i++) {
>    ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/58e8facd9105dcdfbc21ed245de03f3162c98cc9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/fscryptctl/fscryptctl.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

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
