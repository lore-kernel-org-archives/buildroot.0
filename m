Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1BBC6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 09:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D91F81D02;
	Sun, 12 Mar 2023 09:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D91F81D02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1C4CbaX2uGxf; Sun, 12 Mar 2023 09:23:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F82A81CDC;
	Sun, 12 Mar 2023 09:23:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F82A81CDC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E4ACE1BF3C3
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB3574046D
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB3574046D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yggrFWkiEEgu for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 09:23:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54EF240438
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54EF240438
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 09:23:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3E15C40003;
 Sun, 12 Mar 2023 09:23:43 +0000 (UTC)
Date: Sun, 12 Mar 2023 10:23:42 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230312102342.2f2393b0@windsurf>
In-Reply-To: <20230311184148.183739-1-ju.o@free.fr>
References: <20230311184148.183739-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678613023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cC4Jjodm4Tke7O8HHuyLkDvgJVZ9JugzWu1HWiG4e7o=;
 b=PNInZ+L/nfKIM5ndVs8fumjGjIalDItZFJtu+SGeIxcI7yf9y17zydKCtzrCngcgsrDcOv
 Vp+wlTPMuzlltYsTEGTj0zf1O0gwHrctRR5maF8aepL/d/3uQXscx8GugAlzXaIYrlR0hy
 Gvdy12lrV60A1vpXCsgUyHlU1Hsk5y4rW9nezAN+jhtkzgibxHoUZjAifRqDXVw/VE5EBE
 m/n95gwrCW1tj6mJuq1tvKCCS4DVApXIhUXvFLitAXN4fobOmulsqvchL1IAHNF8uk2CvV
 RzvXF2xFWRpEaDhjSKIZW8ne+Hww9MRoqAHk+MyWjAP266PR2XNRmP6PHSFxdQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PNInZ+L/
Subject: Re: [Buildroot] [PATCH next 1/1] package/python-hwdata: new package
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

Hello Julien,

Thanks for this work!

On Sat, 11 Mar 2023 19:41:48 +0100
Julien Olivain <ju.o@free.fr> wrote:

> +PYTHON_HWDATA_VERSION = 2.3.7
> +PYTHON_HWDATA_SOURCE = hwdata-$(PYTHON_HWDATA_VERSION).tar.gz
> +PYTHON_HWDATA_SITE = https://files.pythonhosted.org/packages/15/26/f5bc1b42129fbcbd1c99c29714af1685fc89e2cf37680a9930d4fcac1808
> +PYTHON_HWDATA_SETUP_TYPE = distutils
> +PYTHON_HWDATA_LICENSE = GPL-2.0+
> +PYTHON_HWDATA_LICENSE_FILES = LICENSE

This doesn't work because there is no LICENSE file in the PyPi tarball
(and also the hash file does not have the hash of that file):

>>> python-hwdata 2.3.7 Collecting legal info
ERROR: No hash found for LICENSE
cp: cannot stat '/home/thomas/projets/buildroot/output/build/python-hwdata-2.3.7/LICENSE': No such file or directory
make: *** [package/python-hwdata/python-hwdata.mk:16: python-hwdata-legal-info] Error 1

One thing you could do to address this is:

PYTHON_HWDATA_EXTRA_DOWNLOADS = https://raw.githubusercontent.com/xsuchy/python-hwdata/python-hwdata-2.3.7-1/LICENSE

and then add a post-extract hook that copies $(PYTHON_HWDATA_DLDIR) to
$(@D), and then use LICENSE as the license file.

This will of course require an update in the hash file.

Do you think you could look into this? The rest of the patch looks
good, of course.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
