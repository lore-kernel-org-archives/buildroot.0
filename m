From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Mar 2016 23:37:29 +0100
Subject: [Buildroot] [PATCH 1/1] kbd: fix install to target
In-Reply-To: <1457888388-6429-1-git-send-email-niels@tonebarker.dk>
References: <1457888388-6429-1-git-send-email-niels@tonebarker.dk>
Message-ID: <20160314233729.60a88e3a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Niels,

On Sun, 13 Mar 2016 17:59:48 +0100, Niels Skou Olsen wrote:
> The package makefile attempted to append to KBD_INSTALL_TARGET_OPTS, but this
> fails when done before evaluating $(autotools-package). This is because
> autotools-package uses ?= to set default values. Instead of appending we now
> override KBD_INSTALL_TARGET_OPTS.
> 
> Signed-off-by: Niels Skou Olsen <niels@tonebarker.dk>
> ---
>  package/kbd/kbd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
> index 9dabce1..0243c53 100644
> --- a/package/kbd/kbd.mk
> +++ b/package/kbd/kbd.mk
> @@ -17,6 +17,6 @@ KBD_LICENSE = GPLv2+
>  KBD_LICENSE_FILES = COPYING
>  KBD_AUTORECONF = YES
>  
> -KBD_INSTALL_TARGET_OPTS += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
> +KBD_INSTALL_TARGET_OPTS = MKINSTALLDIRS=$(@D)/config/mkinstalldirs DESTDIR=$(TARGET_DIR) install
>  
>  $(eval $(autotools-package))

Could you submit a patch doing the same change in
package/util-linux/util-linux.mk ? I'm not really happy with how
MKINSTALLDIRS is passed in util-linux.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
