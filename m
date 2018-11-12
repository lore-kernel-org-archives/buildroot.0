From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Nov 2018 08:05:59 +0000
Subject: [Buildroot] [Bug 11501] New: compile sdl2 with enable wayland
Message-ID: <bug-11501-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11501

            Bug ID: 11501
           Summary: compile sdl2 with enable wayland
           Product: buildroot
           Version: 2018.02.3
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: 1989wanghang at 163.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

compile sdl2 with enable wayland will get error, show below:

/bin/bash: /usr/bin/wayland-scanner: No such file or directory
/bin/bash: /usr/bin/wayland-scanner: No such file or directory
  GEN    gen/pointer-constraints-unstable-v1-protocol.c
/bin/bash: /usr/bin/wayland-scanner: No such file or directory
  CC     build/SDL_waylandevents.lo
/bin/bash: /usr/bin/wayland-scanner: No such file or directory
  GEN    gen/relative-pointer-unstable-v1-protocol.c
/bin/bash: /usr/bin/wayland-scanner: No such file or directory
Makefile:674: recipe for target 'gen/wayland-client-protocol.h' failed
make[2]: *** [gen/wayland-client-protocol.h] Error 127
make[2]: *** Waiting for unfinished jobs....
Makefile:681: recipe for target
'gen/relative-pointer-unstable-v1-client-protocol.h' failed
make[2]: *** [gen/relative-pointer-unstable-v1-client-protocol.h] Error 127
Makefile:670: recipe for target 'gen/wayland-protocol.c' failed
make[2]: *** [gen/wayland-protocol.c] Error 127
Makefile:693: recipe for target
'gen/pointer-constraints-unstable-v1-protocol.c' failed
make[2]: *** [gen/pointer-constraints-unstable-v1-protocol.c] Error 127
Makefile:685: recipe for target
'gen/pointer-constraints-unstable-v1-client-protocol.h' failed
make[2]: *** [gen/pointer-constraints-unstable-v1-client-protocol.h] Error 127
/bin/bash: /usr/bin/wayland-scanner: No such file or directory
Makefile:689: recipe for target 'gen/relative-pointer-unstable-v1-protocol.c'
failed
make[2]: *** [gen/relative-pointer-unstable-v1-protocol.c] Error 127
/home/wh/3399/buildroot/output/rockchip_rk3399/build/sdl2-2.0.7/src/video/wayland/SDL_waylandevents.c:41:61:
fatal error: pointer-constraints-unstable-v1-client-protocol.h: No such file or
directory
 #include "pointer-constraints-unstable-v1-client-protocol.h"
                                                             ^
compilation terminated.
Makefile:563: recipe for target 'build/SDL_waylandevents.lo' failed
make[2]: *** [build/SDL_waylandevents.lo] Error 1
package/pkg-generic.mk:247: recipe for target
'/home/wh/3399/buildroot/output/rockchip_rk3399/build/sdl2-2.0.7/.stamp_built'
failed
make[1]: ***
[/home/wh/3399/buildroot/output/rockchip_rk3399/build/sdl2-2.0.7/.stamp_built]
Error 2
Makefile:16: recipe for target '_all' failed
make: *** [_all] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
