From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 28 Dec 2007 10:05:14 -0800
Subject: [Buildroot] [buildroot 0001789]: Linux-PAM 0.99.9.0 support for
	buildroot
Message-ID: <01549fd5b9dc3c53c1f20e43eb701cf1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1789 
====================================================================== 
Reported By:                chrisv
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1789
Category:                   Architecture Specific
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-16-2007 12:35 PST
Last Modified:              12-28-2007 10:05 PST
====================================================================== 
Summary:                    Linux-PAM 0.99.9.0 support for buildroot
Description: 
This patch adds Linux-PAM support to buildroot.  (NIS/YP services are
removed from PAM to make this work.)  Until to the $(buildroot) directory
to integrate into the tree.
====================================================================== 

---------------------------------------------------------------------- 
 kriegaex - 12-28-07 04:57  
---------------------------------------------------------------------- 
I tried your patch, and it applies cleanly. But afterwards I have problems
building PAM with a similar makefile adapted from yours (cf. make log in
the attachment). Do you have any hints for me? There are some in the build
log, but I do not understand them because I am an automake newbie.

 

---------------------------------------------------------------------- 
 chrisv - 12-28-07 07:34  
---------------------------------------------------------------------- 
Hey kriegaex,

Try running autoreconf manually to rebuild the configure script.  It looks
like the patch didn't apply cleanly ... I'll look into the root cause
later.  (Some implementations of autoconf/automake will rebuild the
configure scripts automatically, and it looks like mine did.)

Details on autoreconf can be found here:
http://www.gnu.org/software/autoconf/manual/autoconf-2.57/html_chapter/autoconf_3.html#SEC14

Thanks,
Chris 

---------------------------------------------------------------------- 
 kriegaex - 12-28-07 10:05  
---------------------------------------------------------------------- 
Chris,

the patch did apply cleanly, without the slightest bit of fuzzy match or
so. This can be clearly seen in the log file I attached. On my system I
have automake 1.10, if this helps you in any way. It does not make sense
to attach my build script, because we use an adapted version of buildroot
with many macros you would be missing. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-16-07 12:35  chrisv         New Issue                                    
12-16-07 12:35  chrisv         Status                   new => assigned     
12-16-07 12:35  chrisv         Assigned To               => buildroot       
12-16-07 12:35  chrisv         File Added: pam-0.99.9.0b-nonis.tar.gz           
        
12-28-07 04:56  kriegaex       File Added: make.log                         
12-28-07 04:57  kriegaex       Note Added: 0003279                          
12-28-07 04:57  kriegaex       Note Edited: 0003279                         
12-28-07 04:57  kriegaex       Issue Monitored: kriegaex                    
12-28-07 07:34  chrisv         Note Added: 0003284                          
12-28-07 10:05  kriegaex       Note Added: 0003289                          
======================================================================
