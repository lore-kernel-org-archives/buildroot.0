Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B1AC25B08
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 10:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6699610A6;
	Wed, 17 Aug 2022 10:54:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6699610A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qz9_WgXL1Rkj; Wed, 17 Aug 2022 10:54:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 101E561063;
	Wed, 17 Aug 2022 10:54:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 101E561063
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B16421BF377
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 10:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59526831C1
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 10:54:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59526831C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HqoUwhMUdk2T for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 10:54:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E218B82F6C
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E218B82F6C
 for <buildroot@busybox.net>; Wed, 17 Aug 2022 10:54:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7885A240005;
 Wed, 17 Aug 2022 10:54:08 +0000 (UTC)
Date: Wed, 17 Aug 2022 12:54:07 +0200
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Message-ID: <20220817125407.024ae30f@windsurf>
In-Reply-To: <20220816143943.16142-6-guillaume.bressaix@gmail.com>
References: <20220816143943.16142-1-guillaume.bressaix@gmail.com>
 <20220816143943.16142-6-guillaume.bressaix@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660733649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EftG1VtdbqXxMSKz7+Yc+zJSlMvd+R/etCYjS0sziOk=;
 b=ofICG4WNzQIVM7C6qVIQnYqOnyFDm6Tk2ER3LJ6/Jx4ZCsycOKQ6kqQvvdmpIg1E0dkjYx
 5GK+UtmciyoMqA1ahj5j0kXgoMk7wT+je1MSOZgoUqGC/VxSLIfQFzQCQVpmF0p9f0WWib
 NUEzq7CtN8dYSb0kucgW0eqObDqOdIUhtxGsLr24wq7YpQNiKO9JZraVe+NxkxmukTqJn2
 8sSHpXkdwoByEO4OyiJMs1mRqf6TN0KliG/01joRp0oTgOTAr8wIdyzqaAkXgRMRU3ANwB
 LJredTPa6ZMyl/WvWwSQsZ5LNnBv4aXpwoU2pi8czzBuFaTpCDUs6m6qTNfWiQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ofICG4WN
Subject: Re: [Buildroot] [PATCH v1 6/7] package/python-scikitlearn: new
 package
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Guillaume,

On Tue, 16 Aug 2022 16:39:42 +0200
"Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:

> +PYTHON_SCIKITLEARN_VERSION = 1.1.1
> +PYTHON_SCIKITLEARN_SITE = $(call github,scikit-learn,scikit-learn,$(PYTHON_SCIKITLEARN_VERSION))
> +PYTHON_SCIKITLEARN_LICENSE = BSD-3-Clause
> +PYTHON_SCIKITLEARN_LICENSE_FILES = COPYING
> +PYTHON_SCIKITLEARN_SETUP_TYPE = setuptools
> +PYTHON_SCIKITLEARN_DEPENDENCIES = \
> +	host-python-cython \
> +	host-python-scipy \

Are you sure it needs host-python-scipy? What error do you get if you
don't have host-python-scipy?

From a quick glance at scikitlearn's setup.py script (at
https://github.com/scikit-learn/scikit-learn/blob/main/setup.py#L303),
I have the impression it only tries to import numpy and scipy at
build-time to verify that their version is correct.

Though it's true than then it does import numpy/scipy stuff:

        # These commands require the setup from numpy.distutils because they
        # may use numpy.distutils compiler classes.
        from numpy.distutils.core import setup

        # Monkeypatches CCompiler.spawn to prevent random wheel build errors on Windows
        # The build errors on Windows was because msvccompiler spawn was not threadsafe
        # This fixed can be removed when we build with numpy >= 1.22.2 on Windows.
        # https://github.com/pypa/distutils/issues/5
        # https://github.com/scikit-learn/scikit-learn/issues/22310
        # https://github.com/numpy/numpy/pull/20640
        from numpy.distutils.ccompiler import replace_method
        from distutils.ccompiler import CCompiler
        from sklearn.externals._numpy_compiler_patch import CCompiler_spawn

But the below part is to avoid build errors on Windows. Can you try to
patch this out?

> +	python-joblib \
> +	python-threadpoolctl

Are you sure these are needed at build-time? You marked them as
run-time dependencies in your Config.in file.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
