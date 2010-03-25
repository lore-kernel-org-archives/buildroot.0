From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Mar 2010 23:49:20 +0100
Subject: [Buildroot] [Patch]matchbox: convert to autotools
In-Reply-To: <4BA7C9D6.8060208@carallon.com>
References: <4BA7C9D6.8060208@carallon.com>
Message-ID: <20100325234920.5dae5e04@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello William,

Thanks a lot for doing this work! Next time, to ease the review process,
could you send your patch inline ? git send-email will do it for you.

A few minor comments below :

On Mon, 22 Mar 2010 19:49:42 +0000
William Wagner <will_wagner@carallon.com> wrote:

> +++ b/package/matchbox/matchbox-common/matchbox-common.mk
> @@ -0,0 +1,16 @@
> +#############################################################
> +#
> +# MatchBox Common
> +#
> +#############################################################
> +
> +MATCHBOX_COMMON_VERSION = 0.9.1
> +MATCHBOX_COMMON_SOURCE = matchbox-common-$(MATCHBOX_COMMON_VERSION).tar.bz2
> +MATCHBOX_COMMON_SITE = http://matchbox-project.org/sources/matchbox-common/$(MATCHBOX_COMMON_VERSION)
> +MATCHBOX_COMMON_AUTORECONF = NO

Unneeded, this is the default value.

> +MATCHBOX_COMMON_DEPENDENCIES = matchbox-lib
> +MATCHBOX_COMMON_CONF_OPT =

Unneeded empty definition.

> +#############################################################
> +#
> +# MatchBox Desktop
> +#
> +#############################################################
> +
> +MATCHBOX_DESKTOP_VERSION = 0.9.1
> +MATCHBOX_DESKTOP_SOURCE = matchbox-desktop-$(MATCHBOX_DESKTOP_VERSION).tar.bz2
> +MATCHBOX_DESKTOP_SITE = http://matchbox-project.org/sources/matchbox-desktop/$(MATCHBOX_DESKTOP_VERSION)
> +MATCHBOX_DESKTOP_AUTORECONF = NO

Unneeded, this is the default value.

> +++ b/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
> @@ -0,0 +1,25 @@
> +#############################################################
> +#
> +# MatchBox Fakekey
> +#
> +#############################################################
> +
> +MATCHBOX_FAKEKEY_VERSION = 0.1
> +MATCHBOX_FAKEKEY_SOURCE = libfakekey-$(MATCHBOX_FAKEKEY_VERSION).tar.bz2
> +MATCHBOX_FAKEKEY_SITE = http://matchbox-project.org/sources/libfakekey/$(MATCHBOX_FAKEKEY_VERSION)
> +MATCHBOX_FAKEKEY_AUTORECONF = NO

This is the default value.

> --- /dev/null
> +++ b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
> @@ -0,0 +1,30 @@
> +#############################################################
> +#
> +# MatchBox Keyboard
> +#
> +#############################################################
> +
> +MATCHBOX_KEYBOARD_VERSION = 0.1
> +MATCHBOX_KEYBOARD_SOURCE = matchbox-keyboard-$(MATCHBOX_KEYBOARD_VERSION).tar.bz2
> +MATCHBOX_KEYBOARD_SITE = http://matchbox-project.org/sources/matchbox-keyboard/$(MATCHBOX_KEYBOARD_VERSION)
> +MATCHBOX_KEYBOARD_AUTORECONF = NO

Same thing.

> +++ b/package/matchbox/matchbox-lib/matchbox-lib.mk
> @@ -0,0 +1,59 @@
> +#############################################################
> +#
> +# MatchBox LIB
> +#
> +#############################################################

Is it expected that this package isn't associated with any
configuration option ?

> +MATCHBOX_LIB_VERSION = 1.9
> +MATCHBOX_LIB_SOURCE = libmatchbox-$(MATCHBOX_LIB_VERSION).tar.bz2
> +MATCHBOX_LIB_SITE = http://matchbox-project.org/sources/libmatchbox/$(MATCHBOX_LIB_VERSION)
> +MATCHBOX_LIB_AUTORECONF = NO

Default value.

> +++ b/package/matchbox/matchbox-panel/matchbox-panel.mk
> @@ -0,0 +1,25 @@
> +#############################################################
> +#
> +# MatchBox Panel
> +#
> +#############################################################
> +
> +MATCHBOX_PANEL_VERSION = 0.9.3
> +MATCHBOX_PANEL_SOURCE = matchbox-panel-$(MATCHBOX_PANEL_VERSION).tar.bz2
> +MATCHBOX_PANEL_SITE = http://matchbox-project.org/sources/matchbox-panel/$(MATCHBOX_PANEL_VERSION)
> +MATCHBOX_PANEL_AUTORECONF = NO

Same thing :-)

> +MATCHBOX_STARTUP_MONITOR_VERSION = 0.1
> +MATCHBOX_STARTUP_MONITOR_SOURCE = mb-applet-startup-monitor-$(MATCHBOX_STARTUP_MONITOR_VERSION).tar.bz2
> +MATCHBOX_STARTUP_MONITOR_SITE = http://matchbox-project.org/sources/mb-applet-startup-monitor/$(MATCHBOX_STARTUP_MONITOR_VERSION)
> +MATCHBOX_STARTUP_MONITOR_AUTORECONF = NO

Ditto.

> +MATCHBOX_STARTUP_MONITOR_LIBTOOL_PATCH = NO
> +MATCHBOX_STARTUP_MONITOR_DEPENDENCIES = matchbox-lib startup-notification
> +MATCHBOX_STARTUP_MONITOR_CONF_OPT =

Ditto.

> +MATCHBOX_WM_AUTORECONF = NO

Ditto.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
