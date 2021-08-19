Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E544AC4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:05:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A99716108E
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A99716108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7581E404E8;
	Thu, 19 Aug 2021 21:05:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L_poQ04-26mn; Thu, 19 Aug 2021 21:05:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F51E40176;
	Thu, 19 Aug 2021 21:05:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD6551BF4D5
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBCD740176
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:05:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X4B01WATCpG8 for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 21:05:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C0AD4011B
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 21:05:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 9C042FF803;
 Thu, 19 Aug 2021 21:05:40 +0000 (UTC)
Date: Thu, 19 Aug 2021 23:05:39 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210819230539.16ac5e4f@windsurf>
In-Reply-To: <20210805174252.2661314-1-fontaine.fabrice@gmail.com>
References: <20210805174252.2661314-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/mcrypt: drop package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Fabrice,

On Thu,  5 Aug 2021 19:42:51 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop mcrypt which is not maintained anymore (no release since 2008).
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  Config.in.legacy                        |  7 ++
>  package/Config.in                       |  1 -
>  package/mcrypt/0001-CVE-2012-4409.patch | 25 -------
>  package/mcrypt/0002-CVE-2012-4426.patch | 35 ---------
>  package/mcrypt/0003-CVE-2012-4527.patch | 99 -------------------------
>  package/mcrypt/0004-no-rpath.patch      | 17 -----
>  package/mcrypt/Config.in                | 12 ---
>  package/mcrypt/mcrypt.hash              |  3 -
>  package/mcrypt/mcrypt.mk                | 24 ------
>  9 files changed, 7 insertions(+), 216 deletions(-)
>  delete mode 100644 package/mcrypt/0001-CVE-2012-4409.patch
>  delete mode 100644 package/mcrypt/0002-CVE-2012-4426.patch
>  delete mode 100644 package/mcrypt/0003-CVE-2012-4527.patch
>  delete mode 100644 package/mcrypt/0004-no-rpath.patch
>  delete mode 100644 package/mcrypt/Config.in
>  delete mode 100644 package/mcrypt/mcrypt.hash
>  delete mode 100644 package/mcrypt/mcrypt.mk

Do we have a good reason to drop these packages? We have lots of
packages with no upstream activity, and we drop them only when there is
some particular issue. What prompted you to propose these packages for
removal ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
