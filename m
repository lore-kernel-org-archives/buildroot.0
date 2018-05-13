From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 May 2018 23:07:15 +0200
Subject: [Buildroot] [PATCH 2/2] gst1-plugins-bad: update plugin licenses
In-Reply-To: <1525633443-942-2-git-send-email-danomimanchego123@gmail.com>
References: <1525633443-942-1-git-send-email-danomimanchego123@gmail.com>
 <1525633443-942-2-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20180513210715.GQ22130@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi, All,

On 2018-05-06 15:04 -0400, Danomi Manchego spake thusly:
> Update several of the licenses annotated in the gst1-plugins-bad.mk file.
> 
> 1. Specify GPL-2.0 in license info.
> * All of the *.[ch] that specify GPL also specify version 2 or later.
> 
> 2. Remove GPL from audiovisualizers.
> * Changlog notes move from GPL to LGPL. (2015-04-25)
> * docs/plugins/inspect/plugin-audiovisualizers.xml claims "LGPL".
> * All *.[ch] files under ./gst/audiovisualizers says "GNU Library General Public License".

s/says/say/ # plural

> 3. Add GPL to yadif.
> * Changelog notes that yadif is "GPL". (2013-02-07)
> * docs/plugins/inspect/plugin-yadif.xml calims "GPL".

s/calims/claims/

If it were not for that one, I would have let the others slip through.
;-)

> * All *.[ch] files under ./gst/yadif says "GNU General Public License" except for one "GNU Library General Public License".

s/says/say/ # plural

> 4. Remove UNKNOWN from fdk_aac.
> * docs/plugins/inspect/plugin-fdkaac.xml claims "LGPL".
> * All *.[ch] files under ./ext/fdkaac says "GNU Lesser" or "GNU Library General Public License".

s/says/say/ # plural

> 5. Add BSD-2c to dtls.
> * docs/plugins/inspect/plugin-dtls.xml calims "BSD".
> * All *.[ch] files under ./gst/dtls has BSD-2c text.

s/has/have/ # plural

> 6. Add BSD-2c to openh264.
> * Changelog notes that openh264 is "BSD-2". (2014-10-03)
> * docs/plugins/inspect/plugin-openh264.xml calims "BSD".
> * All *.[ch] files under ./ext/openh264 has BSD-2c text.

s/has/have/ # plural

> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> index b001c33..90e2209 100644
> --- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> +++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> @@ -8,7 +8,7 @@ GST1_PLUGINS_BAD_VERSION = 1.12.4
>  GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
>  GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
>  GST1_PLUGINS_BAD_INSTALL_STAGING = YES
> -# Unknown and GPL licensed plugins will append to GST1_PLUGINS_BAD_LICENSE and
> +# Additional plugin licenses will be appended to GST1_PLUGINS_BAD_LICENSE and
>  # GST1_PLUGINS_BAD_LICENSE_FILES if enabled.
>  GST1_PLUGINS_BAD_LICENSE_FILES = COPYING.LIB
>  GST1_PLUGINS_BAD_LICENSE := LGPL-2.0+, LGPL-2.1+
> @@ -198,7 +198,6 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOVISUALIZERS),y)
>  GST1_PLUGINS_BAD_CONF_OPTS += --enable-audiovisualizers
> -GST1_PLUGINS_BAD_HAS_GPL_LICENSE = y
>  else
>  GST1_PLUGINS_BAD_CONF_OPTS += --disable-audiovisualizers
>  endif
> @@ -514,6 +513,7 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_YADIF),y)
>  GST1_PLUGINS_BAD_CONF_OPTS += --enable-yadif
> +GST1_PLUGINS_BAD_HAS_GPL_LICENSE = y
>  else
>  GST1_PLUGINS_BAD_CONF_OPTS += --disable-yadif
>  endif
> @@ -585,7 +585,6 @@ endif
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FDK_AAC),y)
>  GST1_PLUGINS_BAD_CONF_OPTS += --enable-fdk_aac
>  GST1_PLUGINS_BAD_DEPENDENCIES += fdk-aac
> -GST1_PLUGINS_BAD_HAS_UNKNOWN_LICENSE = y
>  else
>  GST1_PLUGINS_BAD_CONF_OPTS += --disable-fdk_aac
>  endif
> @@ -632,6 +631,7 @@ endif
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DTLS),y)
>  GST1_PLUGINS_BAD_CONF_OPTS += --enable-dtls
>  GST1_PLUGINS_BAD_DEPENDENCIES += openssl
> +GST1_PLUGINS_BAD_HAS_BSD2C_LICENSE = y
>  else
>  GST1_PLUGINS_BAD_CONF_OPTS += --disable-dtls
>  endif
> @@ -682,6 +682,7 @@ endif
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENH264),y)
>  GST1_PLUGINS_BAD_CONF_OPTS += --enable-openh264
>  GST1_PLUGINS_BAD_DEPENDENCIES += libopenh264
> +GST1_PLUGINS_BAD_HAS_BSD2C_LICENSE = y
>  else
>  GST1_PLUGINS_BAD_CONF_OPTS += --disable-openh264
>  endif
> @@ -771,10 +772,15 @@ endif
>  
>  # Add GPL license if GPL licensed plugins enabled.
>  ifeq ($(GST1_PLUGINS_BAD_HAS_GPL_LICENSE),y)
> -GST1_PLUGINS_BAD_LICENSE := $(GST1_PLUGINS_BAD_LICENSE), GPL
> +GST1_PLUGINS_BAD_LICENSE := $(GST1_PLUGINS_BAD_LICENSE), GPL-2.0+
>  GST1_PLUGINS_BAD_LICENSE_FILES += COPYING
>  endif
>  
> +# Add BSD license if BSD licensed plugins enabled.
> +ifeq ($(GST1_PLUGINS_BAD_HAS_BSD2C_LICENSE),y)
> +GST1_PLUGINS_BAD_LICENSE := $(GST1_PLUGINS_BAD_LICENSE), BSD-2-Clause
> +endif
> +
>  # Add Unknown license if Unknown licensed plugins enabled.
>  ifeq ($(GST1_PLUGINS_BAD_HAS_UNKNOWN_LICENSE),y)
>  GST1_PLUGINS_BAD_LICENSE := $(GST1_PLUGINS_BAD_LICENSE), UNKNOWN
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
