From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:45:31 -0800
Subject: [Buildroot] [buildroot 0000857]: libusb not compiling
Message-ID: <30c3f65f94aa88ce53cad8ee40837a38@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=857 
====================================================================== 
Reported By:                Jordi_Polo
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   857
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-28-2006 05:33 PDT
Last Modified:              02-12-2007 05:45 PST
====================================================================== 
Summary:                    libusb not compiling
Description: 
libusb and hence usb-tools can't be compiled

./libtool: line 1092:
/mnt/hda8/imagenes/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-g++:
No such file or directory

make[3]: *** [usbpp.lo] Error 1

make[3]: se sale del directorio
`/mnt/hda8/imagenes/buildroot/build_i686/libusb-0.1.12'

make[2]: *** [all-recursive] Error 1

make[2]: se sale del directorio
`/mnt/hda8/imagenes/buildroot/build_i686/libusb-0.1.12'

make[1]: *** [all] Error 2
====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 04-28-06 06:11  
---------------------------------------------------------------------- 
You need to enable C++ support (BR2_INSTALL_LIBSTDCPP).
We could make libusb depend on that or hack it's autoconf to only compile
the C++ part if BR2_INSTALL_LIBSTDCPP is enabled. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-28-06 05:33  Jordi_Polo     New Issue                                    
04-28-06 05:33  Jordi_Polo     Status                   new => assigned     
04-28-06 05:33  Jordi_Polo     Assigned To               => uClibc          
04-28-06 06:11  jacmet         Note Added: 0001333                          
02-12-07 05:45  vapier         Assigned To              uClibc => buildroot 
======================================================================
