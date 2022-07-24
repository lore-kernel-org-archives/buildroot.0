Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5A1C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 07:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9DC8141684;
	Sun, 24 Jul 2022 07:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DC8141684
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cUrHIUW1-O1b; Sun, 24 Jul 2022 07:51:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5A3440156;
	Sun, 24 Jul 2022 07:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5A3440156
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CDD61BF578
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 07:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15E2A83EDF
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 07:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15E2A83EDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PYsVZJZf2NOe for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 07:51:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C792583ED7
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C792583ED7
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 07:51:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 595EC60002;
 Sun, 24 Jul 2022 07:51:42 +0000 (UTC)
Date: Sun, 24 Jul 2022 09:51:41 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220724095141.5e3fc07f@windsurf>
In-Reply-To: <20220723230400.362946-1-james.hilliard1@gmail.com>
References: <20220723230400.362946-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658649102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X/7sBhtv7FsaSKQwncTwHcVYip6GYOCQLukBSTSwRc4=;
 b=DCqB8kMCDQKT1a//7G8RuOA7oOZayhQYSR1n/XVKMROZ+IhY1UpCunI6QdlwNtVHK42JTr
 LcRZIAPTTf44vaH2UusuZPwL5d9IhAX/bljz/1dWPBmhWM3qJUk9DIdwJN/cId0TWw94EJ
 uhlPbfJg3YS3LDJ/i9rVVeyeSvpqf8oKYEJmV0HRl3+NrhnNAO5Z5fNczzvVwWWOpbRmNV
 e/zug94Ceuf3C46nq4akWy+5a+d0UJk82X0CZwfyRobyoYwINaM2+dxFN6UUimyx1wNFB7
 nboR87bt+zatfiqhZiZcAzs2lx+5hDJcD8er8iKGhOwa1GuKc07CxgkPNKrYGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DCqB8kMC
Subject: Re: [Buildroot] [PATCH v4 1/2] package/python-maturin: new package
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
Cc: Graeme Smecher <gsmecher@threespeedlogic.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 23 Jul 2022 17:03:59 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> This is pep517 pyo3 build backend that's an alternative to
> python-setuptools-rust.
> 
> Note that maturin itself uses python-setuptools-rust for
> bootstrapping.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> Tested-by: Graeme Smecher <gsmecher@threespeedlogic.com>
> ---
> Changes v3 -> v4:
>   - update to 0.12.20
> Changes v2 -> v3:
>   - update to 0.12.16
>   - migrate to new python-setuptools-rust based bootstrapping
> Changes v1 -> v2:
>   - update patch comment to backport as it is merged upstream
> ---
>  package/python-maturin/python-maturin.hash |  5 +++++
>  package/python-maturin/python-maturin.mk   | 25 ++++++++++++++++++++++
>  2 files changed, 30 insertions(+)
>  create mode 100644 package/python-maturin/python-maturin.hash
>  create mode 100644 package/python-maturin/python-maturin.mk

You (again) forgot to add yourself in the DEVELOPERS file for this
package, so I did so, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
