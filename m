From: Charles Krinke <charles.krinke@gmail.com>
Date: Wed, 11 Jul 2012 13:33:16 -0700
Subject: [Buildroot] qt question
In-Reply-To: <20120711214037.5a2d24fe@jl-desk-LL>
References: <CALo-6+iopeMOhiWNnYFa8SVA-EsUj2A7BN3=pFZX+D2StVrKfg@mail.gmail.com>
 <20120711214037.5a2d24fe@jl-desk-LL>
Message-ID: <CALo-6+iNSrRe3um7v5ym6SBwtQtDDrkS2pAbDastOuBdWBbz2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Julian:

Well, I had build a complete root file system for this new arm (TI
AM3517) and booted from it. Then, I got tricky and clicked the button
for "Qt" and things went downhill from there. So, I guess I am
searching for where in the buildroot scripts things went awry. I
believe that since the rest of a modest root file system built, that
CXX was defined, but maybe not.

Charles

On Wed, Jul 11, 2012 at 12:40 PM, Julian Lunz <git@jlunz.de> wrote:
> Hi,
>
> looks like your compiler is not defined, so a line like this:
> $CXX -c main.cpp
> with $CXX not defined would result in:
> c: Command not found
>
> Did other components build properly?
>
> On Wed, 11 Jul 2012 09:07:26 -0700
> Charles Krinke <charles.krinke@gmail.com> wrote:
>
>> I think I have worked out libtool issues by using the compiler that
>> buildroot generates, now to the next issue, which is Qt.
>>
>> When I select Qt with an ARM AM3517 and do a make, I get bolloxed up
>> in a bunch  of command not found and qmake issues.
>>
>> Can someone please suggest where I might be going awry?
>>
>> Charles
>>
>>
>> Which edition of Qt do you want to use ?
>>
>> Type 'c' if you want to use the Commercial Edition.
>> Type 'o' if you want to use the Open Source Edition.
>>
>> o
>>
>>
>> You have asked to use pkg-config and are cross-compiling.
>> Please make sure you have a correctly set-up pkg-config
>> environment!
>>
>>
>> This is the Qt for Embedded Linux Open Source Edition.
>>
>> You are licensed to use this software under the terms of
>> the Lesser GNU General Public License (LGPL) versions 2.1.
>> You are also licensed to use this software under the terms of
>> the GNU General Public License (GPL) versions 3.
>>
>> Type '3' to view the GNU General Public License version 3.
>> Type 'L' to view the Lesser GNU General Public License version 2.1.
>> Type 'yes' to accept this license offer.
>> Type 'no' to decline this license offer.
>>
>> Do you accept the terms of either license? yes
>>
>> Creating qmake. Please wait...
>> make[1]: Entering directory
>> `/home/ckrinke/buildroot-2012.05/output/build/qt-4.8.1/qmake'
>> make[1]: c: Command not found
>> make[1]: [project.o] Error 127 (ignored)
>> make[1]: c: Command not found
>> make[1]: [property.o] Error 127 (ignored)
>> make[1]: c: Command not found
>> ...
>> make[1]: [qnumeric.o] Error 127 (ignored)
>> make[1]: c: Command not found
>> make[1]: [qcryptographichash.o] Error 127 (ignored)
>> make[1]: c: Command not found
>> make[1]: [qxmlstream.o] Error 127 (ignored)
>> make[1]: [qxmlutils.o] Error 127 (ignored)
>> /bin/sh: o: command not found
>> make[1]:
>> [/home/ckrinke/buildroot-2012.05/output/build/qt-4.8.1/bin/qmake]
>> Error 127 (ignored) make[1]: Leaving directory
>> `/home/ckrinke/buildroot-2012.05/output/build/qt-4.8.1/qmake'
>> /home/ckrinke/buildroot-2012.05/output/build/qt-4.8.1/config.tests/unix/compile.test:
>> line
>> 71: /home/ckrinke/buildroot-2012.05/output/build/qt-4.8.1/bin/qmake:
>> No such file or
>> directory /home/ckrinke/buildroot-2012.05/output/build/qt-4.8.1/config.tests/unix/compile.test:
>> line
>> 71: /home/ckrinke/buildroot-2012.05/output/build/qt-4.8.1/bin/qmake:
>> No such file or
>> directory /home/ckrinke/buildroot-2012.05/output/build/qt-4.8.1/config.tests/unix/compile.test:
>> line
>> 71: /home/ckrinke/buildroot-2012.05/output/build/qt-4.8.1/bin/qmake:
>> No such file or directory
>>
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Charles Krinke
