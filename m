From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Apr 2020 23:30:07 +0200
Subject: [Buildroot] [PATCH] package/armadio: fix build when host has
 hdf5
In-Reply-To: <20200420160748.26197-1-gwenj@trabucayre.com>
References: <20200420160748.26197-1-gwenj@trabucayre.com>
Message-ID: <20200420213007.GQ5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gwenhael, All,

On 2020-04-20 18:07 +0200, Gwenhael Goavec-Merou spake thusly:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> When host computer has hdf5 library installed, armadillo fails to build with:
> 
> [...]
> aarch64-buildroot-linux-gnu-g++: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include/hdf5/serial'
> make[3]: *** [CMakeFiles/armadillo.dir/build.make:63: CMakeFiles/armadillo.dir/src/wrapper1.cpp.o] Error 1
> aarch64-buildroot-linux-gnu-g++: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include/hdf5/serial'
> [...]
> 
> This issue seems known and is mentionned in a message, displayed at detection step:
> 
> [...]
> -- *** If use of HDF5 is causing problems,
> -- *** rerun cmake with HDF5 detection disabled:
> -- *** cmake -D DETECT_HDF5=false .
> --
> [...]
> 
> Since hdf5 in not supported by buildroot, this patch force disabling this detection.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Applied to master, after fixing the package name in the title. Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/armadillo/armadillo.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
> index d9a28e9878..f693d8c946 100644
> --- a/package/armadillo/armadillo.mk
> +++ b/package/armadillo/armadillo.mk
> @@ -12,4 +12,6 @@ ARMADILLO_INSTALL_STAGING = YES
>  ARMADILLO_LICENSE = Apache-2.0
>  ARMADILLO_LICENSE_FILES = LICENSE.txt
>  
> +ARMADILLO_CONF_OPTS = -DDETECT_HDF5=false
> +
>  $(eval $(cmake-package))
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
