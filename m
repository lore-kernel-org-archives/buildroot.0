From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 16 May 2020 16:12:53 +0000
Subject: [Buildroot] [Bug 12906] qt PrefixPath is wrong on 2020.05-rc1
In-Reply-To: <bug-12906-163@https.bugs.busybox.net/>
References: <bug-12906-163@https.bugs.busybox.net/>
Message-ID: <bug-12906-163-3uE2RAWeO1@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12906

--- Comment #2 from jharjuma at gmail.com ---
Yes, I did complete rebuild. Qt 5.14 introduced relocatable builds
(https://www.qt.io/blog/qt-is-relocatable). I was able to restore correct paths
by configuring BR2_PACKAGE_QT5BASE_CUSTOM_CONF_OPTS="-no-feature-relocatable".

Head of qt5base-5.14.2/config.summary

Building on: linux-g++ (x86_64, CPU features: mmx sse sse2)
Building for: devices/linux-buildroot-g++ (arm, CPU features: <none>)
Target compiler: gcc 7.5.0
Configuration: cross_compile compile_examples enable_new_dtags largefile shared
shared release c++11 c++14 c++1z concurrent dbus reduce_exports release_tools
stl
Build options:
  Mode ................................... release; optimized tools
  Optimize release build for size ........ no
  Building shared libraries .............. yes
  Using C standard ....................... C11
  Using C++ standard ..................... C++17
  Using ccache ........................... no
  Using new DTAGS ........................ yes
  Relocatable ............................ no
  Using precompiled headers .............. no
  Using LTCG ............................. no
  Target compiler supports:
    NEON ................................. no
  Build parts ............................ libs

Peter Seiderer: Did you build relocatable qt?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
