From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:35 -0800
Subject: [Buildroot] [buildroot 0000375]: libiberty regex warnings
Message-ID: <b945346d40d03490f787ded43516c20b@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=375 
====================================================================== 
Reported By:                mdeschamps
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   375
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-11-2005 01:38 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    libiberty regex warnings
Description: 
gcc-4.0.0/libiberty/regex.c uses a strcmp (s1,s2) in a macro which is a
basis
of regex char type recognition. Problem s1 is given arch specific var
whereas
s2 is used a a type base string. ex: 

bool isalpha = STREQ (str, "alpha") : str is (unsigned) char *, is const
char * alpha

Worse is sometimes is breaks down my make process. Put it minor yet.
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 08-11-05 05:34  
---------------------------------------------------------------------- 
gcc bug, not buildroot bug

file a bug at the gcc bugzilla 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-11-05 01:38  mdeschamps     New Issue                                    
08-11-05 01:38  mdeschamps     Status                   new => assigned     
08-11-05 01:38  mdeschamps     Assigned To               => uClibc          
08-11-05 05:34  vapier         Note Added: 0000403                          
08-11-05 05:34  vapier         Status                   assigned => closed  
08-11-05 05:34  vapier         Resolution               open => won't fix   
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
