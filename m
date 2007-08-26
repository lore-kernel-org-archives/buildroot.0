From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 27 Aug 2007 00:37:57 +0100
Subject: [Buildroot] [PATCH] Fix qtopia4 compile
Message-ID: <d6cda7730708261637u5d62af28ofa3050c8526ca827@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

    This patch fixes qtopia4 compile issues. It failed to build host
tools due to wrong include paths from CFLAGS/CXXFLAGS. It now builds
correctly.
    Also, on AVR32, for some reason make install doesn't copy over
qatomic_avr32.h which makes projects using qtopia to fail. Added a
rule at the makefile level. There might be a solution for this by
patching qtopia, althought as of yet unknown.
    Btw, this bumps up Qtopia version to 4.3.1 (currently latest) The
4.2.2 according to changelogs contains data corruption bug in
QDatastreams and some memory leaks.

Cheers,
    Thiago A. Correa
