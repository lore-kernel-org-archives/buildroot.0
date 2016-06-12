From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 21:33:37 +0200
Subject: [Buildroot] [PATCH] 4th: new package
In-Reply-To: <1461174958-14789-1-git-send-email-francois.perrad@gadz.org>
References: <1461174958-14789-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20160612213337.2fd115e0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Apr 2016 19:55:58 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/4th/0001-fix-Makefile.patch | 27 ++++++++++++++++
>  package/4th/4th.hash                |  2 ++
>  package/4th/4th.mk                  | 64 +++++++++++++++++++++++++++++++++++++
>  package/4th/Config.in               |  8 +++++
>  package/Config.in                   |  1 +
>  5 files changed, 102 insertions(+)
>  create mode 100644 package/4th/0001-fix-Makefile.patch
>  create mode 100644 package/4th/4th.hash
>  create mode 100644 package/4th/4th.mk
>  create mode 100644 package/4th/Config.in

I was about to apply your patch, with some minimal changes (see
http://code.bulix.org/i2s65n-101064), but there is one fundamental
license issue here.

The COPYING file, as well as documentation/license.txt contain the
license text of the LGPLv3. But the source code (sources/*.c) all claim
to be licensed under the GPLv3. Only the .4th files are under LGPLv3.

This is clearly not good. Could you talk with upstream to get this
situation resolved?

Also, another comment below.

> diff --git a/package/4th/0001-fix-Makefile.patch b/package/4th/0001-fix-Makefile.patch
> new file mode 100644
> index 0000000..4acc6d3
> --- /dev/null
> +++ b/package/4th/0001-fix-Makefile.patch
> @@ -0,0 +1,27 @@
> +fix Makefile

This is not a proper description. Say what you're fixing, and why.

> +
> +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> +
> +diff --git a/sources/Makefile b/sources/Makefile
> +index e1b97a5..3a50d0f 100644
> +--- a/sources/Makefile
> ++++ b/sources/Makefile
> +@@ -32,7 +32,6 @@ OBJ4TH = errs_4th.o save_4th.o load_4th.o free_4th.o comp_4th.o \
> + 	name_4th.o dump_4th.o exec_4th.o open_4th.o cgen_4th.o \
> + 	str2cell.o
> + 
> +-.INTERMEDIATE: stage stage.c
> + 
> + all: 4th 4tsh pp4th lib4th
> + 
> +@@ -120,7 +119,7 @@ ifdef SHARED
> + 	ln -sf $(SHARED_LIB) $(LIBRARIES)/lib4th.so
> + endif
> + 
> +-mostlyinstall: libinstall all
> ++mostlyinstall: libinstall
> + 	cp 4th 4tsh pp4th $(BINARIES)
> + 
> + install: mostlyinstall

You're fixing two completely different things here, so two patches are
needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
