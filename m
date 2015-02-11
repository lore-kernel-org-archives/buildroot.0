From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 11 Feb 2015 17:56:55 +0100
Subject: [Buildroot] Need clarification about glib and dbus
In-Reply-To: <WC20150211154820.183108@til-technologies.fr>
References: <WC20150211154820.183108@til-technologies.fr>
Message-ID: <CAHXCMMJdivKo-5LGJwDjB_zQg5yrtCFsTg_xBhCJ=wgHoK_cNw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Feb 11, 2015 at 4:48 PM, C?dric HEYMAN
<c.heyman@til-technologies.fr> wrote:
>
> Hi,
>
> I intend to use dbus and its C binding Glib on custom distribution built with buildroot 2014.11 for sama5d3 target.
>
> When I take a look at http://www.freedesktop.org/wiki/Software/DBusBindings/, I see that DBus-GLib (obsolete) must not be used. It is recommended to use GDBus instead which is the support of DBus in GLib since version 2.26 of GLib.
>
> If I compare with package available in buildroot-2014.11, I read " DBUS_GLIB_VERSION = 0.102" in dbus-glib/dbus-glib.mk.
>
> I feel confused :
>  - Does buildroot compiles dbus-glib (which is indicated deprecated on freedesktop.org) ? what does 0.102 version correspond ?

0.102 is the dbus-glib version, which is obvioulsy not synchronized
with the version of glib (the libglib2 package in buildroot).
Buildroot certainly builds dbus-glib (otherwise there should be some
entry in the autobuilders [1]), even if it is mark as deprecated by
freedesktop developers.

>  - Does buildroot compiles glib upper than 2.26 which supports gdbus ?

gdbus is provided by glib (so, the libglib2 package), for the glib
version packaged in the 2014.11 package, check [2].


[1] http://autobuild.buildroot.net/?reason=dbus-glib-0.102
[2] http://git.buildroot.org/buildroot/tree/package/libglib2/libglib2.mk?id=2014.11#n7

Regards,

-- 
Samuel
