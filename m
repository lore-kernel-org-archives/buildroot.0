From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 20:51:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/clamav: needs dynamic library
In-Reply-To: <20200923175436.71450-1-bernd.kuhls@t-online.de>
References: <20200923175436.71450-1-bernd.kuhls@t-online.de>
Message-ID: <20200923205102.4bfbe959@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 23 Sep 2020 19:54:36 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Upstream commit
> https://github.com/Cisco-Talos/clamav-devel/commit/9e20cdf6eaf545a66f55ce5ba85ef9a98dad3648
> added dlopen() to others.c
> https://github.com/Cisco-Talos/clamav-devel/blob/dev/0.104/libclamav/others.c#L199
> 
> "libclamav used to build in multiple stages where an earlier stage is
> a static library containing utils required by the "shared" code.
> Linking clamdscan and clamdtop with this libclamav utils static lib
> allowed these two apps to function without libclamav. While this is
> nice in theory, the practical gains are minimal and it complicates
> the build system. As such, the autotools and CMake tooling was
> simplified for improved maintainability and this feature was thrown
> out. clamdtop and clamdscan now require libclamav to function."
> 
> Fixes:
> http://autobuild.buildroot.net/results/e27/e276894781e3e37fbc03a0745738c61541e0a211/
> http://autobuild.buildroot.net/results/552/552ee8d9e44152c9d7e315a5491542771264d466/
> http://autobuild.buildroot.net/results/fde/fde4af47542f0eb0bd57b172c99bd086eb566b76/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/clamav/Config.in | 6 +++---
>  package/clamav/clamav.mk | 3 ---
>  2 files changed, 3 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
