From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 21 Apr 2008 07:24:20 -0700
Subject: [Buildroot] [buildroot 0003004]: undefined reference problem
Message-ID: <f6c78d5caed04101b63a09dc7f25a660@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3004 
====================================================================== 
Reported By:                gebecom
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3004
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-21-2008 01:17 PDT
Last Modified:              04-21-2008 07:24 PDT
====================================================================== 
Summary:                    undefined reference problem
Description: 
/opt/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/bin/ld:
cannot find /opt/usr/local/arm/gcc-4.1.2-uclibc/lib/libc.so.0
collect2: ld returned 1 exit status

actually it is trying to get libc.so.s0 from a wrong path, i copied the
files at that particular file path but it fails at some next stage giving
the error details below...

/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__towupper_l'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__strtold_l'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__strftime_l'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__nl_langinfo_l'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__newlocale'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__freelocale'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__wcsxfrm_l'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__iswctype_l'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__towlower_l'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__strtod_l'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__uselocale'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__strcoll_l'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__wctype_l'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__strxfrm_l'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__wcsftime_l'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__strtof_l'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__wcscoll_l'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__duplocale'

please guide me how can i fix this issue and the possible reason, 
====================================================================== 

---------------------------------------------------------------------- 
 hmoffatt - 04-21-08 07:09  
---------------------------------------------------------------------- 
Where did you get your compiler? It doesn't seem to have been built with
buildroot (in that case it would be installed in build_$arch/staging_dir,
not in /opt/atmel). I think you should complain to the vendor, as
buildroot can't fix a broken external toolchain. 

---------------------------------------------------------------------- 
 gebecom - 04-21-08 07:17  
---------------------------------------------------------------------- 
i have wrong kopiert, hier is the error
how can i solve the question?
Generating embedded module rules ...
   [CC] stereorize.c -> stereorize.o
   [CC] frame.c -> frame.o
   [LD] stereorize.o frame.o -> stereorize
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__towupper_l'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__strtold_l'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__strftime_l'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__nl_langinfo_l'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__newlocale'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__freelocale'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__wcsxfrm_l'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__iswctype_l'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__towlower_l'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__strtod_l'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__uselocale'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__strcoll_l'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__wctype_l'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__strxfrm_l'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__wcsftime_l'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__strtof_l'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__wcscoll_l'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__duplocale'
collect2: ld returned 1 exit status
make[1]: *** [stereorize] Error 1
make: *** [utils] Error 2

 

---------------------------------------------------------------------- 
 hmoffatt - 04-21-08 07:24  
---------------------------------------------------------------------- 
It looks like whatever package you are building (stereorize.o etc) needs
WCHAR support in uClibc which is disabled in your build. 

make uclibc-menuconfig and turn on "wide character support" under "string
and stdio" support. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-21-08 01:17  gebecom        New Issue                                    
04-21-08 01:17  gebecom        Status                   new => assigned     
04-21-08 01:17  gebecom        Assigned To               => buildroot       
04-21-08 07:09  hmoffatt       Note Added: 0006794                          
04-21-08 07:14  gebecom        Issue Monitored: gebecom                     
04-21-08 07:16  gebecom        Note Added: 0006804                          
04-21-08 07:17  gebecom        Note Edited: 0006804                         
04-21-08 07:24  hmoffatt       Note Added: 0006814                          
======================================================================
