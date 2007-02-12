From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:42:40 -0800
Subject: [Buildroot] [buildroot 0001010]: Build-root make error - missing
	shadow.h
Message-ID: <b76b4d4cb5f3e3f1c060bc118422172f@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1010 
====================================================================== 
Reported By:                mboutte
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1010
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-27-2006 15:57 PDT
Last Modified:              02-12-2007 05:42 PST
====================================================================== 
Summary:                    Build-root make error - missing shadow.h
Description: 
I am new to build-root so forgive my possible lack of knowledge. I am
attempting a new run of build-root for an x86 host to powerpc target. As a
first attempt I left most of the defaults as-is, but used fairly new gcc
4.1.1 headers and a linux 2.6 type system. The initial make menuconfig
went OK, and the svn checkout seemed to work fine during the make process
too, except that after about 15 minutes of work the compilation stops with
an error --
"/home/mike/projects/software/snip875/build-tools/uclibc/buildroot/build_powerpc
/busybox/include/shadow_.h:23:20: error: shadow.h: No such file or
directory"

I googled your site and see other mentions of this error, but nothing I
try seems to resolve it, including older gcc, linux 2.4, enabling or
disableing shadow password support from the make config in the busybox
directory. I also tried a make clean during this. I'm lost and have not
more ideas now.

Note that svn checked out the new vresion 0.9.28. 

Mike
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 08-28-06 11:19  
---------------------------------------------------------------------- 
your uClibc is configured without shadow support ... that means you need to
either enable shadow support in uClibc or disable everything in busybox
that requries shadow 

---------------------------------------------------------------------- 
 mboutte - 08-28-06 14:38  
---------------------------------------------------------------------- 
Vapier,
Not to belabor this issue, but I had tried modifying the busybox
configuration by going to the busybox folder and running "make menuconfig"
to no avail. On more testing I saw when I went back to busybox
configuration after attempting a new build, that the configuration had
reverted to that before my changes. A more careful read of your docs
showed copying the new busybox configuration back to the
package/busybox/busybox.config file. When I did that the build worked. So,
for me the problem was that I assumed that using make menuconfig on busybox
actually modified the configuration that build-root would use. Again, this
is my first attempt at using this incredible tool, and I was unaware of
that requirement. 

---------------------------------------------------------------------- 
 bernhardf - 02-04-07 09:06  
---------------------------------------------------------------------- 
This was a bug in busybox that was fixed in the 1.4.x series. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-27-06 15:57  mboutte        New Issue                                    
08-27-06 15:57  mboutte        Status                   new => assigned     
08-27-06 15:57  mboutte        Assigned To               => uClibc          
08-28-06 11:19  vapier         Note Added: 0001596                          
08-28-06 11:19  vapier         Status                   assigned => closed  
08-28-06 11:19  vapier         Resolution               open => no change
required
08-28-06 14:38  mboutte        Status                   closed => feedback  
08-28-06 14:38  mboutte        Resolution               no change required =>
reopened
08-28-06 14:38  mboutte        Note Added: 0001597                          
02-04-07 09:06  bernhardf      Status                   feedback => closed  
02-04-07 09:06  bernhardf      Note Added: 0002105                          
02-04-07 09:06  bernhardf      Resolution               reopened => fixed   
02-12-07 05:42  vapier         Status                   closed => assigned  
02-12-07 05:42  vapier         Assigned To              uClibc => buildroot 
======================================================================
