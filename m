From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 23:46:34 +0100
Subject: [Buildroot] [PATCH/next 08/31] package/kodi: not available
 using a musl-based toolchain
In-Reply-To: <1456006176-21308-9-git-send-email-bernd.kuhls@t-online.de>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
 <1456006176-21308-9-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160229234634.4c8b645e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 20 Feb 2016 23:09:13 +0100, Bernd Kuhls wrote:
> The build stops with
> configure: error: unsupported host (i586-buildroot-linux-musl)
> due to musl not being supported in
> https://github.com/xbmc/xbmc/blob/Isengard/m4/xbmc_arch.m4
> 
> Removing this obstacle will show that musl is really not being
> supported, the build will fail:
> 
> In file included from emu_msvcrt.cpp:64:0:
> emu_msvcrt.h:93:3: error: ?__off64_t? does not name a type
>    __off64_t dll_lseeki64(int fd, __off64_t lPos, int iWhence);
>    ^
> emu_msvcrt.h:94:3: error: ?__off_t? does not name a type
>    __off_t dll_lseek(int fd, __off_t lPos, int iWhence);
>    ^
> 
> I know these problems are fixable and the voidlinux projects seems to
> have done it already for 15.2-Isengard:
> https://github.com/voidlinux/void-packages/tree/99f74705bc6520297d689fae4bcc9606c71ad34f/srcpkgs/kodi/patches
> 
> For Jarvis-16.0 these patches have to be rebased at a later stage.
> For now block the Kodi package with musl-based toolchains to avoid
> build errors.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
