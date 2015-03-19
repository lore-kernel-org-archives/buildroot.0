From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 19 Mar 2015 07:26:22 +0200
Subject: [Buildroot] [PATCH] package/numactl: upgrade to 2.0.10
In-Reply-To: <1426736888-29437-4-git-send-email-steven@uplinklabs.net>
References: <1426736888-29437-1-git-send-email-steven@uplinklabs.net>
 <1426736888-29437-4-git-send-email-steven@uplinklabs.net>
Message-ID: <20150319052622.GT2415@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Steven,

On Wed, Mar 18, 2015 at 08:48:06PM -0700, Steven Noonan wrote:
> Signed-off-by: Steven Noonan <steven@uplinklabs.net>

This is a non trivial version bump. Please explain here that the package now 
uses the autotools infrastructure.

> ---
>  package/numactl/numactl.mk | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
> index f36a1b3..042f2d8 100644
> --- a/package/numactl/numactl.mk
> +++ b/package/numactl/numactl.mk
> @@ -4,17 +4,11 @@
>  #
>  ################################################################################
>  
> -NUMACTL_VERSION = 2.0.9
> +NUMACTL_VERSION = 2.0.10
>  NUMACTL_SITE = ftp://oss.sgi.com/www/projects/libnuma/download
>  NUMACTL_LICENSE = LGPLv2.1 (libnuma), GPLv2 (programs)
>  NUMACTL_LICENSE_FILES = README
>  
> -define NUMACTL_BUILD_CMDS
> -	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
> -endef
> +NUMACTL_AUTORECONF = YES

Why? Please add inline comment clarifying that.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
