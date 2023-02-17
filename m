Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD26EC6379F
	for <buildroot@archiver.kernel.org>; Fri, 17 Feb 2023 14:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67801405D4;
	Fri, 17 Feb 2023 14:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67801405D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hntUg7yPWwzP; Fri, 17 Feb 2023 14:10:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A710540530;
	Fri, 17 Feb 2023 14:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A710540530
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D6BB1BF34A
 for <buildroot@lists.busybox.net>; Fri, 17 Feb 2023 14:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5ED8B40530
 for <buildroot@lists.busybox.net>; Fri, 17 Feb 2023 14:10:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5ED8B40530
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ogsYspvxuRX6 for <buildroot@lists.busybox.net>;
 Fri, 17 Feb 2023 14:10:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0651C40108
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0651C40108
 for <buildroot@buildroot.org>; Fri, 17 Feb 2023 14:10:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2747BFF80A;
 Fri, 17 Feb 2023 14:10:42 +0000 (UTC)
Date: Fri, 17 Feb 2023 15:10:41 +0100
To: Nasser Afshin <afshin.nasser@gmail.com>
Message-ID: <20230217151041.5d6ece80@windsurf>
In-Reply-To: <20221025065356.1838-1-afshin.nasser@gmail.com>
References: <20221025065356.1838-1-afshin.nasser@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676643042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a+3c1NIC0IUt3QwSSNr5j7+gb/BLqZl1dLy3cRM7A60=;
 b=WwKmzJNdma3tlDhWG2UueLKgJqC91STUWKIr2Ev6hBt31cycyFSwGjUjn9RNnkEDNzeFN0
 +hvYBZFr3XYVwBaPJLyFHwtCAH93NQ6GBebxqPGnj0NEBkUQt/OU4PHpWEd8eSAevKOUnB
 XoTqXnDKIKSl8N2O7IaItdmJLTqNs9v91TzbB0lrGnJix91RrfnA3EHnbC6lpPd4Mk1mzW
 st+KSbZWiwgVHpDw5T6lmFIU3oj2x5hvgqKl5AzQGSK5FIrX6MT48LsTQVgkA6Ig58v6dx
 tz6bSLz34Jdqn3CV4Sl3KadhygGN+/onSyxrQRRPmYX08wbAy1rsEIyuIhKQZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WwKmzJNd
Subject: Re: [Buildroot] [PATCH] python-wheel: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Nasser,

Thanks for the contribution, and sorry for the very slow feedback :-/

On Tue, 25 Oct 2022 10:23:56 +0330
Nasser Afshin <afshin.nasser@gmail.com> wrote:

> Signed-off-by: Nasser Afshin <afshin.nasser@gmail.com>
> ---
>  package/Config.in                      |  1 +
>  package/python-wheel/Config.in         | 15 +++++++++++++++
>  package/python-wheel/python-wheel.hash |  5 +++++
>  package/python-wheel/python-wheel.mk   | 14 ++++++++++++++
>  4 files changed, 35 insertions(+)
>  create mode 100644 package/python-wheel/Config.in
>  create mode 100644 package/python-wheel/python-wheel.hash
>  create mode 100644 package/python-wheel/python-wheel.mk

Could you give some details on the use case for python-wheels on the
target?

Also, could you add an entry to the DEVELOPERS file?

In addition, for Python packages, we really like to have a runtime test
in support/testing/. Could you have a look into this?


>  	source "package/python-ws4py/Config.in"
> diff --git a/package/python-wheel/Config.in b/package/python-wheel/Config.in
> new file mode 100644
> index 0000000000..225d7529a4
> --- /dev/null
> +++ b/package/python-wheel/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_PYTHON_WHEEL
> +	bool "python-wheel"
> +	help
> +      This library is the reference implementation of the Python wheel
> +      packaging standard, as defined in PEP 427.
> +
> +        It has two different roles:
> +            1. A setuptools extension for building wheels that provides the bdist_wheel
> +            setuptools command
> +            2. A command line tool for working with wheel files
> +
> +        It should be noted that wheel is not intended to be used as a library, and as
> +        such there is no stable, public API.
> +
> +          https://github.com/pypa/wheel

The indentation is not correct. Could you run "make check-package" and
make sure there are no warnings?


> index 0000000000..d8fab54867
> --- /dev/null
> +++ b/package/python-wheel/python-wheel.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-wheel
> +#
> +################################################################################
> +
> +PYTHON_WHEEL_VERSION = 0.37.1
> +PYTHON_WHEEL_SOURCE = wheel-$(PYTHON_WHEEL_VERSION).tar.gz
> +PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/c0/6c/9f840c2e55b67b90745af06a540964b73589256cb10cc10057c87ac78fc2
> +PYTHON_WHEEL_SETUP_TYPE = distutils

Are you sure? It seems to be using setuptools. Could you double check
this?

Could you fix this and resend, as a new patch sent with "git
send-email" (and not in the middle of a reply, like you did for
python-pycrate, which was not good)?

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
