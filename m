From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 26 Mar 2008 02:48:48 -0700
Subject: [Buildroot] [buildroot 0002644]: incorrect FTP address for NCURSES
Message-ID: <c9e2ce3c4c0a3f9742999eecc706131b@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=2644 
====================================================================== 
Reported By:                testarx
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2644
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 fixed
Fixed in Version:           
====================================================================== 
Date Submitted:             03-23-2008 00:14 PDT
Last Modified:              03-26-2008 02:48 PDT
====================================================================== 
Summary:                    incorrect FTP address for NCURSES
Description: 
The address for ncurses is incorrectly computed as
"http://ftp.gnu.org/pub/gnu"/gnu/ncurses/ncurses-5.6.tar.gz"
which contains an extra /gnu/ 


output:

wget --passive-ftp  -P /home/x/Desktop/omap/buildroot/dl
"http://ftp.gnu.org/pub/gnu"/gnu/ncurses/ncurses-5.6.tar.gz
--02:09:34--  http://ftp.gnu.org/pub/gnu/gnu/ncurses/ncurses-5.6.tar.gz
           => `/home/x/Desktop/omap/buildroot/dl/ncurses-5.6.tar.gz'
Resolving ftp.gnu.org... 140.186.70.20
Connecting to ftp.gnu.org|140.186.70.20|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
02:09:34 ERROR 404: Not Found.

======================================================================
Relationships       ID      Summary
----------------------------------------------------------------------
duplicate of        0002634 path to ncurses seems to contain extra ...
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-23-08 00:14  testarx        New Issue                                    
03-23-08 00:14  testarx        Status                   new => assigned     
03-23-08 00:14  testarx        Assigned To               => buildroot       
03-25-08 20:32  hmoffatt       Relationship added       duplicate of 0002634
03-25-08 20:32  hmoffatt       Duplicate ID             0 => 2634           
03-25-08 20:32  hmoffatt       Status                   assigned => resolved
03-25-08 20:32  hmoffatt       Resolution               open => fixed       
03-26-08 02:48  hmoffatt       Status                   resolved => closed  
======================================================================
