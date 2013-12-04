From: Matthew Weber <mlweber1@rockwellcollins.com>
Date: Wed, 4 Dec 2013 13:43:39 -0600
Subject: [Buildroot] [PATCH] grub: force -m32 so we build grub 32 bits
 on 64 bits architecture
In-Reply-To: <1386185630-23338-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386185630-23338-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <OFB7ABDFDE.8F5D1D2E-ON86257C37.006C50DA-86257C37.006C5DF6@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 12/04/2013 
01:33:50 PM:

> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: buildroot at uclibc.org
> Cc: Matthew Weber <mlweber1@rockwellcollins.com>
> Date: 12/04/2013 01:33 PM
> Subject: [PATCH] grub: force -m32 so we build grub 32 bits on 64 
> bits architecture
> 
> As reported by Matthew Weber, Grub doesn't build on 64 bits build
> machines, because the host compiler produces 64 bits binaries by
> default, while Grub should be built 32 bits. Therefore, this commit
> passes -m32 to the Grub CFLAGS, so that 32 bits binaries are always
> produced.
> 
> Reported-by: Matthew Weber <mlweber1@rockwellcollins.com>
> Cc: Matthew Weber <mlweber1@rockwellcollins.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Tested-by:  Matthew Weber <mlweber1@rockwellcollins.com>

Thanks Thomas!


> ---
>  boot/grub/grub.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
> index 6ba02cd..eb066af 100644
> --- a/boot/grub/grub.mk
> +++ b/boot/grub/grub.mk
> @@ -70,7 +70,7 @@ GRUB_POST_PATCH_HOOKS += GRUB_DEBIAN_PATCHES
> 
>  GRUB_CONF_ENV = \
>     $(HOST_CONFIGURE_OPTS) \
> -   CFLAGS="$(HOST_CFLAGS) $(GRUB_CFLAGS)"
> +   CFLAGS="$(HOST_CFLAGS) $(GRUB_CFLAGS) -m32"
> 
>  GRUB_CONF_OPT = \
>     --disable-auto-linux-mem-opt \
> -- 
> 1.8.1.2
> 
