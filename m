From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 26 Sep 2008 09:41:42 -0700
Subject: [Buildroot] [buildroot 0005164]: r23017 breaks largefile handling
	in bash
Message-ID: <a36cc532589503843fe9daa5f5ca0da1@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5164 
====================================================================== 
Reported By:                razzor
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5164
Category:                   New Features
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-26-2008 09:41 PDT
Last Modified:              09-26-2008 09:41 PDT
====================================================================== 
Summary:                    r23017 breaks largefile handling in bash
Description: 
with r23017 applied, bash can't handle big files:
$ cat < testfile.4097MB > /dev/null
-sh: testfile.4097MB: Value too large for defined data type

After reverting that hunk, bash worked as expected.
Tested on a x86 r23076 Build.


====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-26-08 09:41  razzor         New Issue                                    
09-26-08 09:41  razzor         Status                   new => assigned     
09-26-08 09:41  razzor         Assigned To               => buildroot       
======================================================================
