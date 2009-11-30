From: Joachim Pihl <jpihl@nevion.com>
Date: Mon, 30 Nov 2009 14:47:12 +0100
Subject: [Buildroot] More build trouble (2009.11-rc1)
Message-ID: <op.u37m8yxayqa4qb@jap-lappis>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It didn't do this on 2009.08



/opt/xscale-toolchain/usr/bin/arm-linux-uclibcgnueabi-gcc -Os -pipe -Os  
-I/opt/xscale-toolchain/usr/include -I/opt/xscale-toolchain/include  
--sysroot=/opt/xscale-toolchain/ -isysroot /opt/xscale-toolchain  
-mtune=xscale -march=armv5te -mabi=aapcs-linux -msoft-float -o  
.libs/gdparttopng gdparttopng.o  -L/opt/xscale-toolchain/usr/lib  
-L/usr/lib ./.libs/libgd.so /opt/xscale-toolchain/usr/lib/libpng12.so  
-L/opt/xscale-toolchain/lib -lz -lm -Wl,--rpath  
-Wl,/opt/xscale-toolchain/usr/lib
./.libs/libgd.so: undefined reference to `__isoc99_sscanf'
collect2: ld returned 1 exit status
make[3]: *** [annotate] Error 1
make[3]: *** Waiting for unfinished jobs....
./.libs/libgd.so: undefined reference to `__isoc99_sscanf'
collect2: ld returned 1 exit status
make[3]: *** [gdparttopng] Error 1
make[3]: Leaving directory  
`/home/jpihl/system_controller/buildroot-2009.11_rc1/output/build/gd-2.0.36RC1'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory  
`/home/jpihl/system_controller/buildroot-2009.11_rc1/output/build/gd-2.0.36RC1'
make[1]: *** [all] Error 2
make[1]: Leaving directory  
`/home/jpihl/system_controller/buildroot-2009.11_rc1/output/build/gd-2.0.36RC1'
make: ***  
[/home/jpihl/system_controller/buildroot-2009.11_rc1/output/build/gd-2.0.36RC1/libgd.so]  
Error 2



-- 
Using Opera's revolutionary e-mail client: http://www.opera.com/mail/
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 20392 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091130/cbdd4381/attachment-0005.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: Config.in
Type: application/octet-stream
Size: 125 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091130/cbdd4381/attachment-0006.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: libgd.mk
Type: application/octet-stream
Size: 2491 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091130/cbdd4381/attachment-0007.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: libgd-crosscompile_on_x86.patch.i386
Type: application/octet-stream
Size: 887 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091130/cbdd4381/attachment-0008.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: libgd-use_fgetc_and_fputc.patch
Type: application/octet-stream
Size: 2888 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091130/cbdd4381/attachment-0009.obj>
