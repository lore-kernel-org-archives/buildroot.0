From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 15 Feb 2007 14:00:38 -0800
Subject: [Buildroot] [buildroot 0001223]: PATCH: 'make source' does not
	download dhcp package source.
Message-ID: <cbae84b10d11679e58b3d30cc76f2e54@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1223 
====================================================================== 
Reported By:                foogod
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1223
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-15-2007 14:00 PST
Last Modified:              02-15-2007 14:00 PST
====================================================================== 
Summary:                    PATCH: 'make source' does not download dhcp package
source.
Description: 
The dhcp package .mk file has apparently been modified to support separate
building of server/relay/client binaries, and thus separate targets, but
the "-source" target wasn't modified to match.  As a result, 'make source'
will not download the dhcp source package (it instead tries to download it
just before building it, which can be a problem when the build system is
not connected to the internet).

The attached patch (against 17902) fixes this issue.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-15-07 14:00  foogod         New Issue                                    
02-15-07 14:00  foogod         Status                   new => assigned     
02-15-07 14:00  foogod         Assigned To               => buildroot       
02-15-07 14:00  foogod         File Added: buildroot.17902.dhcp_source.patch    
               
======================================================================
