Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF75C3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 17 Dec 2023 22:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 933B181B10;
	Sun, 17 Dec 2023 22:07:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 933B181B10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D0AzmhffTLlM; Sun, 17 Dec 2023 22:07:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C995E81A64;
	Sun, 17 Dec 2023 22:07:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C995E81A64
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CBE41BF425
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 22:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C33B781A64
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 22:07:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C33B781A64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dEY736LuVlIx for <buildroot@lists.busybox.net>;
 Sun, 17 Dec 2023 22:07:08 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81C3981971
 for <buildroot@buildroot.org>; Sun, 17 Dec 2023 22:07:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81C3981971
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4C381C0003;
 Sun, 17 Dec 2023 22:07:04 +0000 (UTC)
Date: Sun, 17 Dec 2023 23:07:04 +0100
To: Ralf Dragon <hypnotoad@lindra.de>
Message-ID: <20231217230704.003200c7@windsurf>
In-Reply-To: <20231212160112.94272-2-hypnotoad@lindra.de>
References: <20231212160112.94272-1-hypnotoad@lindra.de>
 <20231212160112.94272-2-hypnotoad@lindra.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1702850825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ATsEkFsIaZOgjzjhXKwhlo4HfkH2v7af0Oj3yRxB0gM=;
 b=N0e63z5G20TT5Ystt4/9LVUaUPLuS19RRsmEwpI76VWPATTBzCvc/yL3vpwTscnYL4E7Vl
 hav6jJaVhcF8TRA184XRfeOQiRXjJHiNN0n/nig3mpXkm1zoOc1CzShRzB3sunBIT8Q5ji
 hxUPnZnjAQ2rP3KqAncB900Bg/a65PY0Educ7vMrJMgHiqDs5tip3okekMq+YIUKLvb6MV
 3eCijN5RfxXovr5iib2aDx8Bo+s8VGo/3HmpsYqCvkzfeKyrW5k8o4cjosnXCt7qNWanky
 FMISokijWR8Abqc90tFLMIVLf8QJ7GqB8Rbf7Xh44rj19BSh1b97Dv7D05cZ8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N0e63z5G
Subject: Re: [Buildroot] [PATCH 2/2] python-qt5: add PyQt5.sip module
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
Cc: Julien Olivain <ju.o@free.fr>, gwenhael.goavec-merou@trabucayre.com,
 yann.morin.1998@free.fr, asafka7@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Ralf,

On Tue, 12 Dec 2023 17:01:12 +0100
Ralf Dragon <hypnotoad@lindra.de> wrote:

> This fixes the following runtime error when importing PyQt5 in python:
> 
> from PyQt5.QtCore import *
> ModuleNotFoundError: No module named 'PyQt5.sip'

So it means that python-pyqt5 requires this new python-pyqt5-sip
package? How come has python-pyqt5 ever worked?

> diff --git a/package/python-pyqt5-sip/Config.in b/package/python-pyqt5-sip/Config.in
> new file mode 100644
> index 0000000000..6f26271f70
> --- /dev/null
> +++ b/package/python-pyqt5-sip/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_PYQT5_SIP
> +	bool "python-pyqt5-sip"
> +	depends on BR2_PACKAGE_PYTHON_PYQT5
> +	depends on BR2_PACKAGE_PYTHON_SIP

But, but, according to what you described above, it seems like
python-pyqt5 needs python-pyqt5-sip, but here you have a
python-pyqt5-sip -> python-pyqt5 dependency.

So with your patch applied, it's still possible to enable only
python-pyqt5, so we would still have the failure you're mentioning in
your commit log.

Could you clarify?

Also, it would very, very good to add a runtime test case in
support/testing/ for this, as such Python issues are only visible at
runtime. I have added Julien Olivain in Cc, who can probably help with
this, as he is our resident expert in writing support/testing tests :-)

> diff --git a/package/python-pyqt5-sip/python-pyqt5-sip.hash b/package/python-pyqt5-sip/python-pyqt5-sip.hash
> new file mode 100644
> index 0000000000..8039cdafd9
> --- /dev/null
> +++ b/package/python-pyqt5-sip/python-pyqt5-sip.hash
> @@ -0,0 +1,4 @@
> +# from https://pypi.org/project/PyQt5-sip/12.12.1
> +

Empty line not needed.

> +sha256  8fdc6e0148abd12d977a1d3828e7b79aae958e83c6cb5adae614916d888a6b10  PyQt5_sip-12.12.1.tar.gz
> +md5  c2117da3b4c0e081c1c5a9088b8a4d55  PyQt5_sip-12.12.1.tar.gz
> diff --git a/package/python-pyqt5-sip/python-pyqt5-sip.mk b/package/python-pyqt5-sip/python-pyqt5-sip.mk
> new file mode 100644
> index 0000000000..3f689b9d47
> --- /dev/null
> +++ b/package/python-pyqt5-sip/python-pyqt5-sip.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-SIP-QT5

Should be all lower-case.

> +#
> +################################################################################
> +
> +PYTHON_PYQT5_SIP_VERSION = 12.12.1
> +PYTHON_PYQT5_SIP_SITE = https://files.pythonhosted.org/packages/c1/61/4055e7a0f36339964956ff415e36f4abf82561904cc49c021da32949fc55
> +PYTHON_PYQT5_SIP_SOURCE = PyQt5_sip-$(PYTHON_PYQT5_SIP_VERSION).tar.gz
> +PYTHON_PYQT5_SIP_LICENSE = MIT
> +PYTHON_PYQT5_SIP_LICENSE_FILES = LICENSE
> +PYTHON_PYQT5_SIP_SETUP_TYPE = setuptools
> +PYTHON_PYQT5_SIP_DEPENDENCIES += python-sip

No +=, just =.

> +
> +$(eval $(python-package))
> diff --git a/package/python-pyqt5/Config.in b/package/python-pyqt5/Config.in
> index 9fa7676f98..c2a1976950 100644
> --- a/package/python-pyqt5/Config.in
> +++ b/package/python-pyqt5/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_PYTHON_PYQT5
>  	bool "python-pyqt5"
>  	depends on BR2_PACKAGE_QT5
>  	select BR2_PACKAGE_PYTHON_SIP
> +	select BR2_PACKAGE_PYTHON_PYQT5_SIP

Ah, so python-pyqt5 now selects python-pyqt5-sip, and python-pyqt5-sip
also selects python-pyqt5. This sounds like a circular dependency.

Could you perhaps give a bit more background, so that we can provide
some better guidance on how to resolve this issue properly?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
