From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 21 Apr 2008 01:17:20 -0700
Subject: [Buildroot] [buildroot 0003004]: undefined reference problem
Message-ID: <f70cc8baefca46df7a9289ec2cf69076@www.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
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
Last Modified:              04-21-2008 01:17 PDT
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

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-21-08 01:17  gebecom        New Issue                                    
04-21-08 01:17  gebecom        Status                   new => assigned     
04-21-08 01:17  gebecom        Assigned To               => buildroot       
======================================================================
