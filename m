Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B57BC43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5381440ADD;
	Thu,  9 Jun 2022 20:33:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S62EZAtvZL3n; Thu,  9 Jun 2022 20:33:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A08E4115D;
	Thu,  9 Jun 2022 20:33:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7C5251BF35E
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF03641C23
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:32:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vu8GeG7j8OsI for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:32:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3BAF641C61
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:32:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C74DBFF802;
 Thu,  9 Jun 2022 20:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654806761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2qoXsZ4y8qF9eANzTedB3m3Pj4pjXEKgINMPGbp8D+o=;
 b=ZT48PiFeNYxUQyvJA/rnljXKOUalAMjhWnRtgGkqq8HYra9a95Ov76kw1xSE/qEcM1UuWR
 03equA9hg3Ckt5ec0YOUcMv/8IQu5wT5MTHjfXXfU2NQfv/4y8JRCgpt21fo2eBZy2vjQV
 bgh+36kyAwc9COsIZX7bBq6/StIK6PCO1cfijE5YttfLUpsbv3qIrMXn66IkyvvlQbJOA9
 HadrdApVg5hgpyRZvCjMneEptHO03YY+DB+m7cB6ApYBAyiHr/4jiInBjAfvoTsdqAf0R7
 3Oiq03Id2jw8u86OOR3grIu4tjnOKsWI8/8IwMkrY5jSLOUu8RO3PJ/oKNBVSA==
Date: Thu, 9 Jun 2022 22:32:40 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220609223240.1be515cc@windsurf>
In-Reply-To: <20220608210246.336928-1-ju.o@free.fr>
References: <20220608210246.336928-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/poco: bump to version 1.11.2
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

On Wed,  8 Jun 2022 23:02:46 +0200
Julien Olivain <ju.o@free.fr> wrote:

> This commit also drop a patch which is now included upstream.
> 
> For changelog, see:
> https://raw.githubusercontent.com/pocoproject/poco/poco-1.11.2-release/CHANGELOG
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  ...ouble-conversion-detection-to-fix-co.patch | 36 -------------------
>  package/poco/poco.hash                        |  2 +-
>  package/poco/poco.mk                          |  2 +-
>  3 files changed, 2 insertions(+), 38 deletions(-)
>  delete mode 100644 package/poco/0001-Add-back-NIOS2-double-conversion-detection-to-fix-co.patch

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
