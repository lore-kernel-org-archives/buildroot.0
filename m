From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 16 Jun 2021 20:26:38 +0200
Subject: [Buildroot] [webkitgtk / cairo] Accelerated rendering on
 raspberry pi 4
In-Reply-To: <CANVomh-dtsmg-oDwP8=uMmPWqcKA9hm7ReZ=wMiZoEn=-pOmWw@mail.gmail.com>
References: <CANVomh-dtsmg-oDwP8=uMmPWqcKA9hm7ReZ=wMiZoEn=-pOmWw@mail.gmail.com>
Message-ID: <20210616202638.74242b4a@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Jun 2021 10:54:19 +0000, C Larbi <pkl2000us@gmail.com> wrote:

> Hello
> I am working on a personal project to build a digital kiosk on a pi 4
> I am using webkitgtk on a wayland compositor.
> 
> So far I have got the system up and running.
> 
> But css and javascript effects produce poor performance (high latency and
> probably low FPS)
> 
> I get garbled output on the display when I try to enforce hardware
> acceleration through WebKitSettings or using environment variables.
> 
> This has left me suspecting an issue with cairo, open egl and es
> 
> I did some research and found out cairo has an --enable-egl configuration
> parameter (which is not in the cairo.mk file).

From package/cairo/cairo.mk:

 91 # Can use GL or GLESv2 but not both
 92 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
 93 CAIRO_CONF_OPTS += --enable-gl --disable-glesv2
 94 CAIRO_DEPENDENCIES += libgl
 95 else
 96 ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
 97 CAIRO_CONF_OPTS += --disable-gl --enable-glesv2
 98 CAIRO_DEPENDENCIES += libgles
 99 else
100 CAIRO_CONF_OPTS += --disable-gl --disable-glesv2
101 endif
102 endif

> 
> I applied this but still garbled output.
> 
> I have tried different combinations of vc4-fkms-v3d, vc4-kms-v3-pi4, but
> still get the garbled output.

Hard to say without more information (config file, etc.), please provide a (minimal)
config/defconfig and example (commands) how to reproduce your problem...

Which buildroot version?

> 
> Will appreciate it if anyone can give me some pointers to a possible
> solution.
> 
> NB: I was advised to switch to wpewebkit, but i had the same results when i
> used cog to load my web page


For hints on RPi4, cog and wpebkit see for example [1]...

Regards,
Peter


[1] http://lists.busybox.net/pipermail/buildroot/2020-May/283331.html
