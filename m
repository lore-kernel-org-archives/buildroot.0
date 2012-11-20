From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Nov 2012 18:42:57 +0100
Subject: [Buildroot] [PATCH] toolchain-crosstool-ng: install
	libthread_db if appropriate
In-Reply-To: <1353430797-26819-1-git-send-email-rbraun@sceen.net>
References: <1353430797-26819-1-git-send-email-rbraun@sceen.net>
Message-ID: <201211201842.57212.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 20 November 2012 Richard Braun wrote:
> Signed-off-by: Richard Braun <rbraun@sceen.net>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
> index 5f9119d..ebc7b4b 100644
> --- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
> +++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
> @@ -41,6 +41,10 @@ uclibc-source: $(CTNG_DIR)/.config
>  CTNG_LIBS_LIB := ld*.so libc.so libcrypt.so libdl.so libgcc_s.so libm.so    \
>                   libnsl.so libpthread.so libresolv.so librt.so libutil.so
>  
> +ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
> +CTNG_LIBS_LIB += libthread_db.so
> +endif
> +
>  #--------------
>  # The libc-specific system libraries (in /lib)
>  # Note: it may be needed to tweak the NSS libs in the glibc and eglibc cases...
> -- 
> 1.7.2.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
