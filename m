From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:15 -0800
Subject: [Buildroot] [buildroot 0000331]: Can't compile ntp
Message-ID: <93b88726ab92d88d477b18b2faceb422@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=331 
====================================================================== 
Reported By:                ssaguiar
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   331
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   crash
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-08-2005 20:19 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    Can't compile ntp
Description: 
When trying to compile ntp in buildroot, after a while, it gives this
error:


/home/ssaguiar/tmp/buildroot/build_i386/staging_dir/bin/i386-linux-uclibc-gcc
 -Os -pipe  -Wall -Wcast-qual -Wmissing-prototypes -Wpointer-arith -Wshadow
-Wstrict-prototypes   -o ntpdc-layout  ntpdc-layout.o
./ntpdc-layout > layout.here
/bin/sh: line 1: ./ntpdc-layout: File or directory not found
make[4]: ** [layout.here] Erro 127
make[4]: Leaving directory
`/home/ssaguiar/tmp/buildroot/build_i386/ntp-4.2.0/ntpdc'
make[3]: ** [maybe-layout] Erro 2
make[3]: Leaving directory
`/home/ssaguiar/tmp/buildroot/build_i386/ntp-4.2.0/ntpdc'
make[2]: ** [all-recursive] Erro 1
make[2]: Leaving directory
`/home/ssaguiar/tmp/buildroot/build_i386/ntp-4.2.0'
make[1]: ** [all] Erro 2
make[1]: Leaving directory
`/home/ssaguiar/tmp/buildroot/build_i386/ntp-4.2.0'
make: **
[/home/ssaguiar/tmp/buildroot/build_i386/ntp-4.2.0/ntpdate/ntpdate] Erro
2

====================================================================== 

---------------------------------------------------------------------- 
 ssaguiar - 07-09-05 07:18  
---------------------------------------------------------------------- 
This error happens at the end of the ntpdc Makefile, at :

ntpdc-layout.o: nl.c

layout.here: ntpdc-layout
        ./ntpdc-layout > $@


This is caused by the fact that the Makefile try to execute the
ntpdc-layout in the host system, but, as the ntpdc-layout is compiled with
the uclibc, it gives the error of 'file not found' for the ntpdc-layout
compiled program.

Sergio 

---------------------------------------------------------------------- 
 vapier - 09-07-05 17:51  
---------------------------------------------------------------------- 
fixed in svn 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-08-05 20:19  ssaguiar       New Issue                                    
07-09-05 07:18  ssaguiar       Note Added: 0000274                          
09-07-05 17:51  vapier         Note Added: 0000505                          
09-07-05 17:51  vapier         Status                   assigned => closed  
09-07-05 17:51  vapier         Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
