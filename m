From: inblueswithu <inblueswithu@hotmail.com>
Date: Fri, 27 Jan 2012 15:24:09 +0530
Subject: [Buildroot] Bug 3877 - Patch not working
In-Reply-To: <BLU0-SMTP12114F40C37660CBB539A15D28E0@phx.gbl>
References: <BLU0-SMTP12114F40C37660CBB539A15D28E0@phx.gbl>
Message-ID: <BLU0-SMTP1654BA5FF86775DFCB3429FD28E0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

I 've got *"undefined reference to `accept4'"* this error while using 
buildroot.
When I googled, I got this patch: 
https://bugs.uclibc.org/attachment.cgi?id=3415&action=edit

I tried to apply this patch manually to the file as the patch is failing 
to apply.
Even then the error persisted.
Can some one please help me in overcoming this.
My uClibc version : uClibc-0.9.32 & This was the error in command line

    cd src/network/ && /usr/bin/make -f Makefile
    make[2]: Entering directory
    `/home/inblueswithu/buildroot2/buildroot/output/build/qt-4.7.4/src/network'
    rm -f libQtNetwork.so.4.7.4 libQtNetwork.so libQtNetwork.so.4
    libQtNetwork.so.4.7
    linking ../../lib/libQtNetwork.so.4.7.4
    .obj/release-shared-emb-arm/qnativesocketengine_unix.o: In function
    `QNativeSocketEnginePrivate::nativeAccept()':
    qnativesocketengine_unix.cpp:(.text+0x8d4): undefined reference to
    `accept4'
    .obj/release-shared-emb-arm/qlocalserver_unix.o: In function
    `QLocalServerPrivate::_q_onNewConnection()':
    qlocalserver_unix.cpp:(.text+0x718): undefined reference to `accept4'
    collect2: ld returned 1 exit status
    make[2]: *** [../../lib/libQtNetwork.so.4.7.4] Error 1
    make[2]: Leaving directory
    `/home/inblueswithu/buildroot2/buildroot/output/build/qt-4.7.4/src/network'
    make[1]: *** [sub-network-make_default-ordered] Error 2
    make[1]: Leaving directory
    `/home/inblueswithu/buildroot2/buildroot/output/build/qt-4.7.4'
    make: ***
    [/home/inblueswithu/buildroot2/buildroot/output/build/qt-4.7.4/.stamp_built]
    Error 2

Thanks & Regards
/inblueswithu/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120127/1bd96a52/attachment-0001.html>
