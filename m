From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Apr 2021 21:36:27 +0200
Subject: [Buildroot] [PATCH v1 1/2] package/python-colorzero: bump
 version to 2.0
In-Reply-To: <20210409211258.32652-1-ps.report@gmx.net>
References: <20210409211258.32652-1-ps.report@gmx.net>
Message-ID: <20210422213627.0670eb2b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  9 Apr 2021 23:12:57 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> - change to python3 only
> 
> - update license file hash:
>   @@ -1,4 +1,4 @@
>   -Copyright 2016-2018 Dave Jones <dave@waveform.org.uk>
>   +SPDX-License-Identifier: BSD-3-Clause
> 
> Changelog ([1]):
> 
>   - Dropped Python 2.x support. Current Python support level is 3.5 and above.
> 
>   - Added html and css format specifications to the :class:`Color` class'
>     string-formatting capabilities.
> 
> [1] https://github.com/waveform80/colorzero/blob/master/docs/changelog.rst
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

I have applied, with one change. See below.

>  config BR2_PACKAGE_PYTHON_COLORZERO
>  	bool "python-colorzero"
> +	depends on BR2_PACKAGE_PYTHON3

This should have been propagated to python-gpiozero, in that same
patch. I know you did it in PATCH 2/2, but that breaks bisectability,
and logically speaking, after this PATCH 1/2, python-gpiozero is no
longer usable with python2.

Again: applied with that change. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
