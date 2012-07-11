From: Julian Lunz <git@jlunz.de>
Date: Wed, 11 Jul 2012 21:40:37 +0200
Subject: [Buildroot] qt question
In-Reply-To: <CALo-6+iopeMOhiWNnYFa8SVA-EsUj2A7BN3=pFZX+D2StVrKfg@mail.gmail.com>
References: <CALo-6+iopeMOhiWNnYFa8SVA-EsUj2A7BN3=pFZX+D2StVrKfg@mail.gmail.com>
Message-ID: <20120711214037.5a2d24fe@jl-desk-LL>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

looks like your compiler is not defined, so a line like this:
$CXX -c main.cpp
with $CXX not defined would result in:
c: Command not found

Did other components build properly?

On Wed, 11 Jul 2012 09:07:26 -0700
Charles Krinke <charles.krinke@gmail.com> wrote:

> I think I have worked out libtool issues by using the compiler that
> buildroot generates, now to the next issue, which is Qt.
> 
> When I select Qt with an ARM AM3517 and do a make, I get bolloxed up
> in a bunch  of command not found and qmake issues.
> 
> Can someone please suggest where I might be going awry?
> 
> Charles
> 
> 
> Which edition of Qt do you want to use ?
> 
> Type 'c' if you want to use the Commercial Edition.
> Type 'o' if you want to use the Open Source Edition.
> 
> o
> 
> 
> You have asked to use pkg-config and are cross-compiling.
> Please make sure you have a correctly set-up pkg-config
> environment!
> 
> 
> This is the Qt for Embedded Linux Open Source Edition.
> 
> You are licensed to use this software under the terms of
> the Lesser GNU General Public License (LGPL) versions 2.1.
> You are also licensed to use this software under the terms of
> the GNU General Public License (GPL) versions 3.
> 
> Type '3' to view the GNU General Public License version 3.
> Type 'L' to view the Lesser GNU General Public License version 2.1.
> Type 'yes' to accept this license offer.
> Type 'no' to decline this license offer.
> 
> Do you accept the terms of either license? yes
> 
> Creating qmake. Please wait...
> make[1]: Entering directory
> `/home/ckrinke/buildroot-2012.05/output/build/qt-4.8.1/qmake'
> make[1]: c: Command not found
> make[1]: [project.o] Error 127 (ignored)
> make[1]: c: Command not found
> make[1]: [property.o] Error 127 (ignored)
> make[1]: c: Command not found
> ...
> make[1]: [qnumeric.o] Error 127 (ignored)
> make[1]: c: Command not found
> make[1]: [qcryptographichash.o] Error 127 (ignored)
> make[1]: c: Command not found
> make[1]: [qxmlstream.o] Error 127 (ignored)
> make[1]: [qxmlutils.o] Error 127 (ignored)
> /bin/sh: o: command not found
> make[1]:
> [/home/ckrinke/buildroot-2012.05/output/build/qt-4.8.1/bin/qmake]
> Error 127 (ignored) make[1]: Leaving directory
> `/home/ckrinke/buildroot-2012.05/output/build/qt-4.8.1/qmake'
> /home/ckrinke/buildroot-2012.05/output/build/qt-4.8.1/config.tests/unix/compile.test:
> line
> 71: /home/ckrinke/buildroot-2012.05/output/build/qt-4.8.1/bin/qmake:
> No such file or
> directory /home/ckrinke/buildroot-2012.05/output/build/qt-4.8.1/config.tests/unix/compile.test:
> line
> 71: /home/ckrinke/buildroot-2012.05/output/build/qt-4.8.1/bin/qmake:
> No such file or
> directory /home/ckrinke/buildroot-2012.05/output/build/qt-4.8.1/config.tests/unix/compile.test:
> line
> 71: /home/ckrinke/buildroot-2012.05/output/build/qt-4.8.1/bin/qmake:
> No such file or directory
> 
> 
