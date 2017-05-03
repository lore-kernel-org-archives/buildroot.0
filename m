From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 May 2017 16:22:44 +0200
Subject: [Buildroot] [PATCH 2/2] picocom: force target LDFLAGS
In-Reply-To: <f7abac9c0ca017bffd3109f7df0d6bfa7f099281.1493815595.git.baruch@tkos.co.il>
References: <04e1e4d95a425dfc0e0650088cb0120a9f3e46a8.1493815595.git.baruch@tkos.co.il>
 <f7abac9c0ca017bffd3109f7df0d6bfa7f099281.1493815595.git.baruch@tkos.co.il>
Message-ID: <20170503162244.5b67294e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  3 May 2017 15:46:35 +0300, Baruch Siach wrote:
> This allows a static build of picocom when BR2_STATIC_LIBS=y but the toolchain
> provides static and shared libraries.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/picocom/picocom.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
> index 07bda0e745cd..4e25556f4c55 100644
> --- a/package/picocom/picocom.mk
> +++ b/package/picocom/picocom.mk
> @@ -10,7 +10,8 @@ PICOCOM_LICENSE = GPL-2.0+
>  PICOCOM_LICENSE_FILES = LICENSE.txt
>  
>  define PICOCOM_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
> +		LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)

We already pass LDFLAGS in $(TARGET_CONFIGURE_OPTS). Should we pass
$(TARGET_CONFIGURE_OPTS) on the right hand side of $(MAKE) ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
