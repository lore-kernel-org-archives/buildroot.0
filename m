From: <bogus@does.not.exist.com>
Date: Tue, 06 Feb 2007 07:08:39 -0000
Subject: No subject
Message-ID: <mailman.2.1171288205.4267.buildroot@uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

targets clean and distclean are to have different effects, depending on
whether or not a .config file is present in the top-level directory.

This is because 'clean' and 'distclean' are part of the noconfig_targets
list.

The attached patch removes clean and distclean from the noconfig_targets
list, allowing the behavior of clean and distclean to vary depending on
whether or not a .config file is present.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-22-05 19:31  samrobb        New Issue                                    
04-22-05 19:31  samrobb        File Added: noconfig_targets.patch               
    
01-25-06 05:37  prpplague      Status                   assigned => resolved
01-25-06 05:37  prpplague      Resolution               open => fixed       
01-25-06 05:37  prpplague      Additional Information Updated                   

03-08-06 16:53  vapier         Status                   resolved => closed  
02-12-07 05:47  vapier         Status                   closed => assigned  
02-12-07 05:47  vapier         Assigned To              uClibc => buildroot 
======================================================================
