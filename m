Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F29E71068
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 12:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AFD183C41;
	Thu, 21 Sep 2023 12:49:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AFD183C41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1XhSz9X33cSt; Thu, 21 Sep 2023 12:49:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A96183C4D;
	Thu, 21 Sep 2023 12:49:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A96183C4D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D68671BF3AD
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 12:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82E7F83C49
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 12:49:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82E7F83C49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TxuXxg1MTWoh for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 12:49:19 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC57683C06
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 12:49:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC57683C06
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86A1DE0006;
 Thu, 21 Sep 2023 12:49:14 +0000 (UTC)
Date: Thu, 21 Sep 2023 14:49:14 +0200
To: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Message-ID: <20230921144914.6bebb281@windsurf>
In-Reply-To: <20230921071625.659478-1-fido_max@inbox.ru>
References: <20230921071625.659478-1-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695300555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5KH+OEzJF3WNX4ylX7jLLskjxxPw7SLUj5RzXBvh+j0=;
 b=bb2IFjT/7X6KFYmzlGEokuZivp8UnO0YZTvuddevwcWkLsqWibr5VDyu8KcBi58nutX1Ed
 iIhbPktbYbhrO7YOjZs/njepP5lmxCmMLd/jU8l9U+8yMgSDtQZNiSm1KjRWn4PLAiGF1N
 fMPexfVIx3fP6TUq9zibRKLbms/MXuwJ/4ZTWYpY2J4zxUo864+zSMXTFtjpmLrzekC65w
 4kvRYWTqvf7OLwueySDDhlvABL6V4Xqv81D8xf1HsPrUFpQiG5M9eWDwLMxupNy0NQjBp7
 dVK5wJNvJqzgYIyDrrjc/cWMnf+6iHTX1eodmqJQGdrh2gAecLi/j1NpZNCxyw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bb2IFjT/
Subject: Re: [Buildroot] [PATCH 1/1] package/postgis: bump version to 3.4.0
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 21 Sep 2023 10:16:25 +0300
Maxim Kochetkov via buildroot <buildroot@buildroot.org> wrote:

> Changelog: https://git.osgeo.org/gitea/postgis/postgis/src/tag/3.4.0/NEWS
> 
> Licenses updates:
> - BSD-3-Clause for xsl:
>   https://github.com/postgis/postgis/commit/1a525819301c7b715a74cd1549142dede3e34e49
> 
> - Update urls and add SFCGAL links and licenses:
>   https://github.com/postgis/postgis/commit/0015540bc60b716e169f9d2c928897e997bf8632
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/postgis/postgis.hash | 4 ++--
>  package/postgis/postgis.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
> index 8550a57939..812d2dc017 100644
> --- a/package/postgis/postgis.hash
> +++ b/package/postgis/postgis.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  9a2a219da005a1730a39d1959a1c7cec619b1efb009b65be80ffc25bad299068  postgis-3.3.2.tar.gz
> -sha256  55b69f22e1752830dd565852dc7ff242daf289dbd3a6bfede5db43f90d2e28c9  LICENSE.TXT
> +sha256  aee9b60a6c884d354164b3096c4657f324454186607f859d1ce05d899798af9d  postgis-3.4.0.tar.gz
> +sha256  2a3bde0a77224496ea6d8efa686da7e29ab0dd6b1a8f90ba12beaf7ae28e878a  LICENSE.TXT
> diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
> index 4148180adf..11eb8e3c5a 100644
> --- a/package/postgis/postgis.mk
> +++ b/package/postgis/postgis.mk
> @@ -4,11 +4,11 @@
>  #
>  ################################################################################
>  
> -POSTGIS_VERSION = 3.3.2
> +POSTGIS_VERSION = 3.4.0
>  POSTGIS_SITE = https://download.osgeo.org/postgis/source
>  # parallel build issues
>  POSTGIS_MAKE = $(MAKE1)
> -POSTGIS_LICENSE = GPL-2.0+ (PostGIS), BSD-2-Clause, MIT, Apache-2.0, ISC, BSL-1.0, CC-BY-SA-3.0
> +POSTGIS_LICENSE = GPL-2.0+ (PostGIS), BSD-3-Clause(xsl), GPL-2.0+ or LGPL-3.0+ (SFCGAL), MIT, Apache-2.0, ISC, BSL-1.0, CC-BY-SA-3.0

                                                    ^^^ whitespace was missing here

Applied with this minor nit fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
