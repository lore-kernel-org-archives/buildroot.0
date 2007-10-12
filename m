From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 12 Oct 2007 09:03:54 -0700
Subject: [Buildroot] [buildroot 0001526]: lockfile-progs.c fails to compile
Message-ID: <d6669a51969d18b94ac79f9a1336666e@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1526 
====================================================================== 
Reported By:                Leon Bailly
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1526
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-12-2007 09:03 PDT
Last Modified:              10-12-2007 09:03 PDT
====================================================================== 
Summary:                    lockfile-progs.c fails to compile
Description: 
lockfile-progs.c fails to compile due to non-existing library-call to
rindex.

Patched with:

*** lockfile-progs.c.org        2007-10-10 12:07:56.000000000 +0200
--- lockfile-progs.c    2007-10-10 12:09:22.000000000 +0200
***************
*** 70,76 ****
      { NULL, 0, NULL, 0 }
    };

!   char *cmd_name = rindex(argv[0], '/');
    int mail_cmd_p = 0;

    if(cmd_name != NULL) {
--- 70,76 ----
      { NULL, 0, NULL, 0 }
    };

!   char *cmd_name = strrchr(argv[0], '/');
    int mail_cmd_p = 0;

    if(cmd_name != NULL) {

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-12-07 09:03  Leon Bailly    New Issue                                    
10-12-07 09:03  Leon Bailly    Status                   new => assigned     
10-12-07 09:03  Leon Bailly    Assigned To               => buildroot       
======================================================================
