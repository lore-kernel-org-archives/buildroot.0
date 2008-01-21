From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 21 Jan 2008 11:47:27 -0800
Subject: [Buildroot] [buildroot 0001959]: mDNSResponder-107.6 fails to cross
	compile with incompatible object error
Message-ID: <33d0395a6ce5fbf7ac4fda301ff6c5f6@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1959 
====================================================================== 
Reported By:                dajhorn
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1959
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-21-2008 11:46 PST
Last Modified:              01-21-2008 11:47 PST
====================================================================== 
Summary:                    mDNSResponder-107.6 fails to cross compile with
incompatible object error
Description: 
The mDNSResponder 107.6 package fails to cross compile in buildroot
revision 20883 with this error:

cc dns-sd.c -L../mDNSPosix/build/prod/ -ldns_sd -I../mDNSShared -o
build/dns-sd
/usr/bin/ld: skipping incompatible ../mDNSPosix/build/prod//libdns_sd.so
when searching for -ldns_sd
/usr/bin/ld: cannot find -ldns_sd
collect2: ld returned 1 exit status

This package compiles properly when the buildroot host is the same
architecture as the buildroot target.
====================================================================== 

---------------------------------------------------------------------- 
 dajhorn - 01-21-08 11:47  
---------------------------------------------------------------------- 
The second attachment is a transcript for a successful native build with
the same buildroot configuration. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-21-08 11:46  dajhorn        New Issue                                    
01-21-08 11:46  dajhorn        Status                   new => assigned     
01-21-08 11:46  dajhorn        Assigned To               => buildroot       
01-21-08 11:46  dajhorn        File Added: mDNSResponder-build_amd64.txt        
           
01-21-08 11:47  dajhorn        Note Added: 0003479                          
======================================================================
