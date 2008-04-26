From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 26 Apr 2008 08:19:45 -0700
Subject: [Buildroot] [buildroot 0003144]: App configure scripts will not
	link in/include libintl under buildroot/resulting toolchain
Message-ID: <4819747c3f861b48dea841d1ba848b0a@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3144 
====================================================================== 
Reported By:                jbruchon
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3144
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-26-2008 08:19 PDT
Last Modified:              04-26-2008 08:19 PDT
====================================================================== 
Summary:                    App configure scripts will not link in/include
libintl under buildroot/resulting toolchain
Description: 
I have noticed this on many programs now: buildroot fails to compile many
programs looking for libintl_gettext and the solution is to manually
configure those programs to do CPPFLAGS=-Iintl and LDFLAGS=-lintl every
time.  This is happening to me in both buildroot as well as the resulting
filesystem's toolchain.  I have seen it in grep, util-linux, and many
others.  If uClibc does not provide gettext, and buildroot builds GNU
gettext because of that fact, why do none of the configure scripts I use
actually link up to libintl correctly?  I don't know if buildroot is
screwing up libintl somehow or if the uClibc is the problem, but if I do
./configure CPPFLAGS=-Iintl and LDFLAGS=-lintl it almost always seems to
work.  After that, however, util-linux complains about bcopy:

gcc  -Os -pipe -march=i486  -lintl -o fdisk  fdisk.o disksize.o
fdiskbsdlabel.o fdisksgilabel.o fdisksunlabel.o fdiskaixlabel.o
i386_sys_types.o partname.o  
fdiskbsdlabel.o: In function `xbsd_readlabel':
fdiskbsdlabel.c:(.text+0x552): undefined reference to `bcopy'
fdiskbsdlabel.o: In function `bselect':
fdiskbsdlabel.c:(.text+0xdc1): undefined reference to `bcopy'
fdiskbsdlabel.c:(.text+0xe65): undefined reference to `bcopy'
fdiskbsdlabel.c:(.text+0x113d): undefined reference to `bcopy'
collect2: ld returned 1 exit status
make[2]: *** [fdisk] Error 1

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-26-08 08:19  jbruchon       New Issue                                    
04-26-08 08:19  jbruchon       Status                   new => assigned     
04-26-08 08:19  jbruchon       Assigned To               => buildroot       
======================================================================
