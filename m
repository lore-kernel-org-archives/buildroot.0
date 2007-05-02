From: Diego A. Fons <diegofons@apexar.com>
Date: Wed, 02 May 2007 09:39:32 -0300
Subject: [Buildroot] Problems with zlib
Message-ID: <46388684.2090203@apexar.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to build tinyX using buildroot snapshot 18532 with a external 
toolchain, although i was able to build zlib, it seems that installation 
step is wrong because when building tinyX i get this message:

/home/dfons/toolchain-nihilisme/arm-unknown-linux-gnu/bin/arm-unknown-linux-gnu-gcc 
-o Xfbdev -Os      -L../../exports/lib -L/usr/X11R6/lib          
dix/libdix.a os/libos.a -lXau -lXdmcp  hw/kdrive/fbdev/libfbdev.a 
miext/layer/liblayer.a hw/kdrive/libkdrive.a hw/kdrive/linux/liblinux.a  
miext/shadow/libshadow.a render/librender.a  fb/libfb.a dix/libxpstubs.a 
mi/libmi.a Xext/libext.a                            render/librender.a  
-L/home/dfons/buildroot_18532/build_arm_nofpu/staging_dir/arm-linux-uclibc/lib    
../../lib/font/libXfont.a dix/libxpstubs.a -lz -lm
/home/dfons/toolchain-nihilisme/arm-unknown-linux-gnu/bin/../lib/gcc/arm-unknown-linux-gnu/4.1.0/../../../../arm-unknown-linux-gnu/bin/ld: 
cannot find -lz
collect2: ld returned 1 exit status
make[5]: *** [Xfbdev] Error 1
make[5]: Target `all' not remade because of errors.

It is not the headers bug which was described in previous mail, here ld 
can`t locate the zlib library. Is this another bug? how can i fix it?

I attach the .config file.

Regards,
Diego A. Fons.
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: .config
Url: http://busybox.net/lists/buildroot/attachments/20070502/7a93cf0d/attachment.diff 
