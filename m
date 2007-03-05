From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 5 Mar 2007 03:09:15 -0800
Subject: [Buildroot] [buildroot 0001241]: fakeroot download fails
Message-ID: <8461954150ef50178e87462bd525c0ae@buildroot.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1241 
====================================================================== 
Reported By:                amckinle
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1241
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             02-28-2007 05:18 PST
Last Modified:              03-05-2007 03:09 PST
====================================================================== 
Summary:                    fakeroot download fails
Description: 
wget --passive-ftp -P /home/austin/src/buildroot/dl
http://ftp.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.5.12.tar.gz
--08:14:55-- 
http://ftp.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.5.12.tar.gz
           => `/home/austin/src/buildroot/dl/fakeroot_1.5.12.tar.gz'
Resolving ftp.debian.org... 128.101.240.212
Connecting to ftp.debian.org|128.101.240.212|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
08:14:55 ERROR 404: Not Found.

make: *** [/home/austin/src/buildroot/dl/fakeroot_1.5.12.tar.gz] Error 1
austin at eve:~/src/buildroot$ svn update
At revision 17982.

====================================================================== 

---------------------------------------------------------------------- 
 bifferos - 03-01-07 14:56  
---------------------------------------------------------------------- 
http://ftp.br.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.5.12.tar.gz
[^]

Now it seems the br link doesn't work either.  Perhaps the brazilian
mirror kept a copy for a short time before getting 'updated'. 

---------------------------------------------------------------------- 
 bifferos - 03-01-07 15:14  
---------------------------------------------------------------------- 
SVN Revision 17476 upped the fakeroot version from 1.5.8 -> 1.5.12

It seems to be OK to simply change the version number in
buildroot/package/fakeroot/fakeroot.mk from 1.5.12 to 1.5.10.  That will
at least compile.  I don't know anything about fakeroot, so no idea if it
works properly like this though. 

---------------------------------------------------------------------- 
 jacmet - 03-05-07 03:09  
---------------------------------------------------------------------- 
Fixed in r18007. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-28-07 05:18  amckinle       New Issue                                    
02-28-07 05:18  amckinle       Status                   new => assigned     
02-28-07 05:18  amckinle       Assigned To               => buildroot       
02-28-07 05:18  amckinle       File Added: Config.in                        
03-01-07 14:56  bifferos       Note Added: 0002192                          
03-01-07 15:14  bifferos       Note Added: 0002193                          
03-05-07 03:09  jacmet         Status                   assigned => closed  
03-05-07 03:09  jacmet         Note Added: 0002204                          
======================================================================
