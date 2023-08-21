Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46456EE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 22:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F230A40B56;
	Mon, 21 Aug 2023 22:15:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F230A40B56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OQgan70XgGRK; Mon, 21 Aug 2023 22:15:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45D1D40B4A;
	Mon, 21 Aug 2023 22:15:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45D1D40B4A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 39AAC1BF35B
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 22:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 117D740B4A
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 22:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 117D740B4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AXVA6v_DTQbp for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 22:15:38 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CFB8D405B1
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 22:15:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFB8D405B1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0974320004;
 Mon, 21 Aug 2023 22:15:35 +0000 (UTC)
Date: Tue, 22 Aug 2023 00:15:35 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230822001535.6b8ecfda@windsurf>
In-Reply-To: <20230815125652.687317-1-ju.o@free.fr>
References: <20230815125652.687317-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692656136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hG4W899k5y4PYjbJTrSKITMtywklKNqUc5z2B72vptg=;
 b=fJt0SI1gvFNb0LhrIj1Qg41PesxcEvnjZQ4az3AZoEppHeXwAp2xIY4+ZMFedm3GU/oFUJ
 VWfP0g9llkMhfLXOAxBtVPloSfO3byZmS/rvm/gA9RprPrLD8AcS5Hzh8Us8YDg3rFnumY
 0SaR+d1keCJbyaiWcuCMlZMIAPm+JhlYqWO+Y6HY747uLDIt/65eTuO9kue/dv3ljGhY4h
 ZMAdzThTS+lPHXTl6ctdiT+2m0dieznjGfTgzTAxXEUFm2iabgIrajMiVhWgFzLvhfYG0W
 6fdjs8HFdXwpaotIGHlCXK9z3gt8FW7AE9eeXx39Jsoi93L6sCYCMBoKcEzKGQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fJt0SI1g
Subject: Re: [Buildroot] [PATCH next 1/2] package/libnftnl: bump to version
 1.2.6
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

On Tue, 15 Aug 2023 14:56:51 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log, see:
> https://www.netfilter.org/projects/libnftnl/files/changes-libnftnl-1.2.6.txt
> 
> This commit also adds comments in hash file:
> - that pgp signature was verified with links
> - that the license file hash was locally computed
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/libnftnl/libnftnl.hash | 7 ++++++-
>  package/libnftnl/libnftnl.mk   | 2 +-
>  2 files changed, 7 insertions(+), 2 deletions(-)

Both applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
