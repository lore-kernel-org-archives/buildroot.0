From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Sun, 5 Apr 2015 13:11:02 -0500
Subject: [Buildroot] [Patch] Added package python-smbus
In-Reply-To: <55080BF0.1020108@vu.nl>
References: <5503198F.6070804@vu.nl>
 <CAGm1_kuM-ZPCdjcSpd_wK-20WZ2+hYOro2DjRZ3dNibTsbLHPg@mail.gmail.com>
 <CAGm1_kuCMhPbFWXdtHSOnGf6ryi2baW59iMEJUrtHA1OW_94JA@mail.gmail.com>
 <5507244E.2080009@vu.nl> <55080BF0.1020108@vu.nl>
Message-ID: <CALq67GBwHM+yC_0u8gSZFN8Ah1ZtH=yuqL7MGRym=+5zc-BsJA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tjeerd,

On Tue, Mar 17, 2015 at 6:11 AM, ir. Tjeerd Pinkert <t.j.pinkert@vu.nl> wrote:
> Hi all,
>
> I managed to add a package python-smbus that installs the i2c-tools py-smbus
> extension so that i2c can be used under python.
>
> Most probably it is better to integrate this somehow into the i2c-tools
> scripts but this is the first onset of getting it working. Hints on how to
> best integrate, if regarded necessary, are welcome.
>
> Best regards,
>
>
> Tjeerd Pinkert

For the future reference, can you please send patches using git? For
more information on this, please see the manual.

http://nightly.buildroot.org/manual.html#submitting-patches

[...]

> diff --git a/package/python-smbus/python-smbus.mk
> b/package/python-smbus/python-smbus.mk
> new file mode 100644
> index 0000000..1673e6a
> --- /dev/null
> +++ b/package/python-smbus/python-smbus.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# python-smbus (i2c-tools python bindings)
> +#
> +################################################################################
> +
> +PYTHON_SMBUS_VERSION = 3.1.1
> +PYTHON_SMBUS_SOURCE = i2c-tools-$(PYTHON_SMBUS_VERSION).tar.bz2
> +PYTHON_SMBUS_SITE = http://dl.lm-sensors.org/i2c-tools/releases

Since you are using i2c-tools package itself, an option should be
added to this package to build and install the python bindings. I was
going to attempt to try to explain the way to do this but it turned
out that it was completely different than what is proposed here. I
will be pushing this out here shortly and would appreciate if you
could test this new patch out.

> +PYTHON_SMBUS_SETUP_TYPE = distutils
> +PYTHON_SMBUS_LICENSE = GPLv2
> +PYTHON_SMBUS_LICENSE_FILES = COPYING
> +PYTHON_SMBUS_DEPENDENCIES = i2c-tools
> +PYTHON_SMBUS_SUBDIR=py-smbus
> +
> +TARGET_CFLAGS += -I../include
> +
> +$(eval $(python-package))

Thanks,
-Ryan
