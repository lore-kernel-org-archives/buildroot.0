From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 22:07:16 +0100
Subject: [Buildroot] [PATCH v5 1/1] mesa3d-demos: new package
In-Reply-To: <1413576428-22723-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413576428-22723-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141026220716.03b6524d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 17 Oct 2014 22:07:08 +0200, Bernd Kuhls wrote:
> From: Spenser Gilliland <spenser@gillilanding.com>
> 
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v5: - fixed wrong position in package/Config.in
> v4: - rebased Spenser?s patch: http://patchwork.ozlabs.org/patch/278305/
>     - bumped to 8.2.0
>     - added mandatory dependency to libglu and libglew for OpenGL support
>     - renamed options for virtual GL packages

Applied. I've just added MESA3D_DEMOS_LICENSE, and renamed the patches
to follow the proper naming convention.

I must say I was a bit surprised by the following piece of code:

+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES \
+		|| BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBOPENVG

but apparently, there are indeed independent options in the configure
script. We'll see how things go in the autobuilders :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
