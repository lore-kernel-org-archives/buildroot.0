From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 26 Apr 2008 21:38:35 -0700
Subject: [Buildroot] [buildroot 0003154]: configure option for local package
	mirror
Message-ID: <1df6d944fede016f7810600688e30778@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3154 
====================================================================== 
Reported By:                kendallc
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3154
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-26-2008 19:21 PDT
Last Modified:              04-26-2008 21:38 PDT
====================================================================== 
Summary:                    configure option for local package mirror
Description: 
It would be nice to have an option for buildroot pull packages from a local
mirror. This feature would allow users to run a fresh buildroot build
without an internet connection. It requires the addition of a
configuration option. It also requires a few lines below the "..._SITE:="
stuff in every package's makefile.

I've attached a patch that adds a BR2_PACKAGE_MIRROR option to
target/device/Config.in.mirrors. The patch adds support for the option to
uClibc, and busybox. This patch is just an example of how this feature
could be added to a couple of packages.

The code to add the feature is fairly simple; however, it requires
touching every package makefile.
====================================================================== 

---------------------------------------------------------------------- 
 hbr_in - 04-26-08 21:38  
---------------------------------------------------------------------- 
Hi,

Instead of adding an option, what i do is that -->

i have a local directory which contain all my sources. 

my local src --> /opt/source
my buildroot directory --> /opt/buildroot

Inside Buildroot, i link the above folder to dl directory i.e., to a
directory where buildroot downloads and stores all package source

/opt/buildroot # ln -s /opt/source dl

So when buildroot starts make it 1st check in dl/ directory (which is my
local source directory) and if it finds the source there then it doesnt
need any internet connection.

Regards
Gururaja 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-26-08 19:21  kendallc       New Issue                                    
04-26-08 19:21  kendallc       Status                   new => assigned     
04-26-08 19:21  kendallc       Assigned To               => buildroot       
04-26-08 19:21  kendallc       File Added: buildroot-local-mirror.patch         
          
04-26-08 21:38  hbr_in         Note Added: 0007254                          
======================================================================
