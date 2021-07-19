From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Jul 2021 23:17:19 +0200
Subject: [Buildroot] [PATCH] package/p7zip: bump to version v17.04
In-Reply-To: <20210719192112.3905400-1-nerv@dawncrow.de>
References: <20210719192112.3905400-1-nerv@dawncrow.de>
Message-ID: <20210719231719.5c1de495@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 19 Jul 2021 21:21:12 +0200
Andr? Zwing <nerv@dawncrow.de> wrote:

> This new attempt to maintain p7zip is already picked up by Distributions.
> It fixes CVE-2016-9296, CVE-2017-17969, CVE-2018-5996 and CVE-2018-10115.
> Note that the version is now prefixed with 'v'.
> 
> Signed-off-by: Andr? Zwing <nerv@dawncrow.de>

Thanks for this patch, I have applied, but after doing one change.

> -P7ZIP_VERSION = 16.02
> -P7ZIP_SOURCE = p7zip_$(P7ZIP_VERSION)_src_all.tar.bz2
> -P7ZIP_SITE = http://downloads.sourceforge.net/project/p7zip/p7zip/$(P7ZIP_VERSION)
> +P7ZIP_VERSION = v17.04
> +P7ZIP_SITE = $(call github,jinfeihan57,p7zip,$(P7ZIP_VERSION))

This should have been:

P7ZIP_VERSION = 17.04
P7ZIP_SITE = $(call github,jinfeihan57,p7zip,v$(P7ZIP_VERSION))

So that the "v" isn't in the version prefix. Indeed, we do some
matching against release-monitoring.org, and they store versions
without "v" prefixes. See https://release-monitoring.org/project/2583/

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
