From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 27 Oct 2009 15:33:21 +0000 (UTC)
Subject: [Buildroot] [Bug 683] New: SDL-dfb does not select directfb
Message-ID: <bug-683-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=683

           Summary: SDL-dfb does not select directfb
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Keywords: patch
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: damien.courousse.logica at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hello,

I got a compilation error with SDL-dfb selected while directfb was not
selected. The compilation reported something like:

(...)


o
./src/video/directfb/SDL_DirectFB_events.c:32:22: error: directfb.h: No such
file or directory
In file included from ./src/video/directfb/SDL_DirectFB_events.c:38:
./src/video/directfb/SDL_DirectFB_video.h:40: error: expected
specifier-qualifier-list before 'IDirectFB'
./src/video/directfb/SDL_DirectFB_video.h:60: error: expected declaration
specifiers or '...' before 'DFBResult'
./src/video/directfb/SDL_DirectFB_events.c:43: error: expected ')' before '*'
token
./src/video/directfb/SDL_DirectFB_events.c:44: error: expected ')' before '*'
token
./src/video/directfb/SDL_DirectFB_events.c: In function 'DirectFB_PumpEvents':
./src/video/directfb/SDL_DirectFB_events.c:51: error: 'DFBInputEvent'
undeclared (first use in this function)
./src/video/directfb/SDL_DirectFB_events.c:51: error: (Each undeclared
identifier is reported only once
./src/video/directfb/SDL_DirectFB_events.c:51: error: for each function it
appears in.)
./src/video/directfb/SDL_DirectFB_events.c:51: error: expected ';' before 'evt'
./src/video/directfb/SDL_DirectFB_events.c:53: error: 'struct
SDL_PrivateVideoData' has no member named 'eventbuffer'
./src/video/directfb/SDL_DirectFB_events.c:53: error: 'struct
SDL_PrivateVideoData' has no member named 'eventbuffer'
./src/video/directfb/SDL_DirectFB_events.c:54: error: 'evt' undeclared (first
use in this function)
./src/video/directfb/SDL_DirectFB_events.c:54: error: 'DFB_OK' undeclared
(first use in this function)
./src/video/directfb/SDL_DirectFB_events.c:60: error: 'DIET_BUTTONPRESS'
undeclared (first use in this function)
./src/video/directfb/SDL_DirectFB_events.c:64: error: 'DIET_BUTTONRELEASE'
undeclared (first use in this function)
./src/video/directfb/SDL_DirectFB_events.c:68: error: 'DIET_KEYPRESS'
undeclared (first use in this function)
(...)

Hence I think BR2_PACKAGE_SDL_DIRECTFB should select BR2_PACKAGE_DIRECTFB : 
diff --git a/package/sdl/Config.in b/package/sdl/Config.in
index 7cba524..ae8b597 100644
--- a/package/sdl/Config.in
+++ b/package/sdl/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_SDL_FBCON

 config BR2_PACKAGE_SDL_DIRECTFB
        bool "SDL DirectFB video driver"
+       select BR2_PACKAGE_DIRECTFB

 config BR2_PACKAGE_SDL_QTOPIA
        bool "SDL Qtopia video driver"


Cheers,
Damien


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
