From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 9 Mar 2012 07:22:03 +0100
Subject: [Buildroot] [PATCH 02/13] Remove cc-option: not used anywhere
In-Reply-To: <e6e059533bc0816be642955a5c7d5b1edf9a5377.1331148806.git.thomas.petazzoni@free-electrons.com>
References: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
 <e6e059533bc0816be642955a5c7d5b1edf9a5377.1331148806.git.thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LUUBiADQ=ofWaaDnAWRmeVL7QoYJxi63OAZbasAc6Z2DA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 7, 2012 at 8:34 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

> ---
> ?Makefile | ? ?7 -------
> ?1 files changed, 0 insertions(+), 7 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index bfa82d2..7cc2380 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -177,13 +177,6 @@ BUILD_DIR:=$(BASE_DIR)/build
>
> ?ifeq ($(BR2_HAVE_DOT_CONFIG),y)
>
> -# cc-option
> -# Usage: cflags-y+=$(call cc-option, -march=winchip-c6, -march=i586)
> -# sets -march=winchip-c6 if supported else falls back to -march=i586
> -# without checking the latter.
> -cc-option=$(shell if $(TARGET_CC) $(TARGET_CFLAGS) $(1) -S -o /dev/null -xc /dev/null \
> - ? ? ? > /dev/null 2>&1; then echo "$(1)"; else echo "$(2)"; fi ;)
> -
> ?#############################################################
> ?#
> ?# Hide troublesome environment variables from sub processes
> --
> 1.7.4.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
