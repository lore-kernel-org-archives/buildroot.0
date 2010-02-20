From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2010 16:20:06 +0100
Subject: [Buildroot] [PATCH 08/10] external toolchain: fix strip of
 libraries
In-Reply-To: <1265561742-5924-9-git-send-email-llandwerlin@gmail.com>
References: <1265561742-5924-1-git-send-email-llandwerlin@gmail.com>
	<1265561742-5924-9-git-send-email-llandwerlin@gmail.com>
Message-ID: <20100220162006.4606227c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


This is needed and should be included in 2010.02.

Lionel, for your next patches, would it be possible to give a slightly
more detailed commit message ? Just "fix strip of libraries" is not
enough to understand what you are fixing, and therefore does not make
the review of your patches easy. Thanks! :-)

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

On Sun,  7 Feb 2010 17:55:40 +0100
llandwerlin at gmail.com wrote:

> From: Lionel Landwerlin <llandwerlin@gmail.com>
> 
> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
> ---
>  toolchain/external-toolchain/ext-tool.mk |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/toolchain/external-toolchain/ext-tool.mk
> b/toolchain/external-toolchain/ext-tool.mk index 1f5aa19..39faf84
> 100644 --- a/toolchain/external-toolchain/ext-tool.mk
> +++ b/toolchain/external-toolchain/ext-tool.mk
> @@ -56,9 +56,9 @@ copy_toolchain_lib_root = \
>  			elif test -f $${LIB_DIR}/$${LIB}; then \
>  				$(INSTALL) -D -m0755
> $${LIB_DIR}/$${LIB} $(TARGET_DIR)$${DST}/$${LIB}; \ case "$${STRIP}"
> in \
> -				(0 | n | no) \
> -;; \
>  				(*) \
> +;; \
> +				(y) \
>  					$(TARGET_CROSS)strip
> "$(TARGET_DIR)$${DST}/$${LIB}"; \ ;; \
>  				esac; \


-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
