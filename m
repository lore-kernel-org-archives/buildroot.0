From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 9 Nov 2012 22:44:32 +0100
Subject: [Buildroot] QT packackage grantlee not building
Message-ID: <28814AE91EA94801B84C55B81555379F@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
Currently the build of the QT grantlee package is broken:
it seems like libpthread is not linked in.
 
[ 97%] Building CXX object templates/defaulttags/CMakeFiles/grantlee_defaulttags.dir/moc_spaceless.cxx.o
[ 97%] Building CXX object templates/defaulttags/CMakeFiles/grantlee_defaulttags.dir/moc_ssi.cxx.o
[ 97%] Building CXX object templates/defaulttags/CMakeFiles/grantlee_defaulttags.dir/moc_templatetag.cxx.o
[ 98%] Building CXX object templates/defaulttags/CMakeFiles/grantlee_defaulttags.dir/moc_widthratio.cxx.o
[ 98%] Building CXX object templates/defaulttags/CMakeFiles/grantlee_defaulttags.dir/moc_with.cxx.o
Linking CXX shared module ../../grantlee/0.2/grantlee_defaulttags.so
make[3]: Leaving directory `/home/buildroot12git/output/build/grantlee-0.2.0'
[ 98%] Built target grantlee_defaulttags
Linking CXX executable testgenerictypes_exec
/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.6.3/../../../../arm-buildroot-linux-uclibcgnueabi/b
in/ld: /home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libQtCore.so: undefined reference to
symbol 'pthread_cancel'
/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.6.3/../../../../arm-buildroot-linux-uclibcgnueabi/b
in/ld: note: 'pthread_cancel' is defined in DSO
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/lib/libpthread.so.0 so try adding it to the linker
command line
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/lib/libpthread.so.0: could not read symbols: Invalid
operation
collect2: ld returned 1 exit status
make[3]: *** [templates/tests/testgenerictypes_exec] Error 1
make[3]: Leaving directory `/home/buildroot12git/output/build/grantlee-0.2.0'
make[2]: *** [templates/tests/CMakeFiles/testgenerictypes_exec.dir/all] Error 2
make[2]: Leaving directory `/home/buildroot12git/output/build/grantlee-0.2.0'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/buildroot12git/output/build/grantlee-0.2.0'
make: *** [/home/buildroot12git/output/build/grantlee-0.2.0/.stamp_built] Error 
 
 

Regards Johan

 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121109/fe4fbd19/attachment.html>
