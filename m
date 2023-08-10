Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05FFC001DE
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 19:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4376341E05;
	Thu, 10 Aug 2023 19:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4376341E05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QjRd0TIb3R2x; Thu, 10 Aug 2023 19:55:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E7BA41C54;
	Thu, 10 Aug 2023 19:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E7BA41C54
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 879641BF5A6
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 19:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EC6C409A1
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 19:55:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EC6C409A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aJwfxN54cD9v for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 19:55:05 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0379440948
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 19:55:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0379440948
Received: by mail.gandi.net (Postfix) with ESMTPSA id CAB2BC0004;
 Thu, 10 Aug 2023 19:55:01 +0000 (UTC)
Date: Thu, 10 Aug 2023 21:55:00 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230810215500.79a4819b@windsurf>
In-Reply-To: <ZNR5SCVmNIOQ6YdI@waldemar-brodkorb.de>
References: <ZNR5SCVmNIOQ6YdI@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691697302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=utz1jmBCNRiOCmeuiM6zCrqekLXlSsJQD0YnIgKFFik=;
 b=dLin2EWccq2T9OosyaHMx7JBouP3CKGGfUOhGyod93WFc17jFIPpJC3yqM6MwIYcyJfK4O
 yO+6CrUpWtAJgXNgzFbalu4Lgr63JmG4N9gbbjzeRfrBLflrXMYHXltSFX/5OCnGBWoDKe
 7ps142p+M4n3WDNKsROGlQJztlXStetTXMyuc5PSpxvxw4iDTbjh6IaCkWNui4Z+CAL1qZ
 Z8VCVQYX0xur0Y3A2lIdeElzbTWtHqmoD7VWWZThgsX0MZV849fDp5x8Gz4bx7sZpvqDlT
 DNqGwS7h8v7pE/jkbkHTPsifRGx3yMyZDy3Zb/svtgtOEN+Zk17b/1gyQ3mHAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dLin2EWc
Subject: Re: [Buildroot] [PATCH/next] package/uclibc-ng-test: update to
 latest git
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

On Thu, 10 Aug 2023 07:44:40 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> - update to latest git version
> - switch to https url for better access for users behind a proxy
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/uclibc-ng-test/uclibc-ng-test.hash | 2 +-
>  package/uclibc-ng-test/uclibc-ng-test.mk   | 5 +++--
>  2 files changed, 4 insertions(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
