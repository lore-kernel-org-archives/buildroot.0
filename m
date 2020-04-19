From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 16:31:35 +0200
Subject: [Buildroot] [WIP] package/efl: bump to version 1.23.3
In-Reply-To: <20200104011453.516356-1-romain.naour@gmail.com>
References: <20200104011453.516356-1-romain.naour@gmail.com>
Message-ID: <20200419163135.53e82041@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  4 Jan 2020 02:14:53 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> - Remove upstream patch [1].
> - Switch to meson build system.
> - The cryptography backends is now mandatory, use openssl for the host
> and use openssl by default for the target if gnutls is not selected.
> - Add host-giflib since the dependency can't be disabled anymore.
> (even by adding gif in HOST_EFL_EVAS_LOADERS_DISABLER).
> - Disable explicitely meson build options that was not previously handled
> (avahi, emotion, ecore-imf-loarders...)
> - Elput support is now enabled through drm meson option [2], remove
>   BR2_PACKAGE_EFL_ELPUT.
> - Update license file hash (csharp licensing information, cxx bindings licensing)
> - Add COPYING.images and licenses/COPYING.ASL license file.
> - The evas png loader is now mandatory [3]
> (even by adding png in EFL_EVAS_LOADERS_DISABLER).
> - Same for the evas gif loader [4].
> - Backport an upstream patch to fix the evas build with -Dwl=false.
> 
> See:
> https://www.enlightenment.org/news/efl-1.23.0
> https://www.enlightenment.org/news/efl-1.23.1
> https://www.enlightenment.org/news/efl-1.23.2
> 
> [1] https://git.enlightenment.org/core/efl.git/commit/?id=c46a8143916f0d3f66bbdffc7107c97c88df212d
> [2] https://git.enlightenment.org/core/efl.git/tree/meson.build?h=v1.23.3#n297
> [3] https://git.enlightenment.org/core/efl.git/tree/src/modules/evas/meson.build?h=v1.23.3#n2
> [4] https://git.enlightenment.org/core/efl.git/tree/src/modules/evas/meson.build?h=v1.23.3#n4
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Since your feedback was that this patch wasn't ready, and that we
should probably wait for EFL 1.24 to be released, I've marked this
patch as Changes Requested. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
