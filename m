From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 10 Oct 2008 15:23:16 -0700
Subject: [Buildroot] [buildroot 0004894]: host lzo and zlib can't be built
	within buildroot
Message-ID: <4a5acfa44b1f7188d6fe12fc1afafdfb@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4894 
====================================================================== 
Reported By:                hmoffatt
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4894
Category:                   Other
Reproducibility:            have not tried
Severity:                   crash
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-11-2008 02:08 PDT
Last Modified:              10-10-2008 15:23 PDT
====================================================================== 
Summary:                    host lzo and zlib can't be built within buildroot
Description: 
host-mtd requires liblzo and zlib headers and libraries, but nothing in
buildroot builds them.

It's not clear if we should build these in buildroot or expect them to be
installed on the host system through the normal package manager.. zlib is
pretty common for example, though lzo less though.
======================================================================
Relationships       ID      Summary
----------------------------------------------------------------------
related to          0004804 lzo1x.h not found
====================================================================== 

---------------------------------------------------------------------- 
 john_schimandle - 10-10-08 11:30  
---------------------------------------------------------------------- 
Is there a known workaround for this problem? I noticed the Makefile in
toolchain_build_arm/mtd_orig limits the include file search path to the
local include directory (-I ./include). 

---------------------------------------------------------------------- 
 john_schimandle - 10-10-08 15:23  
---------------------------------------------------------------------- 
I figured it out but it took a while. The following packages needed to be
on my host machine.

zlib1g-dev
liblzo2-dev
acl-dev 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-11-08 02:08  hmoffatt       New Issue                                    
09-11-08 02:08  hmoffatt       Status                   new => assigned     
09-11-08 02:08  hmoffatt       Assigned To               => buildroot       
09-11-08 02:08  hmoffatt       Issue generated from     0004804             
09-11-08 02:08  hmoffatt       Relationship added       related to 0004804  
10-10-08 11:30  john_schimandleNote Added: 0013184                          
10-10-08 15:23  john_schimandleNote Added: 0013194                          
======================================================================
