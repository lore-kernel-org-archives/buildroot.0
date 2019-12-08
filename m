From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 16:02:13 +0100
Subject: [Buildroot] [PATCH v6 1/6] package/polkit: bump to version 0.116
In-Reply-To: <20191206234649.3972927-1-aduskett@gmail.com>
References: <20191206234649.3972927-1-aduskett@gmail.com>
Message-ID: <20191208160213.030635f6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  6 Dec 2019 15:46:44 -0800
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Other changes:
>   - Add spidermonkey as a dependency.
>   - Add 0001-make-netgroup-support-optional.patch to allow building on musl.
>   - Add a runtime dependency on dbus.
>   - Add --disable-libelongind.
>   - Add --disable-libsystemd-login.
>   - Update dependencies for systemd pam support.
>   - Update dependencies for udisks.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> changes v1 -> v6:
>   - Add depends on BR2_HOST_GCC_AT_LEAST_4_9 to the following:
>     - package/polkit/Config.in
>     - package/systemd/Config.in
>     - package/udisks/Config.in

To do the same as systemd, I changed the "depends on BR2_PACKAGE_DBUS"
to a "select BR2_PACKAGE_DBUS", made a few minor tweaks, and applied to
master. Thanks a lot for taking care of this difficult package!

One direction that would be nice to look at is to enable spidermonkey
and then polkit on uClibc. Regarding the fenv issue, perhaps we could
have a boolean that says whether uClibc provides fenv support for the
current architecture, and then treat this as an architecture dependency
inside BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS ? How many architectures
have sufficient fenv support in uClibc for spidermonkey ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
