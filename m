From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Dec 2019 21:58:52 +0100
Subject: [Buildroot] [PATCH 2/3] package/xdg-dbus-proxy: new package
In-Reply-To: <20190920153106.2274596-3-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Fri, 20 Sep 2019 18:31:05 +0300")
References: <20190920153106.2274596-1-aperez@igalia.com>
 <20190920153106.2274596-3-aperez@igalia.com>
Message-ID: <87tv65gt0z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > xdg-dbus-proxy is a filtering proxy for D-Bus connections, which can
 > be used to limit access to a set of services. Typically it is used in
 > combination with containers to provide them with access to certain
 > services running outside the container.

 > https://github.com/flatpak/xdg-dbus-proxy

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
 > ---
 >  DEVELOPERS                                 |  1 +
 >  package/Config.in                          |  1 +
 >  package/xdg-dbus-proxy/Config.in           | 14 ++++++++++++++
 >  package/xdg-dbus-proxy/xdg-dbus-proxy.hash |  5 +++++
 >  package/xdg-dbus-proxy/xdg-dbus-proxy.mk   | 17 +++++++++++++++++
 >  5 files changed, 38 insertions(+)
 >  create mode 100644 package/xdg-dbus-proxy/Config.in
 >  create mode 100644 package/xdg-dbus-proxy/xdg-dbus-proxy.hash
 >  create mode 100644 package/xdg-dbus-proxy/xdg-dbus-proxy.mk

 > +++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
 > @@ -0,0 +1,17 @@
 > +################################################################################
 > +#
 > +# bubblewrap
 > +#
 > +################################################################################
 > +
 > +XDG_DBUS_PROXY_VERSION = 0.1.2
 > +XDG_DBUS_PROXY_SITE = https://github.com/flatpak/xdg-dbus-proxy/releases/download/$(XDG_DBUS_PROXY_VERSION)
 > +XDG_DBUS_PROXY_SOURCE = xdg-dbus-proxy-$(XDG_DBUS_PROXY_VERSION).tar.xz
 > +XDG_DBUS_PROXY_DEPENDENCIES = host-pkgconf libglib2
 > +
 > +XDG_DBUS_PROXY_LICENSE = LGPL-2.1

It looks to be LGP-2.1+:

grep -rs 'any later version' **/*.c
dbus-proxy.c: * version 2.1 of the License, or (at your option) any later version.
flatpak-proxy.c: * version 2.1 of the License, or (at your option) any later version.
tests/test-proxy.c: * version 2.1 of the License, or (at your option) any later version.

So I changed that and committed, thanks.

-- 
Bye, Peter Korsgaard
