From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:33 -0800
Subject: [Buildroot] [buildroot 0000782]: Config path for uClibc not
	included in uClibc makefile
Message-ID: <c43638bf63ebc0bc02f364dab5683e50@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=782 
====================================================================== 
Reported By:                maroc
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   782
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-10-2006 16:39 PST
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    Config path for uClibc not included in uClibc
makefile
Description: 
In the buildroot config, if you specify the path to the uClibc config, this
config is not included when compiling uClibc. The make file for uClibc in
toolchain/uClibc contains the statement:

ifndef $(UCLIBC_CONFIG_FILE)

but the config option for the uClibc config path is named:

BR2_PACKAGE_UCLIBC_CONFIG

so the config file specifed in the buildroot config is not used.

====================================================================== 

---------------------------------------------------------------------- 
 maroc - 03-16-06 13:35  
---------------------------------------------------------------------- 
Looking at the make file for busybox, I see a line like

BUSYBOX_CONFIG_FILE=$(subst ",, $(strip $(BR2_PACKAGE_BUSYBOX_CONFIG)))

where the busybox config is set from the buildroot config option.

Maybe the uclibc make file needs a similar statement to get the path for
the uclibc config? e.g.

UCLIBC_CONFIG_FILE=$(subst ",, $(strip $(BR2_PACKAGE_UCLIBC_CONFIG))) 

---------------------------------------------------------------------- 
 bernhardf - 12-22-06 04:15  
---------------------------------------------------------------------- 
AFAICS there is no BR2_PACKAGE_UCLIBC_CONFIG anymore.

If you want to use a pre-configured .config for uClibc, then
$ make UCLIBC_CONFIG_FILE=/my/uClibc.config

See docs/README. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-10-06 16:39  maroc          New Issue                                    
03-10-06 16:39  maroc          Status                   new => assigned     
03-10-06 16:39  maroc          Assigned To               => uClibc          
03-16-06 13:35  maroc          Note Added: 0001186                          
12-22-06 04:15  bernhardf      Status                   assigned => closed  
12-22-06 04:15  bernhardf      Note Added: 0001912                          
12-22-06 04:15  bernhardf      Resolution               open => fixed       
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================
