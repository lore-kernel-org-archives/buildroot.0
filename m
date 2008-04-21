From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 21 Apr 2008 07:09:58 -0700
Subject: [Buildroot] [buildroot 0003004]: undefined reference problem
Message-ID: <4ca5cc60b602851fa73953474d6da437@busybox.net>
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
Last Modified:              04-21-2008 07:09 PDT
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

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-21-08 01:17  gebecom        New Issue                                    
04-21-08 01:17  gebecom        Status                   new => assigned     
04-21-08 01:17  gebecom        Assigned To               => buildroot       
04-21-08 07:09  hmoffatt       Note Added: 0006794                          
======================================================================
