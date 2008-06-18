From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 17 Jun 2008 19:45:25 -0700
Subject: [Buildroot] [buildroot 0001899]: Using the Atmel supplied build
	root, openssl fails to build
Message-ID: <64c1ac2157166b7e45a4e8850beb399f@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1899 
====================================================================== 
Reported By:                yogy
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1899
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-04-2008 15:34 PST
Last Modified:              06-17-2008 19:45 PDT
====================================================================== 
Summary:                    Using the Atmel supplied build root, openssl fails
to build
Description: 
openssl fails to build because avr32 architecture is not supported.

I have "hacked" the openssl.patch to change the entry for alpha ev4 (which
I suppose does not really need buildroot support) to 

+"linux-avr32","gcc:-DTERMIO -O3 -fomit-frame-pointer
-Wall::-D_REENTRANT::-ldl:BN_LLONG
DES_RISC1::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",

all on one line.

Also, the gcc version used, does not support the -msoft-float option, so I
had to remove the 

$(SED) 's,/CFLAG=,/CFLAG= $(TARGET_SOFT_FLOAT) ,g' \
      $(OPENSSL_DIR)/Configure

lines from openssl.mk.  After this, openssl built fine for avr32 .
====================================================================== 

---------------------------------------------------------------------- 
 glennswest - 06-17-08 19:45  
---------------------------------------------------------------------- 
Building based on current snapshot of buildroot, problem still occurs on
avr32
Jun 18, 2008 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-04-08 15:34  yogy           New Issue                                    
01-04-08 15:34  yogy           Status                   new => assigned     
01-04-08 15:34  yogy           Assigned To               => buildroot       
06-17-08 19:45  glennswest     Note Added: 0008374                          
======================================================================
