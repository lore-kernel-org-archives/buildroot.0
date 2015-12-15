From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 23:14:08 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/mesa3d-demos: Disable glesv1
 support
In-Reply-To: <1450074776-18055-1-git-send-email-bernd.kuhls@t-online.de>
References: <1450074776-18055-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151215231408.6fadbb08@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Mon, 14 Dec 2015 07:32:55 +0100, Bernd Kuhls wrote:
> The only files enabled by glesv1 support are in src/egl/opengles1/
> 
> Quoting src/egl/opengles1/Makefile.am:
> 
> "# These programs aren't intended to be included with the normal distro."
> "# They're not too interesting but they're good for testing."
> 
> Most of the files present in this directory contain
> 
> "#include <X11/Xlib.h>"
> 
> which breaks a wayland-only build because the build system does not take
> care of the x11 dependency here. Since these files are "not too
> interesting" anyway we just disable glesv1 support.
> 
> Fixes
> http://autobuild.buildroot.net/results/b3e/b3ed3ee174a3ddce84bf64039eac39d4e6e75b71/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: fixed patch description, git does not like "#" in comments ;) (Thomas)
>     split 0001-demos-optional-gl.patch into seperate patch

Both applied. For the first patch, I had to adapt it slightly, since it
didn't apply directly on top of master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
