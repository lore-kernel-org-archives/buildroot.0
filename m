From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 30 Apr 2013 09:34:46 +0200
Subject: [Buildroot] [PATCH v2 2/4] libxkbcommon: new package
In-Reply-To: <1367267165-6873-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 29 Apr 2013 22:26:03 +0200")
References: <1367267165-6873-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1367267165-6873-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87sj283209.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> +++ b/package/libxkbcommon/libxkbcommon.mk
 Thomas> @@ -0,0 +1,16 @@
 Thomas> +#############################################################
 Thomas> +#
 Thomas> +# libxkbcommon
 Thomas> +#
 Thomas> +#############################################################
 Thomas> +
 Thomas> +LIBXKBCOMMON_VERSION = 0.3.0
 Thomas> +LIBXKBCOMMON_SITE = http://xkbcommon.org/download/
 Thomas> +LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
 Thomas> +LIBXKBCOMMON_LICENSE = MIT/X11
 Thomas> +LIBXKBCOMMON_LICENSE_FILES = COPYING
 Thomas> +
 Thomas> +LIBXKBCOMMON_INSTALL_STAGING = YES
 Thomas> +LIBXKBCOMMON_DEPENDENCIES = host-bison host-flex

It uses C99 syntax, so we need to add -std=gnu99 to CFLAGS. Upstream
adds it XORG_DEFAULT_OPTIONS (which pulls in AC_PROG_C_99), but it gets
overwritten by our CFLAGS.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
