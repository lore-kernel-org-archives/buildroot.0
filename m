From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Mar 2020 22:14:26 +0100
Subject: [Buildroot] [PATCH/next 6/6] package/linphone: bump to version
 4.3.1
In-Reply-To: <20200227174714.3727844-6-fontaine.fabrice@gmail.com>
References: <20200227174714.3727844-1-fontaine.fabrice@gmail.com>
 <20200227174714.3727844-6-fontaine.fabrice@gmail.com>
Message-ID: <20200309221426.3baa2d33@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Thu, 27 Feb 2020 18:47:14 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> -LINPHONE_AUTORECONF = YES
> +	-DENABLE_ADVANCED_IM=OFF \
> +	-DENABLE_CXX_WRAPPER=OFF \
> +	-DENABLE_DB_STORAGE=OFF \
> +	-DENABLE_LIME=OFF \
> +	-DENABLE_LIME_X3DH=OFF \
> +	-DENABLE_STRICT=OFF \
> +	-DENABLE_TOOLS=OFF \
> +	-DENABLE_TUTORIALS=OFF \
> +	-DENABLE_UNIT_TESTS=OFF \
> +	-DENABLE_VCARD=OFF \
> +	-DENABLE_VIDEO=OFF

Before your patch, linphone had support for Video4Linux (V4L), so we
used to have video support. It seems like quite a regression to no
longer have any video support.

>  ifeq ($(BR2_PACKAGE_LIBGTK2)$(BR2_PACKAGE_XORG7),yy)
> -LINPHONE_CONF_OPTS += --enable-gtk_ui
> +LINPHONE_CONF_OPTS += -DENABLE_GTK_UI=ON

Are you sure about this ENABLE_GTK_UI option? I don't see it being
defined anywhere:

$ grep -r ENABLE_GTK_UI
share/CMakeLists.txt:if(ENABLE_GTK_UI)
CMakeLists.txt:cmake_dependent_option(ENABLE_NOTIFY "Enable libnotify support." YES "ENABLE_GTK_UI;NOT APPLE" NO)
CMakeLists.txt:cmake_dependent_option(ENABLE_ASSISTANT "Turn on assistant compiling." YES "ENABLE_GTK_UI" NO)

None of these occurrences seem to be definitions of the ENABLE_GTK_UI
option.

Could you comment on these topics ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
