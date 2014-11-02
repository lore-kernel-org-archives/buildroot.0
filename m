From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 2 Nov 2014 07:51:54 +0200
Subject: [Buildroot] [PATCH v2 1/3] skeleton: add support for
 /etc/ld.so.conf.d/*.conf files
In-Reply-To: <1414768749-15134-1-git-send-email-jezz@sysmic.org>
References: <1414768749-15134-1-git-send-email-jezz@sysmic.org>
Message-ID: <20141102055154.GF2358@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?r?me,

On Fri, Oct 31, 2014 at 04:19:07PM +0100, J?r?me Pouiller wrote:
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  toolchain/toolchain.mk | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/toolchain/toolchain.mk b/toolchain/toolchain.mk
> index 3f9900b..cd65cfc 100644
> --- a/toolchain/toolchain.mk
> +++ b/toolchain/toolchain.mk
> @@ -13,6 +13,31 @@ endef
>  TARGET_FINALIZE_HOOKS += GLIBC_COPY_NSSWITCH_FILE
>  endif
>  
> +# - glibc can include configuration files at runtime
> +# - uclibc does not support "include" feature
> +# - musl use /etc/ld-musl-${ARCH}.path file. This file use same syntax
> +#     than $LD_LIBRARY_PATH. Since there are plenty of corner cases in

s/than/as/

> +#     generation of this file, we prefer to not support it. User can
> +#     fix the problem by providing file manualy (in a an overlay).

Redundant "a".

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
