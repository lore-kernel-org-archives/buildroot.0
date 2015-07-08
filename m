From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jul 2015 15:19:47 +0200
Subject: [Buildroot] [PATCH 1/3] lua-periphery: bump version to 1.0.5,
 remove dependency on c-periphery
In-Reply-To: <1432769173-30319-1-git-send-email-vsergeev@gmail.com>
References: <1432769173-30319-1-git-send-email-vsergeev@gmail.com>
Message-ID: <20150708151947.015af64d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vanya Sergeev,

On Wed, 27 May 2015 16:26:11 -0700, Vanya Sergeev wrote:
> The new version of the lua-periphery LuaRocks package handles fetching the
> c-periphery dependency, so that it no longer needs to be cloned during the
> lua-periphery build process. Consequently, this removes the need for selecting
> c-periphery as a package dependency in buildroot and the need for the patches
> that modify lua-periphery to be built against an external c-periphery.
> 
> Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
> ---
>  ...01-Makefile-don-t-clone-build-c-periphery.patch | 32 --------
>  package/lua-periphery/0002-Fix-include-paths.patch | 89 ----------------------
>  package/lua-periphery/Config.in                    |  1 -
>  package/lua-periphery/lua-periphery.mk             |  4 +-
>  4 files changed, 2 insertions(+), 124 deletions(-)
>  delete mode 100644 package/lua-periphery/0001-Makefile-don-t-clone-build-c-periphery.patch
>  delete mode 100644 package/lua-periphery/0002-Fix-include-paths.patch

I've applied, after fixing the dependency as noticed by Baruch. I also
had to add a patch to make lua-periphery build properly with uClibc:
-std=c99 -D_DEFAULT_SOURCE doesn't work well with uClibc, since it
hides the struct timespec and nanosleep() definitions from <time.h>.
Replaced by -std=gnu99.

See
http://git.buildroot.net/buildroot/commit/?id=bdebcd39025bd6413d920b4993f7f70a94934387

Maybe you should look into this and merge a fix upstream?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
