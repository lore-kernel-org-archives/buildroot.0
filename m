From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Dec 2015 00:11:44 +0100
Subject: [Buildroot] [PATCH v10 00/28] efl bump to 1.15.2
In-Reply-To: <1450219240-16938-1-git-send-email-romain.naour@openwide.fr>
References: <1450219240-16938-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151218001144.5a685de2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Tue, 15 Dec 2015 23:40:12 +0100, Romain Naour wrote:

> Romain Naour (28):
>   package/efl/libefl: new package
>   package/efl/libefl: add harfbuzz dependency
>   package/efl/libefl: add wayland dependency
>   package/efl/libefl: add webp dependency
>   package/efl/libefl: add frame buffer config option
>   package/efl/libefl: add jp2k config option
>   package/efl/libefl: add X11 support

All those ones applied. On the "libefl: new package" patch I've applied
my two patches that I showed you on the mailing list.

>   package/efl/libefl: add OpenGLES support

This one I wasn't sure about the "choice"; we had some discussion about
it with Yann on IRC.

>   package/efl/libefl: enable xinput2.2

This one I thought should have been part of the X11 support patch, but
now that I have applied the X11 support patch, I think I'll apply this
one separately.

>   package/libevas-generic-loaders: bump to version 1.15.0
>   package/libevas-generic-loaders: add libraw dependency
>   package/efl/libelementary: bump to version 1.15.2
>   package/efl: libefl and libelementary share the same version number
>   package/enlightenment: bump to version 0.19.12
>   package/expedite: bump to efl-1.15 branch
>   package/dbus-cpp: switch to libefl
>   package/efl/libethumb: remove package
>   package/efl/libedje: remove package
>   package/efl/libembryo: remove package
>   package/efl/libeio: remove package
>   package/efl/libefreet: remove package
>   package/efl/libedbus: remove package
>   package/efl/libecore: remove package
>   package/efl/libevas: remove package
>   package/efl/libeet: remove package
>   package/efl/libeina: remove package

All applied.

>   package/libemotion-generic-players: new package

I want to do some more review on this one.

>   package/efl: rename libefl to efl

I don't understand the logic of this one, and why we're moving from a
'menuconfig' to a 'menu'.

So there are four patches left to be applied out of 28.

Thanks a lot for working on this, definitely great to have an
up-to-date EFL stack.

To be honest, with the version number now being shared with just libefl
and libelementary, I am not sure it is really worth the effort to have
a package/efl/ directory with those two packages. What about making
them normal top-level packages ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
