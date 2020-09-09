From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Wed, 9 Sep 2020 18:08:08 +0200
Subject: [Buildroot] Running Weston on stm32mp157c-dk2
Message-ID: <CAOiXNkAuzbY-8VLckB71VgamhH9i80CK3TX0TGLLj0z_0iTygQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Folks,

I am just wondering if anybody tried and managed to run Weston on
stm32mp157c-dk2 using Buildroot? If yes, I would appreciate any
details on what should be done for it.

My attempts lead me to the point where the following output comes from
weston-launch:

# openvt -c 3 -v weston-launch -- --log=weston.log

# cat weston.log
Date: 2000-01-01 UTC
[05:08:08.782] weston 8.0.0
               https://wayland.freedesktop.org
               Bug reports to:
https://gitlab.freedesktop.org/wayland/weston/issues/
               Build: 8.0.0
[05:08:08.783] Command line: /usr/bin/weston --log=weston.log
[05:08:08.783] OS: Linux, 5.4.26, #1 SMP PREEMPT Thu Aug 27 17:02:16
CEST 2020, armv7l
[05:08:08.784] Using config file '/root/.config/weston.ini'
[05:08:08.784] Output repaint window is 100 ms maximum.
[05:08:08.785] Loading module '/usr/lib/libweston-8/drm-backend.so'
[05:08:08.789] initializing drm backend
[05:08:08.793] using /dev/dri/card0
[05:08:08.793] DRM: supports universal planes
[05:08:08.793] DRM: supports atomic modesetting
[05:08:08.793] DRM: supports picture aspect ratio
[05:08:08.793] Loading module '/usr/lib/libweston-8/gl-renderer.so'
[05:08:08.806] failed to initialize egl
[05:08:08.806] fatal: failed to create compositor backend

Since there is /dev/dri/card0 I assume that the kernel recognized the
hardware. Also, there is /usr/lib/libweston-8/gl-renderer.so , so
probably Weston & Co. is also compiled correctly. But something is
obviously missing and I have no idea what it might be.

Best regards,
Andrey.
