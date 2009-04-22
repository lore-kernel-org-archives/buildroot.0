From: Sven Neumann <s.neumann@phase-zero.de>
Date: Wed, 22 Apr 2009 16:27:44 +0200
Subject: [Buildroot] [PATCH] Add host-libglib2 dependencie to dbus-glib
In-Reply-To: <49EF2669.7010607@eclis.ch>
References: <49CB469A.5080404@eclis.ch>
	<20090422124829.GA28316@cbg.dyndns.org> <1240404749.7072.1.camel@sven>
	<49EF2669.7010607@eclis.ch>
Message-ID: <1240410464.7072.20.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, 2009-04-22 at 16:15 +0200, Jean-Christian de Rivaz wrote:

> Interesting. On ARM I can only build dbus with expat.
> 
> BR2_PACKAGE_DBUS=y
> BR2_DBUS_EXPAT=y
> # BR2_DBUS_LIBXML2 is not set
> BR2_PACKAGE_DBUS_GLIB=y

This works for us:

BR2_iwmmxt=y
BR2_ARM_TYPE="ARM_IWMMXT"
# BR2_ARM_OABI is not set
BR2_ARM_EABI=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="iwmmxt"
BR2_GCC_TARGET_ARCH="iwmmxt"
BR2_GCC_TARGET_ABI="aapcs-linux"

BR2_PACKAGE_DBUS=y
# BR2_DBUS_EXPAT is not set
BR2_DBUS_LIBXML2=y
BR2_PACKAGE_DBUS_GLIB=y


Sven
