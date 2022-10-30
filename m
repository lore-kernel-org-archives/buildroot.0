Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC39C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 577D0812E9;
	Sun, 30 Oct 2022 11:11:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 577D0812E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qOVqsUDf0N5Z; Sun, 30 Oct 2022 11:11:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CBCD80C3F;
	Sun, 30 Oct 2022 11:11:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CBCD80C3F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C87C31BF2EB
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A44AF40376
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:08:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A44AF40376
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id omUP8S2qq46c for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:08:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89998401A3
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89998401A3
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:08:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5175C240004;
 Sun, 30 Oct 2022 11:08:29 +0000 (UTC)
Date: Sun, 30 Oct 2022 12:07:53 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221030120753.3910179c@windsurf>
In-Reply-To: <20221030092832.43581-1-fontaine.fabrice@gmail.com>
References: <20221030092832.43581-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667128109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vL87GvOSKilmgIoreSoMjhPI403/O/9LYwhdWdznKeQ=;
 b=mxqqUQDVQmiZHfqS8ojK4z68LBHXMrlNU6r00MQDRjsgKjYZtqniPb5T/VBJUQgk7jtisd
 7Pbsinv0+tv/fsMNSgtr9KND8swM1TEHjWLApKQbGb2Mg2QnCpDqWWyOQ+HKUaRLODa+q9
 j133iUlsaptwobxD6V4jY7YYzw6OwnHuOslbavHFMg+heVlgTbBR+qmH+TEQ/CFN3gjaF+
 58DxxdegCdtoGqsQ9KgK99wipmGhLmoJkmx+dojSdC9rtrhO2jWit/3nORseff20xAU7n2
 QUncd5+CfnX/lbmzU72LcwpZ92n5i/MQO//rRuGCvCYLterFpJNbvj0Z5ZrDmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mxqqUQDV
Subject: Re: [Buildroot] [PATCH 1/1] package/libpagekite: bump to version
 0.91.201110
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

On Sun, 30 Oct 2022 10:28:32 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/pagekite/libpagekite/compare/v0.91.190530...v0.91.201110
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libpagekite/libpagekite.hash | 2 +-
>  package/libpagekite/libpagekite.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
