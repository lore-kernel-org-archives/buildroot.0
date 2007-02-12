From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:10 -0800
Subject: [Buildroot] [buildroot 0000911]: Buildroot 2006-06-08 broken links
Message-ID: <6e3e89cf268b019c4a9075848ae69981@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=911 
====================================================================== 
Reported By:                Ulf Samuelsson
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   911
Category:                   Other
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-18-2006 11:53 PDT
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    Buildroot 2006-06-08 broken links
Description: 
"dhcp 3.0.3" at DHCP_SITE is replaced by "dhcp 3.0.4".
        3.0.4 will not accept the buildroot patches.
        3.0.3 can now be downloaded from 
        DHCP_SITE:=ftp://ftp.isc.org/isc/dhcp/dhcp-3.0-history
"minicom-1.02" is no longer available at the MICROCOM_SITE
        MICROCOM_SITE:=http://familiar.handhelds.org/source/v0.8.2/ works

"expat" uses a hardwired sourceforge mirror which does not work
        -EXPAT_SITE=http://internap.dl.sourceforge.net/sourceforge/expat 

+EXPAT_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/expat

"fakeroot" require po4a 
        Available on
http://dl.atrpms.net/all/po4a-0.23-1.rhfc5.at.src.rpm


"portage" 
                package sandbox is no longer available at site
        -http://gentoo.osuosl.org/distfiles/sandbox-1.2.13.tar.bz2
        +http://gentoo.osuosl.org/distfiles/sandbox-1.2.18.tar.bz2
"QT/E"  
        lacks a way to automatically download TMAKE

"rxvt"  
        SITE has moved to sourceforge.
        -RXVT_SITE:=ftp://ftp.rxvt.org/pub/rxvt/
        +RXVT_SITE=

http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/rxvt
        Change extension from bz2 to gz
        Maybe use http://software.schmorp.de/pkg/rxvt-unicode.html
instead?
        Also available on http://freshmeat.net/projects/rxvt-unicode/



====================================================================== 

---------------------------------------------------------------------- 
 bjdooks - 08-02-06 09:33  
---------------------------------------------------------------------- 
The latest release has upgraded the dhcp to 3.0.4, and modified the
patch to ensure it applies to the new version. Tested on an Simtec
S3C2440 board with an Asix AX88796, and it seems to work fine. 

---------------------------------------------------------------------- 
 bernhardf - 01-19-07 10:08  
---------------------------------------------------------------------- 
Most if not all of these were updated meanwhile.
Thanks for the report! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-18-06 11:53  Ulf Samuelsson New Issue                                    
06-18-06 11:53  Ulf Samuelsson Status                   new => assigned     
06-18-06 11:53  Ulf Samuelsson Assigned To               => uClibc          
06-18-06 11:53  Ulf Samuelsson File Added: buildroot-20060608.patch             
      
08-02-06 09:33  bjdooks        Note Added: 0001556                          
08-02-06 09:35  bjdooks        Issue Monitored: bjdooks                     
08-09-06 21:45  futaris        Issue Monitored: futaris                     
09-14-06 10:28  Scott B        Issue Monitored: Scott B                     
01-19-07 10:08  bernhardf      Status                   assigned => closed  
01-19-07 10:08  bernhardf      Note Added: 0002006                          
01-19-07 10:08  bernhardf      Resolution               open => fixed       
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================
