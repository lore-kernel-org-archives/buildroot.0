Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0291AC67871
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 06:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A556160E1A;
	Thu, 27 Oct 2022 06:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A556160E1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LzbGgAqcacyY; Thu, 27 Oct 2022 06:54:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D610360DF9;
	Thu, 27 Oct 2022 06:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D610360DF9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 99DB81BF47E
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7602F40603
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7602F40603
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hwzVCcVsHtFL for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 06:54:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8067440328
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8067440328
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 06:54:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C895F4000C;
 Thu, 27 Oct 2022 06:54:39 +0000 (UTC)
Date: Thu, 27 Oct 2022 08:54:38 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221027085438.1bbe98a6@windsurf>
In-Reply-To: <20221026214055.625267-1-fontaine.fabrice@gmail.com>
References: <20221026214055.625267-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666853680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1eNIjXzDTaBm0cI8nNdz7NNYtdCKEBpQn1YMFikwjag=;
 b=HawgVNRSoCoBo0+wh6vL8qw2nK/pNqGdWTy5dqY3+SOrF6dBTtWLGVeI9FvojxiVFcUxBX
 +ttfiv6MSVaNNWCmDQFsCpnCF3f+oAOBNVaAkh37Z7Pg/pZYQX8HJysHP6br+/G+EOANpr
 m3+nUqShExAlBN/dpOf2HCaDy+1TNwk/L8S9+/O0hVQ0w36a7Fw6ut8qp4s6QFuWhsEpMT
 KHyJ2ncTk+ODSw88cdvGvq9Np95UWo+wEfXy+Czh3SjF2RyNKx8Hvwp5pEZHadYuZA03hh
 7qWWG6eIxQ44TKD0xXkVN7f82BJvAOOTJNWMkamC08ui6ICwQ9deGBGY7jAfTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HawgVNRS
Subject: Re: [Buildroot] [PATCH 1/1] package/iproute2: bump to version 6.0.0
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

On Wed, 26 Oct 2022 23:40:55 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patches (already in version)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-ipstats-Add-param.h-for-musl.patch   | 29 ----------------
>  .../0002-ipstats-add-missing-headers.patch    | 33 -------------------
>  ...-_GNU_SOURCE-when-checking-for-setns.patch | 29 ----------------
>  package/iproute2/iproute2.hash                |  2 +-
>  package/iproute2/iproute2.mk                  |  2 +-
>  5 files changed, 2 insertions(+), 93 deletions(-)
>  delete mode 100644 package/iproute2/0001-ipstats-Add-param.h-for-musl.patch
>  delete mode 100644 package/iproute2/0002-ipstats-add-missing-headers.patch
>  delete mode 100644 package/iproute2/0003-configure-Define-_GNU_SOURCE-when-checking-for-setns.patch

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
