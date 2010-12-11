From: Justin Mark <oilehus@yahoo.com>
Date: Fri, 10 Dec 2010 22:24:05 -0800 (PST)
Subject: [Buildroot] Problem to add DConf in buildroot
Message-ID: <200580.42715.qm@web111101.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

When I tried to add DConf into buildroot, I got the following error:

../client/libdconf.so.0: undefined reference to `posix_fallocate'
collect2: ld returned 1 exit status

but I can build DConf without any problems outside of buildroot. 

In the Makefile.am, there's a line 

dconf_LDADD = $(gio_LIBS) ../client/libdconf.so.0

It seems to me that a dependency of "../client/libdconf.so.0" is not in the path when I built under buildroot, if so, anyone has an idea how to patch the makefile, so I can build Dconf and link with libdconf.so.0

Many Thanks,
Justin


  



      
