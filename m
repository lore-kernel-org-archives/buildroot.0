From: Ozgun <ozgun.gunay@gmail.com>
Date: Tue, 31 Jan 2012 18:01:01 +0200
Subject: [Buildroot] lib files
Message-ID: <CAPeX=+vjLjg2vZL50NgSD-TozqDXtq8R3Anj=PNvCoCtTd0+EA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I built rootfs with opengl and QT without problem. (The compiled examples
of QT also run in ubuntu without problem)
But when I tried to run these qt examples in created rootfs, it gives "file
not found" error. (I both tried these examples static and shared compiled.)

Then I cheked the dependency of application, you can see results below.
The /usr/lib folder has the lib files but in a .a format.
For example libm.a is exist but libm.so absent.

How can I solve this problem?

thanks,
Ozgun



root at E6320:/usr/src/br/buildroot/output/target# chroot .
bash-4.2# cd /usr/share/qt/demos/affine/
bash-4.2# ls
affine      affine.qrc  main.cpp    xform.h
affine.pro  bg1.jpg     xform.cpp   xform.html
bash-4.2# ldd affine
checking sub-depends for '/usr/lib/libQtOpenGL.so.4'
checking sub-depends for '/usr/lib/libQtGui.so.4'
checking sub-depends for '/usr/lib/libQtCore.so.4'
checking sub-depends for '/usr/lib/libstdc++.so.6'
checking sub-depends for '/lib/libgcc_s.so.1'
checking sub-depends for 'not found'
checking sub-depends for '/usr/lib/libfreetype.so.6'
checking sub-depends for 'not found'
checking sub-depends for '/usr/lib/libGL.so.1'
checking sub-depends for '/usr/lib/libXrender.so.1'
checking sub-depends for '/usr/lib/libX11.so.6'
checking sub-depends for 'not found'
checking sub-depends for '/lib/libpthread.so.0'
    libdl.so.0 => /lib/libdl.so.0 (0xb7831000)
    libc.so.0 => /lib/libc.so.0 (0xb77dc000)
    ld-uClibc.so.0 => /lib/ld-uClibc.so.0 (0xb7838000)
checking sub-depends for '/usr/lib/libSM.so.6'
checking sub-depends for '/usr/lib/libICE.so.6'
checking sub-depends for '/usr/lib/libXcursor.so.1'
checking sub-depends for '/usr/lib/libfontconfig.so.1'
checking sub-depends for '/usr/lib/libXext.so.6'
checking sub-depends for 'not found'
checking sub-depends for '/lib/libm.so.0'
    libc.so.0 => /lib/libc.so.0 (0xb76f1000)
    ld-uClibc.so.0 => /lib/ld-uClibc.so.0 (0xb7749000)
checking sub-depends for '/lib/libc.so.0'
    ld-uClibc.so.0 => /lib/ld-uClibc.so.0 (0xb779d000)
checking sub-depends for '/usr/lib/libXfixes.so.3'
checking sub-depends for '/usr/lib/libz.so.1'
checking sub-depends for '/usr/lib/libbz2.so.1.0'
checking sub-depends for '/usr/lib/libexpat.so.1'
    libQtOpenGL.so.4 => /usr/lib/libQtOpenGL.so.4 (0x00000000)
    libQtGui.so.4 => /usr/lib/libQtGui.so.4 (0x00000000)
    libQtCore.so.4 => /usr/lib/libQtCore.so.4 (0x00000000)
    libstdc++.so.6 => /usr/lib/libstdc++.so.6 (0x00000000)
    libgcc_s.so.1 => /lib/libgcc_s.so.1 (0x00000000)
    libc.so.6 => not found (0x00000000)
    libfreetype.so.6 => /usr/lib/libfreetype.so.6 (0x00000000)
    libdl.so.2 => not found (0x00000000)
    libGL.so.1 => /usr/lib/libGL.so.1 (0x00000000)
    libXrender.so.1 => /usr/lib/libXrender.so.1 (0x00000000)
    libX11.so.6 => /usr/lib/libX11.so.6 (0x00000000)
    libm.so.6 => not found (0x00000000)
    libpthread.so.0 => /lib/libpthread.so.0 (0x00000000)
    libSM.so.6 => /usr/lib/libSM.so.6 (0x00000000)
    libICE.so.6 => /usr/lib/libICE.so.6 (0x00000000)
    libXcursor.so.1 => /usr/lib/libXcursor.so.1 (0x00000000)
    libfontconfig.so.1 => /usr/lib/libfontconfig.so.1 (0x00000000)
    libXext.so.6 => /usr/lib/libXext.so.6 (0x00000000)
    librt.so.1 => not found (0x00000000)
    libm.so.0 => /lib/libm.so.0 (0x00000000)
    libc.so.0 => /lib/libc.so.0 (0x00000000)
    /lib/ld-uClibc.so.0 => /lib/ld-uClibc.so.0 (0x00000000)
    libXfixes.so.3 => /usr/lib/libXfixes.so.3 (0x00000000)
    libz.so.1 => /usr/lib/libz.so.1 (0x00000000)
    libbz2.so.1.0 => /usr/lib/libbz2.so.1.0 (0x00000000)
    libexpat.so.1 => /usr/lib/libexpat.so.1 (0x00000000)
    not a dynamic executable
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120131/303430b0/attachment.html>
