Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EFDC47074
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 09:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F84E41A88;
	Thu,  4 Jan 2024 09:55:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F84E41A88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u6dW7TKPDDLj; Thu,  4 Jan 2024 09:55:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8166541A7A;
	Thu,  4 Jan 2024 09:55:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8166541A7A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CC34E1BF3C9
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 09:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C8BD41A85
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 09:55:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C8BD41A85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3k0CK7VDCj_y for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 09:55:43 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88C6C41AE0
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 09:55:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88C6C41AE0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41C53FF811;
 Thu,  4 Jan 2024 09:55:39 +0000 (UTC)
Date: Thu, 4 Jan 2024 10:55:38 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240104105538.36eaf9ef@windsurf>
In-Reply-To: <20240103173741.850916-2-fontaine.fabrice@gmail.com>
References: <20240103173741.850916-1-fontaine.fabrice@gmail.com>
 <20240103173741.850916-2-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704362139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wog9BkzHgf/Ay/qhK2inlwGanLuZdgpvQZasa19PBOo=;
 b=WuXXLa0npIndNwaFSfnkIePHMaC2vZReK2nTTdthvLFbYU5cfCCMKdxqqxwt0t6EECm3Kp
 UgXkGOXRWKD19u8F/ueRqgKPC9XieRN7cInkwY0+wLrpKmMRYWkBZ4NgeiDaXXKotm76KV
 DfT5bkYiHEN7gLNRE+RxqnvqLc8GJ050+/AtNAaVMp9iLLqBSTUgGP5/VQbt+d8RIkFs9Y
 ePM8qfqH9hGGFO+GsLto1cDqMgtkhWrJIKfcFDm03L2Em868NmaLi36MTQCzlhgl6QiQAf
 FGzPOWTBbmRKbl63Opphg4gQWFLzEbvWG0kHUW9yUjhQ+P/FtIbcHexXHI4tTg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WuXXLa0n
Subject: Re: [Buildroot] [PATCH v2,
 2/2] package/python-pysensors: add host-lm-sensors dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

Thanks for the patch. See below some feedback.

On Wed,  3 Jan 2024 18:37:41 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> host-lm-sensors is needed to extract the version from libsensors.so and
> avoid the following build failure raised since the addition of the
> package in commit c8ff8d41c06f6b1cbc5cf8702a516411084ead16:
> 
>   File "/home/buildroot/autobuild/instance-2/output-1/build/python-pysensors-0.0.4/setup.py", line 3, in <module>
>     import sensors
>   File "/home/buildroot/autobuild/instance-2/output-1/build/python-pysensors-0.0.4/sensors/__init__.py", line 20, in <module>
>     raise ImportError("can't find the sensors library.")
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/acd8583fb635ea27811405a2478182ddcd5642f7

Does python-pysensors setup.py really need  the version of the
lm-sensors library?

I see this:

#!/usr/bin/env python3
from setuptools import setup
import sensors

setup(
    name='PySensors',
    version=sensors.__version__,
    author=sensors.__author__,
    author_email=sensors.__contact__,
    packages=['sensors'],
    # scripts=[],
    url='http://pypi.python.org/pypi/PySensors/',
    # download_url='',
    license=sensors.__license__,
    description='Python bindings to libsensors (via ctypes)',
    long_description=open('README.rst').read(),
    long_description_content_type="text/x-rst",
    keywords=['sensors', 'hardware', 'monitoring'],
    classifiers=[
        'Development Status :: 3 - Alpha',
        'Intended Audience :: Developers',
        'License :: OSI Approved',
        'License :: OSI Approved ::'
        ' GNU Lesser General Public License v2 or later (LGPLv2+)',
        'Operating System :: POSIX :: Linux',
        'Programming Language :: Python',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.6',
        'Programming Language :: Python :: Implementation',
        'Programming Language :: Python :: Implementation :: CPython',
        'Topic :: System',
        'Topic :: System :: Hardware',
        'Topic :: System :: Monitoring',
    ],
    python_requires=">=3.6",
)

So the "sensors" module is only being imported to get
sensors.__version__, sensors.__author__ and sensors.__contact__,
sensors.__license__, all of which are statically defined in the sensors
module.

So in practice, in the context of setup.py, this detection of the
lm-sensors version is not used. I believe:

__version__ = "0.0.4"
__date__ = "2019-09-19"
__author__ = "Marc 'BlackJack' Rintsch"
__contact__ = 'marc@rintsch.de'
__license__ = 'LGPL v2.1'

Should just be moved directly to setup.py, and setup.py should not
import sensors. From a quick look, none of those variables are used
outside of setup.py. And of course this could be contributed upstream,
explaining why "import sensors" at setup time is not good.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
