From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 10:15:10 +0200
Subject: [Buildroot] [PATCH] package/scons: explicitly specify host
 Python 3
In-Reply-To: <20200714033927.1516172-1-hancock@sedsystems.ca>
References: <20200714033927.1516172-1-hancock@sedsystems.ca>
Message-ID: <20200714101510.378d1909@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Jul 2020 21:39:27 -0600
Robert Hancock <hancock@sedsystems.ca> wrote:

> All packages using scons are now using Python 3 to run it, so
> explicitly set scons as using host-python3. This avoids a
> spurious host Python 2 dependency if BR2_PACKAGE_PYTHON3 is not
> set (for example, if no Python is packaged for the target).
> 
> Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
> ---
>  package/scons/scons.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/scons/scons.mk b/package/scons/scons.mk
> index da2ccceb08..a95fa7fd69 100644
> --- a/package/scons/scons.mk
> +++ b/package/scons/scons.mk
> @@ -10,6 +10,8 @@ SCONS_LICENSE = MIT
>  SCONS_LICENSE_FILES = LICENSE.txt
>  SCONS_SETUP_TYPE = distutils
>  
> +HOST_SCONS_NEEDS_HOST_PYTHON = python3

I am just wondering if we should do our usual dance that consists in
relying on python2 if enabled, i.e something like this:

HOST_SCONS_NEEDS_HOST_PYTHON = $(if ($(BR2_PACKAGE_PYTHON),python,python3)

or if we simply stop doing this and say that we switch to just python3.

Titouan, what do you think ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
