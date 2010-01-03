From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sun, 03 Jan 2010 01:13:45 +0100
Subject: [Buildroot] [PATCH] Permit building grub with an external
 toolchain.
In-Reply-To: <1262472376.23927.19.camel@venture>
References: <1262472376.23927.19.camel@venture>
Message-ID: <1262477625.23193.2.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le samedi 02 janvier 2010 ? 17:46 -0500, Clark Rawlins a ?crit :
> Grub build failed at the link stage because it
> couldn't find libcurses. Adding these variable
> invocations to the configure line make it work.
> 
> Signed-off-by: Clark Rawlins <clark.rawlins@escient.com>
> ---
>  target/x86/grub/grub.mk |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/target/x86/grub/grub.mk b/target/x86/grub/grub.mk
> index af46244..21f089f 100644
> --- a/target/x86/grub/grub.mk
> +++ b/target/x86/grub/grub.mk
> @@ -81,6 +81,8 @@ $(GRUB_DIR)/.unpacked: $(DL_DIR)/$(GRUB_SOURCE) $(DL_DIR)/$(GRUB_PATCH)
>  $(GRUB_DIR)/.configured: $(GRUB_DIR)/.unpacked
>  	(cd $(GRUB_DIR); rm -rf config.cache; \
>  		$(TARGET_CONFIGURE_OPTS) \
> +		$(TARGET_CONFIGURE_ARGS) \
> +		$(TARGET_CONFIGURE_ENV) \
>  		CFLAGS="$(TARGET_CFLAGS)" \
>  		CPPFLAGS="$(GRUB_CFLAGS)" \
>  		./configure $(QUIET) \

Maybe you should consider switching grub to the autotool infrastructure.

-- 
Lionel Landwerlin
