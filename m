From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Mar 2015 11:25:25 +0200
Subject: [Buildroot] [PATCH] mesa3d: specify llvm-prefix
In-Reply-To: <1427757360-20575-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427757360-20575-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150331112525.5db42fa3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 30 Mar 2015 20:16:00 -0300, Gustavo Zacarias wrote:
> When it's not defined an automatic search is triggered, which can find
> /usr/bin/llvm-config on distributions that include all development files
> (like gentoo) and have desktop packages installed.
> So point it towards the staging dir which is where it should live
> eventually if/when we've got it to avoid header/include path polution
> that otherwise leads to build failures.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/mesa3d/mesa3d.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index fc82227..7473110 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -128,4 +128,7 @@ else
>  MESA3D_CONF_OPTS += --disable-gles1 --disable-gles2
>  endif
>  
> +# Avoid automatic search of llvm-config
> +MESA3D_CONF_OPTS += --with-llvm-prefix=$(STAGING_DIR)/usr/bin

Shouldn't we instead test if LLVM is available, explicitly disable LLVM
support if not, and enable it if LLVM is available?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
