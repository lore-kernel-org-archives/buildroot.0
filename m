From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 30 May 2017 13:51:10 +0000
Subject: [Buildroot] [Bug 9911] New: qt5 does not build on sparc
Message-ID: <bug-9911-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9911

            Bug ID: 9911
           Summary: qt5 does not build on sparc
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: uwe at hermann-uwe.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

Qt5 apparently doesn't build due to "ERROR: detected a std::atomic
implementation that fails for function pointers" on sparc. Is this a
known/reproducible issue?


Log:

Configure summary:

Building on:  x86_64
Building for: sparc
Configuration: cross_compile compile_examples enable_new_dtags largefile
accessibility shared release c++11 c++14 c++1z concurrent mremap reduce_exports
release_tools stl
Build options:
  Mode ................................... release; optimized tools
  Building shared libraries .............. yes
  Using C++ standard ..................... C++1z
  Using gold linker ...................... no
  Using new DTAGS ........................ yes
  Using precompiled headers .............. no
  Using LTCG ............................. no
  Target compiler supports:
  Build parts ............................ libs
Qt modules and options:
  Qt Concurrent .......................... yes
  Qt D-Bus ............................... no
  Qt D-Bus directly linked to libdbus .... no
  Qt Gui ................................. yes
  Qt Widgets ............................. yes
Support enabled for:
  Accessibility .......................... yes
  Using pkg-config ....................... yes
  QML debugging .......................... yes
  udev ................................... no
  Using system zlib ...................... yes
Qt Core:
  DoubleConversion ....................... yes
    Using system DoubleConversion ........ no
  GLib ................................... yes
  iconv .................................. no
  ICU .................................... no
  Logging backends:
    journald ............................. no
    syslog ............................... no
  Using system PCRE ...................... yes
Qt Network:
  getaddrinfo() .......................... yes
  getifaddrs() ........................... yes
  IPv6 ifname ............................ yes
  libproxy ............................... no
  OpenSSL ................................ no
    Qt directly linked to OpenSSL ........ no
  SCTP ................................... no
  Use system proxies ..................... yes
Qt Sql:
  DB2 (IBM) .............................. no
  InterBase .............................. no
  MySql .................................. no
  OCI (Oracle) ........................... no
  ODBC ................................... no
  PostgreSQL ............................. no
  SQLite2 ................................ no
  SQLite ................................. no
    Using system provided SQLite ......... no
  TDS (Sybase) ........................... no
Qt Gui:
  FreeType ............................... yes
    Using system FreeType ................ yes
  HarfBuzz ............................... yes
    Using system HarfBuzz ................ no
  Fontconfig ............................. no
  Image formats:
    GIF .................................. no
    ICO .................................. yes
    JPEG ................................. yes
      Using system libjpeg ............... yes
    PNG .................................. yes
      Using system libpng ................ yes
  OpenGL:
    EGL .................................. no
    Desktop OpenGL ....................... no
    OpenGL ES 2.0 ........................ no
    OpenGL ES 3.0 ........................ no
    OpenGL ES 3.1 ........................ no
  Session Management ..................... yes
Features used by QPA backends:
  evdev .................................. yes
  libinput ............................... no
  mtdev .................................. no
  tslib .................................. no
  xkbcommon-evdev ........................ no
QPA backends:
  DirectFB ............................... no
  EGLFS .................................. no
  LinuxFB ................................ yes
  Mir client ............................. no
Qt Widgets:
  GTK+ ................................... no
  Styles ................................. Fusion Windows
Qt PrintSupport:
  CUPS ................................... no

Note: -optimized-tools is not useful in -release mode.

Note: Dropped compiler flags '-pthread' when detecting library 'glib'.

ERROR: detected a std::atomic implementation that fails for function pointers.
Please apply the patch corresponding to your Standard Library vendor, found in
  qtbase/config.tests/common/atomicfptr

package/pkg-generic.mk:206: recipe for target
'[...]/output/build/qt5base-5.8.0/.stamp_configured' failed

-- 
You are receiving this mail because:
You are on the CC list for the bug.
