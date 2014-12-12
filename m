From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Dec 2014 09:58:24 +0100
Subject: [Buildroot] [PATCH 2/3] iprutils: Don't include host headers
In-Reply-To: <1418340467-29999-2-git-send-email-romain.naour@openwide.fr>
References: <1418340467-29999-1-git-send-email-romain.naour@openwide.fr>
 <1418340467-29999-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141212095824.2c30720f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Fri, 12 Dec 2014 00:27:46 +0100, Romain Naour wrote:
> Fixes:
> ERROR: unsafe header/library path used in cross-compilation: '/usr/include/ncurses'
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/iprutils/iprutils.mk | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/iprutils/iprutils.mk b/package/iprutils/iprutils.mk
> index 53516b6..0721fbf 100644
> --- a/package/iprutils/iprutils.mk
> +++ b/package/iprutils/iprutils.mk
> @@ -12,11 +12,14 @@ IPRUTILS_LICENSE = Common Public License Version 1.0
>  IPRUTILS_LICENSE_FILES = LICENSE
>  
>  define IPRUTILS_BUILD_CMDS
> -	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
> +		INCLUDEDIR="-I. -I$(STAGING_DIR)/usr/include/ncurses" \
> +		-C $(@D) all

Thanks. Shouldn't we instead patch the Makefile itself, and submit the
change upstream?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
