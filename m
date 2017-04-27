From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Apr 2017 10:17:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/libqmi: bump version to 1.18.0
In-Reply-To: <1493254942-38586-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Wed, 26 Apr 2017 20:02:22 -0500")
References: <1493254942-38586-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <871ssemfh8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 > ---
 >  package/libqmi/libqmi.hash | 2 +-
 >  package/libqmi/libqmi.mk   | 6 +++---
 >  2 files changed, 4 insertions(+), 4 deletions(-)

 > diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
 > index 08da1ae..3f40154 100644
 > --- a/package/libqmi/libqmi.hash
 > +++ b/package/libqmi/libqmi.hash
 > @@ -1,2 +1,2 @@
 >  # Locally computed:
 > -sha256  7ab6bb47fd23bf4d3fa17424e40ea5552d08b19e5ee4f125f21f316c8086ba2a  libqmi-1.16.0.tar.xz
 > +sha256 a0a42c55935e75a630208e2f70840bd4407f56fe1c5258f5b0f6c0aaedf88cec  libqmi-1.18.0.tar.xz
 > diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
 > index caa4398..92b635d 100644
 > --- a/package/libqmi/libqmi.mk
 > +++ b/package/libqmi/libqmi.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -LIBQMI_VERSION = 1.16.0
 > +LIBQMI_VERSION = 1.18.0
 >  LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
 >  LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 >  LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 > @@ -13,7 +13,7 @@ LIBQMI_INSTALL_STAGING = YES
 
 >  LIBQMI_DEPENDENCIES = libglib2
 
 > -# we don't want -Werror
 > -LIBQMI_CONF_OPTS = --enable-more-warnings=no
 > +# we don't want -Werror and disable gudev Gobject bindings

Why? It would be good to describe why we don't want udev support.

> +LIBQMI_CONF_OPTS = --enable-more-warnings=no --without-udev
 
 >  $(eval $(autotools-package))
 > -- 
 > 1.9.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
