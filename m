From: Rishi <rishid+mailman@gmail.com>
Date: Mon, 10 Sep 2012 14:21:47 -0400
Subject: [Buildroot] Relocate uClibc toolchain question
Message-ID: <CAJbs9BEw+45qVbj_zcy_iFj3dGbHdN772upUXFg=pDiaR7WEsw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have built a uClibc toolchain using Buildroot 2012.05.
- uClibc 0.9.33
- gcc 4.6.x
- C++ support

The toolchain works perfectly but I want to move it from my home
directory to a directory that can be shared with the team, like
/opt/arm_uClibc/..

I performed a "cp -rf output/host/ /opt/arm_uClibc" and then attempted
to use this compiler by passing the --sysroot option as suggested in
Documentation.
(http://buildroot.uclibc.org/downloads/manual/manual.html#_using_the_generated_toolchain_outside_buildroot)

This seemed to be working but as soon as I performed a distclean in my
buildroot area the toolchain broke; it could not find libmpc.so.2 as
well as C standard include headers.

Executing command:
arm-linux-g++ -c -Wall --sysroot=/opt/arm_uClibc main.cpp

2 questions:
1. Any ideas on how to fix this?  Codesourcery toolchain does not have
libmpc.so.2, so I was a bit puzzled.
2. Why doesn't CodeSourcery's toolchain require this sysroot thing?  I
can move their compiler anywhere and it works perfectly fine.
