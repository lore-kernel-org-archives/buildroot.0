Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B276C6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 11:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DBDE819D1;
	Sun, 12 Mar 2023 11:20:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DBDE819D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O9aJ2CccwksT; Sun, 12 Mar 2023 11:20:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AFCB8196E;
	Sun, 12 Mar 2023 11:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AFCB8196E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E16591BF5A1
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 11:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A72F640338
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 11:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A72F640338
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R1eD2fA0tAS5 for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 11:20:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1A7040256
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1A7040256
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 11:20:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9659FC0002;
 Sun, 12 Mar 2023 11:20:43 +0000 (UTC)
Date: Sun, 12 Mar 2023 12:20:42 +0100
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Message-ID: <20230312122042.6135e351@windsurf>
In-Reply-To: <20230308172533.773-1-nicolas.cavallari@green-communications.fr>
References: <20230308172533.773-1-nicolas.cavallari@green-communications.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678620044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cXB4i4WQjkHpPAexilEOAWjxiVPAZusQsK3BxO53kOM=;
 b=kUwZBfT+V/d7BIERGqXJq+is8WaWkS3iguRaoc+UQbqwn6TIvfFthRmhyGxo+TZG8F/+Xe
 vcsEr+FRFUQ4NraIzOqLAPDrnbuxCL4ICOS87IKBRHy0zJDpj4FRqGzJBsFN/WOFug1RdI
 1xlthrMRRANHqn4hRUmvDZSQ6669uzhrBPEzZG4xk4NSqZlykUCLMuE2Ga38tTy6aSXZnX
 edSunJRzfFU41oizHaRmxmgGIpgob4KlT9nwRvxR4tSDaGqoLwk+NrrTFaD2CbqFsQjRyA
 O7I34FDlcO60NYyKuA6X0qkcOmqtWKSpX6f+VbsLYA3eyL+X+qbWuWrC4ulMQw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kUwZBfT+
Subject: Re: [Buildroot] [PATCH next 1/1] package/janus-gateway: bump to
 version 1.1.2
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
Cc: Gregory Dymarek <gregd72002@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  8 Mar 2023 18:25:33 +0100
Nicolas Cavallari <nicolas.cavallari@green-communications.fr> wrote:

> Remove patch applied upstream.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> ---
>  ...se-parentheses-to-ensure-compilation.patch | 27 -------------------
>  package/janus-gateway/janus-gateway.hash      |  2 +-
>  package/janus-gateway/janus-gateway.mk        |  2 +-
>  3 files changed, 2 insertions(+), 29 deletions(-)
>  delete mode 100644 package/janus-gateway/0003-Use-parentheses-to-ensure-compilation.patch

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
