From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 May 2018 23:04:39 +0200
Subject: [Buildroot] [PATCH 1/2] gst1-plugins-bad: rework license type
 construction
In-Reply-To: <1525633443-942-1-git-send-email-danomimanchego123@gmail.com>
References: <1525633443-942-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20180513210439.GP22130@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi, All,

On 2018-05-06 15:04 -0400, Danomi Manchego spake thusly:
> Use "GST1_PLUGINS_BAD_LICENSE := $(GST1_PLUGINS_BAD_LICENSE), xxxx" construct
> so that the list of licenses is presented as a comma-separated list.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> index 9f7cd97..b001c33 100644
> --- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> +++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> @@ -11,7 +11,7 @@ GST1_PLUGINS_BAD_INSTALL_STAGING = YES
>  # Unknown and GPL licensed plugins will append to GST1_PLUGINS_BAD_LICENSE and
>  # GST1_PLUGINS_BAD_LICENSE_FILES if enabled.
>  GST1_PLUGINS_BAD_LICENSE_FILES = COPYING.LIB
> -GST1_PLUGINS_BAD_LICENSE = LGPL-2.0+, LGPL-2.1+
> +GST1_PLUGINS_BAD_LICENSE := LGPL-2.0+, LGPL-2.1+
>  
>  GST1_PLUGINS_BAD_CONF_OPTS = \
>  	--disable-examples \
> @@ -771,13 +771,13 @@ endif
>  
>  # Add GPL license if GPL licensed plugins enabled.
>  ifeq ($(GST1_PLUGINS_BAD_HAS_GPL_LICENSE),y)
> -GST1_PLUGINS_BAD_LICENSE += GPL
> +GST1_PLUGINS_BAD_LICENSE := $(GST1_PLUGINS_BAD_LICENSE), GPL
>  GST1_PLUGINS_BAD_LICENSE_FILES += COPYING
>  endif
>  
>  # Add Unknown license if Unknown licensed plugins enabled.
>  ifeq ($(GST1_PLUGINS_BAD_HAS_UNKNOWN_LICENSE),y)
> -GST1_PLUGINS_BAD_LICENSE += UNKNOWN
> +GST1_PLUGINS_BAD_LICENSE := $(GST1_PLUGINS_BAD_LICENSE), UNKNOWN
>  endif
>  
>  # Use the following command to extract license info for plugins.
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
