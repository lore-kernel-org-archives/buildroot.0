From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Oct 2018 15:59:53 +0200
Subject: [Buildroot] [PATCH 1/2] package/cups-filters: bump to version
 1.21.3
In-Reply-To: <20181005133019.1061-1-olivier.schonken@gmail.com>
References: <20181005133019.1061-1-olivier.schonken@gmail.com>
Message-ID: <20181006155953.43a637c1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  5 Oct 2018 15:30:18 +0200, Olivier Schonken wrote:
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> ---
>  package/cups-filters/cups-filters.hash | 4 ++--
>  package/cups-filters/cups-filters.mk   | 3 ++-
>  2 files changed, 4 insertions(+), 3 deletions(-)

I've applied, but I have one comment, see below.

> -CUPS_FILTERS_VERSION = 1.20.3
> +CUPS_FILTERS_VERSION = 1.21.3
>  CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters
>  CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
>  CUPS_FILTERS_LICENSE_FILES = COPYING
> +CUPS_FILTERS_AUTORECONF = YES

You didn't explain why this autoreconf was needed.

I initially thought it was because the release tarball was broken, with
Makefile.am having a date newer than Makefile.in, and so I added such a
comment in the .mk file when applying your patch.

But of course right after pushing, I realized the existing patch 0001
modifies the Makefile.am, so the AUTORECONF was needed independently of
the package bump.

So, it would have been nice to:

 - Do the AUTORECONF = YES addition in a separate patch. This would
   have easily allowed to backport this fix to our stable branches:
   this problem affects Buildroot 2018.05 and 2018.08.

 - Do the bump in a separate patch.

Could you send a patch based on the 2018.08.x branch that just adds the
AUTORECONF = YES, with the comment I added on top of it ? This will
allow Peter to fix it in 2018.08.x.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
