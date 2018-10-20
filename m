From: Romain Naour <romain.naour@smile.fr>
Date: Sat, 20 Oct 2018 16:50:31 +0200
Subject: [Buildroot] [PATCH v8 1/4] package/mesa3d: disable opencl
In-Reply-To: <1540046091-13736-2-git-send-email-valentinkorenblit@gmail.com>
References: <1540046091-13736-1-git-send-email-valentinkorenblit@gmail.com>
 <1540046091-13736-2-git-send-email-valentinkorenblit@gmail.com>
Message-ID: <d849780c-9cb3-c3c0-abf8-ecd0ed347b6f@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 20/10/2018 ? 16:34, Valentin Korenblit a ?crit?:
> Preliminary patch to prevent Mesa from building OpenCL lib as
> soon as libclc is available.
> 
> Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
> Signed-off-by: Valentin Korenblit <valentinkorenblit@gmail.com>
Acked-by: Romain Naour <romain.naour@smile.fr>

> ---
>  package/mesa3d/mesa3d.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 23de2eb..48041dd 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -43,6 +43,9 @@ else
>  MESA3D_CONF_OPTS += --disable-llvm
>  endif
>  
> +# Disable opencl in case libclc is detected
> +MESA3D_CONF_OPTS += --disable-opencl
> +
>  ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS),y)
>  MESA3D_DEPENDENCIES += elfutils
>  endif
> 
