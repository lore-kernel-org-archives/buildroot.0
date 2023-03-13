Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08CDC6FD19
	for <buildroot@archiver.kernel.org>; Mon, 13 Mar 2023 21:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48E6A81426;
	Mon, 13 Mar 2023 21:54:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48E6A81426
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uSN-Er3Wi5uE; Mon, 13 Mar 2023 21:54:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FCE380C93;
	Mon, 13 Mar 2023 21:54:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FCE380C93
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F13D1BF282
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 21:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCD6E60A77
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 21:54:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCD6E60A77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KWlftmyM0FdZ for <buildroot@lists.busybox.net>;
 Mon, 13 Mar 2023 21:54:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88CF560D4C
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 88CF560D4C
 for <buildroot@buildroot.org>; Mon, 13 Mar 2023 21:54:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 63408240002;
 Mon, 13 Mar 2023 21:54:32 +0000 (UTC)
Date: Mon, 13 Mar 2023 22:54:31 +0100
To: Roman Passler <roman.passler@gmail.com>
Message-ID: <20230313225431.45802c0f@windsurf>
In-Reply-To: <20230313183235.2665-1-roman.passler@gmail.com>
References: <20230313183235.2665-1-roman.passler@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678744472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LgBjrIqXcpNCjjojOKw1hEUpNywB/fdWXlBp5jGMLxQ=;
 b=XRS9fte5/JQoHpMkC0KncA78Nax+UjLEdoj+YGcOdLmCjMX6rJYdOla6ymvdd8Hcznx/21
 B8e6zuKepiNqDEUqj+RMa+wM+9aE54R55OsnCYuUKOK0DMVkIEI6fnkYsmDGxlMQjfEFwT
 owhqwc49f4ZDAvROwKo+z5ivHIQCRzz58WmbjN1322YG6YrSE5bC0jM/gKrJ5lgCciAyP5
 FfLCH0R3RVpB69CgMtakPmO3s+WB307WKfS3I+mGUs6CfitVw/PPL4Lrwtek+3Fx+6FKtW
 uXVdLvoo1AEuY0MUa5qp3WokecznKr6BqcAn5cJV++1k41ylnOYv8phteQzYVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XRS9fte5
Subject: Re: [Buildroot] [PATCH 1/1] package/openocd: bump to 0.12.0
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

Hello Roman,

Thanks for your contribution! Some comments below.

On Mon, 13 Mar 2023 19:32:35 +0100
Roman Passler <roman.passler@gmail.com> wrote:

> Change-Id: Ie76a4f365af3f59c80241fe4935129d1098b140d

Not a big deal, but we don't need/want a Change-Id in commit logs of
Buildroot commits. If you can easily avoid adding one, it would be
great.

> Signed-off-by: Roman Passler <roman.passler@gmail.com>
> ---
>  package/openocd/openocd.hash | 6 +++---
>  package/openocd/openocd.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/openocd/openocd.hash b/package/openocd/openocd.hash
> index 91eb56d930..325f55bf04 100644
> --- a/package/openocd/openocd.hash
> +++ b/package/openocd/openocd.hash
> @@ -1,3 +1,3 @@
> -# From http://sourceforge.net/projects/openocd/files/openocd/0.11.0/
> -sha256  43a3ce734aff1d3706ad87793a9f3a5371cb0e357f0ffd0a151656b06b3d1e7d  openocd-0.11.0.tar.bz2
> -sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> +# From http://sourceforge.net/projects/openocd/files/openocd/0.12.0/
> +sha256  af254788be98861f2bd9103fe6e60a774ec96a8c374744eef9197f6043075afa  openocd-0.12.0.tar.bz2
> +sha256  1b8f7e37ee5afbbf95c2a4d62b12b25232e29538692663b434318503a9a88419  COPYING

Could you please add an explanation in the commit log about why the
hash of the license file is changed?

Indeed, we precisely have such hashes to detect changes in the
licensing terms, analyze them and check how they affect the overall
licensing of the package. So if the hash is "blindly" changed, having a
hash doesn't make sense in the first place. Therefore, we ask to have a
short note in the commit log that justifies the change of license file
hash.

Could you have a look into this, and send a 2nd version?

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
