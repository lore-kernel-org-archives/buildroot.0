From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 4 Jul 2008 23:47:33 -0700
Subject: [Buildroot] [buildroot 0003934]: make clean Error with webif option
	on. rm comamnd fails
Message-ID: <9978f1770207948aa35194f480f06e3d@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been RESOLVED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3934 
====================================================================== 
Reported By:                mebarton
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3934
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     resolved
Resolution:                 fixed
Fixed in Version:           
====================================================================== 
Date Submitted:             07-04-2008 12:42 PDT
Last Modified:              07-04-2008 23:47 PDT
====================================================================== 
Summary:                    make clean Error with webif option on. rm comamnd
fails
Description: 
Need to do a full make with the webif option (Package..--->
Networking--->Webif selected with install index.html in make menuconfig)
then do make cleanup

make clean
.
.
.
error:
rm -f /buildroot/project_build_avr32/atngw100/root/www/cgi-bin/webif*
/buildroot/project_build_avr32/atngw100/root/www/webif.*
 can not remove the files


Fix add the -R to the rm like beload

rm -Rf /buildroot/project_build_avr32/atngw100/root/www/cgi-bin/webif*
/buildroot/project_build_avr32/atngw100/root/www/webif.*


I have seen this on a later Revision (did not recoed it), but I know this
has the problem.
svn info
Path: .
URL: svn://uclibc.org/trunk/buildroot
Repository Root: svn://uclibc.org
Repository UUID: 69ca8d6d-28ef-0310-b511-8ec308f3f277
Revision: 22403
Node Kind: directory
Schedule: normal
Last Changed Author: jacmet
Last Changed Rev: 22402
Last Changed Date: 2008-06-17 09:33:02 -0400 (Tue, 17 Jun 2008)

====================================================================== 

---------------------------------------------------------------------- 
 UlfSamuelsson - 07-04-08 23:47  
---------------------------------------------------------------------- 
svn fixed as proposed. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-04-08 12:42  mebarton       New Issue                                    
07-04-08 12:42  mebarton       Status                   new => assigned     
07-04-08 12:42  mebarton       Assigned To               => buildroot       
07-04-08 23:47  UlfSamuelsson  Status                   assigned => resolved
07-04-08 23:47  UlfSamuelsson  Resolution               open => fixed       
07-04-08 23:47  UlfSamuelsson  Note Added: 0008924                          
======================================================================
