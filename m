From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:42:24 -0800
Subject: [Buildroot] [buildroot 0001186]: 17669 - problem with number of
	arguments in sprintsigmask
Message-ID: <264ffa91d15f53d408c81e3bdd75bb19@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1186 
====================================================================== 
Reported By:                jcoppens
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1186
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-30-2007 17:13 PST
Last Modified:              02-12-2007 05:42 PST
====================================================================== 
Summary:                    17669 - problem with number of arguments in
sprintsigmask
Description: 
Thanks to all other suggestions... I hope I'm not tireing out everyone
with these bugreports...

Installed 17669 and applied the mod from Benjamin to compile busybox.
Now I get the error below, which is probably due to some incorrect 
version somewhere. Suggestions?

John

====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 02-04-07 08:42  
---------------------------------------------------------------------- 
Please retry with an unpatched, clean trunk of buildroot.
If it still fails, then please provide your egrep "^(#|$)" .config of
buildroot and uClibc, so i can try to reproduce this locally.

Thanks, 

---------------------------------------------------------------------- 
 ctaylor - 02-05-07 13:07  
---------------------------------------------------------------------- 
FYI,

I just triggered this same error trying to build buildroot r17697 for MIPS
(with uClibc-0.9.28.1). 

if buildroot/build_mipsel/staging_dir/bin/mipsel-linux-uclibc-gcc
-DHAVE_CONFIG_H -I. -I. -I. -Ilinux/mips -I./linux/mips -Ilinux -I./linux 
 -Wall -O2 -pipe   -MT signal.o -MD -MP -MF ".deps/signal.Tpo" -c -o
signal.o signal.c; \
        then mv -f ".deps/signal.Tpo" ".deps/signal.Po"; else rm -f
".deps/signal.Tpo"; exit 1; fi
signal.c: In function `sys_sigreturn':
signal.c:1438: warning: assignment makes integer from pointer without a
cast
signal.c:1443: warning: passing arg 2 of `sprintsigmask' makes pointer
from integer without a cast
signal.c:1443: error: too few arguments to function `sprintsigmask' 

---------------------------------------------------------------------- 
 bernhardf - 02-06-07 03:25  
---------------------------------------------------------------------- 
As i already said on the 4th february, please provide
$ egrep "^(#|$)" .config of buildroot and uClibc

I can't help otherwise and will close this issue as cannot reproduce /
invalid otherwise.
thanks 

---------------------------------------------------------------------- 
 kriegaex - 02-08-07 14:03  
---------------------------------------------------------------------- 
I have the same problem and want to provide you with the information you
requested. However, I am not a C programmer, thus no make/autoconf
expert.

There is no file '.config' in strace's build root. Would you like to see
the grep-ed version of config.log instead?

As for uClibc, there are several configurations for different firmware
versions. Hopefully I figured out the version used by my mod.

I am attaching both files, filtered by egrep "^(#|$)", as requested. Is
this helpful in any way?

Edit - some more info: While getting this error in strace-4.5.15, the
build works fine for version 4.5.12. The tool works on the target system.

 

---------------------------------------------------------------------- 
 bernhardf - 02-09-07 06:20  
---------------------------------------------------------------------- 
This was fixed a few days ago. Thanks for the report! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-30-07 17:13  jcoppens       New Issue                                    
01-30-07 17:13  jcoppens       Status                   new => assigned     
01-30-07 17:13  jcoppens       Assigned To               => uClibc          
02-04-07 08:42  bernhardf      Note Added: 0002099                          
02-04-07 08:42  bernhardf      Status                   assigned => feedback
02-05-07 13:07  ctaylor        Note Added: 0002121                          
02-06-07 03:25  bernhardf      Note Added: 0002126                          
02-08-07 12:25  kriegaex       Issue Monitored: kriegaex                    
02-08-07 12:38  kriegaex       Note Added: 0002140                          
02-08-07 12:40  kriegaex       File Added: strace.config.txt                    
02-08-07 12:40  kriegaex       File Added: uClibc.config.txt                    
02-08-07 12:44  kriegaex       Note Edited: 0002140                         
02-08-07 14:03  kriegaex       Note Edited: 0002140                         
02-08-07 14:03  kriegaex       Note Edited: 0002140                         
02-09-07 06:20  bernhardf      Status                   feedback => closed  
02-09-07 06:20  bernhardf      Note Added: 0002144                          
02-09-07 06:20  bernhardf      Resolution               open => fixed       
02-12-07 05:42  vapier         Status                   closed => assigned  
02-12-07 05:42  vapier         Assigned To              uClibc => buildroot 
======================================================================
