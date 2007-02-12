From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:33:10 -0800
Subject: [Buildroot] [buildroot 0001209]: uClibc won't build when
	GREP_OPTIONS is set
Message-ID: <899d5016597756f15ed48598df7eab1b@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1209 
====================================================================== 
Reported By:                bagland
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1209
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-12-2007 05:12 PST
Last Modified:              02-12-2007 05:33 PST
====================================================================== 
Summary:                    uClibc won't build when GREP_OPTIONS is set
Description: 
If the environment variable GREP_OPTIONS contains -n, uClibc won't build
because of this line:  TARGET_ARCH:=$(shell grep -s ^TARGET_ARCH
$(TOPDIR)/.config | sed -e 's/^TARGET_ARCH=//' -e 's/"//g') in
uClibc/Rules.mk.
TARGET_ARCH becomes "30:arm", which leads to problems while running
fix_includes.sh.
The attached patch test for GREP_OPTIONS at the beginning of the build.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-12-07 05:12  bagland        New Issue                                    
02-12-07 05:12  bagland        Status                   new => assigned     
02-12-07 05:12  bagland        Assigned To               => uClibc          
02-12-07 05:12  bagland        File Added: grep_options.patch                   

02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
======================================================================
