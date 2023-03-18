Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64593C74A5B
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 21:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABC1381F5B;
	Sat, 18 Mar 2023 21:21:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABC1381F5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zaEVo-b0YTQ9; Sat, 18 Mar 2023 21:21:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F19CC81F45;
	Sat, 18 Mar 2023 21:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F19CC81F45
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF7411BF378
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 21:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AEBE81F45
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 21:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AEBE81F45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PCoPLLcCZqBm for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 21:21:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21A8081F44
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21A8081F44
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 21:21:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 075C4FF802;
 Sat, 18 Mar 2023 21:21:13 +0000 (UTC)
Date: Sat, 18 Mar 2023 22:21:13 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230318222113.146faa6b@windsurf>
In-Reply-To: <20230318123010.3448-1-fontaine.fabrice@gmail.com>
References: <20230318123010.3448-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679174474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c0jKMV89AAWFH6142thVTX+/Du/eYs7Kwp2woN9DBAY=;
 b=nC84ki2qgiNMXEl8gNTc0o0e2wlI3E4Pv3cmd7Y0tXx2i2quoJEtBp7WxWuBInIcuVOpsZ
 2QN0+15pLNRMUOJfvTMJEca5TGeODYBb3ESE+s6OOHT5zvQmu3gsY/d7cQgxqp0RJRMDAI
 br0//IXAnWwMtHcB7IxCVOjkLJWpNhJXkjTz9DwtksndfE4vnnbJr0oFHD7HQTf1kcb8jL
 3daK9X3Op4fUwjWwCgtr43SSqP8/iEUtneG6uGW5xYK8Y/zLmcUjO1YdymtdB5EOIPAUh7
 ByJgh9MadoFxRAUzrNNy6erVMvjASdKladfFMKDJIwEQ3PO6DQo+UJ95vXDBzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nC84ki2q
Subject: Re: [Buildroot] [PATCH 1/1] package/shadow: fix libsemanage
 dependency
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
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 18 Mar 2023 13:30:10 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since the addition of the package
> in commit f78c5cb5cae93a9e63dad4361d78e1787759382f:
> 
> Makefile:576: *** libsemanage is in the dependency chain of shadow that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e528e07874815d7f1cb951084ec985d76fe22d2e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/shadow/shadow.mk | 2 +-
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
