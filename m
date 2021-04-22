From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Apr 2021 23:01:47 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/nut: bump version
In-Reply-To: <20210403081953.695534-1-bernd.kuhls@t-online.de>
References: <20210403081953.695534-1-bernd.kuhls@t-online.de>
Message-ID: <20210422230147.53e2fe0c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  3 Apr 2021 10:19:53 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> The last release is five years old. To support newer hardware we bump
> the package to latest git master branch. For upstream discussion see
> github issue 819.
> 
> Removed patches, they were all applied upstream.
> 
> Added NUT_PRE_CONFIGURE_HOOKS to fix autoreconf:
> 
> configure.ac:1994: error: required file 'scripts/augeas/nutupsconf.aug.in' not found
> configure.ac:1994: error: required file 'scripts/devd/nut-usb.conf.in' not found
> configure.ac:1994: error: required file 'scripts/udev/nut-usbups.rules.in' not found
> 
> because upstream autogen.sh creates additional files:
> https://github.com/networkupstools/nut/blob/master/autogen.sh
> 
> Configure is not cross-compile friendly:
> https://github.com/networkupstools/nut/blob/master/m4/ax_c_pragmas.m4#L574
> Add ax_cv__printf_string_null=yes to fix cross build.
> 
> Removed configure option --without-hal due to upstream removal of hal
> files:
> https://github.com/networkupstools/nut/commit/5860c09e85278e597f85d26b3a23be8c80c199e8
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: - to make use of NUT_AUTORECONF added pre-configure hook (Yann)
>       but without the need for host-python
>     - removed configure option --without-hal

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
