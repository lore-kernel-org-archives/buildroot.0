From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 May 2018 22:36:21 +0200
Subject: [Buildroot] [PATCH 1/1] gst1-plugins-bad: conditionally add gpl
 license
In-Reply-To: <1523502130-21870-1-git-send-email-danomimanchego123@gmail.com>
References: <1523502130-21870-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20180503203621.GD2453@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi, All,

On 2018-04-11 23:02 -0400, Danomi Manchego spake thusly:
> Currently, GST1_PLUGINS_BAD_LICENSE_FILES starts out set to
> both the GPL COPYING file and the LGPL COPYING.LIB file, but
> the GST1_PLUGINS_BAD_LICENSE handling only claims LGPL, and
> then intelligently adds GPL if needed.  This change moves the
> GPL file addition to the same conditional clause so that the
> GPL file is included in the legal-info location only if GPL
> code is actually used.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> index 83cb94b..9f7cd97 100644
> --- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> +++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> @@ -8,9 +8,9 @@ GST1_PLUGINS_BAD_VERSION = 1.12.4
>  GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
>  GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
>  GST1_PLUGINS_BAD_INSTALL_STAGING = YES
> -GST1_PLUGINS_BAD_LICENSE_FILES = COPYING COPYING.LIB
> -# Unknown and GPL licensed plugins will append to GST1_PLUGINS_BAD_LICENSE if
> -# enabled.
> +# Unknown and GPL licensed plugins will append to GST1_PLUGINS_BAD_LICENSE and
> +# GST1_PLUGINS_BAD_LICENSE_FILES if enabled.
> +GST1_PLUGINS_BAD_LICENSE_FILES = COPYING.LIB
>  GST1_PLUGINS_BAD_LICENSE = LGPL-2.0+, LGPL-2.1+
>  
>  GST1_PLUGINS_BAD_CONF_OPTS = \
> @@ -772,6 +772,7 @@ endif
>  # Add GPL license if GPL licensed plugins enabled.
>  ifeq ($(GST1_PLUGINS_BAD_HAS_GPL_LICENSE),y)
>  GST1_PLUGINS_BAD_LICENSE += GPL
> +GST1_PLUGINS_BAD_LICENSE_FILES += COPYING
>  endif
>  
>  # Add Unknown license if Unknown licensed plugins enabled.
> -- 
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
