From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 24 Apr 2008 22:47:03 -0700
Subject: [Buildroot] [buildroot 0002974]: package lighttpd source fails
Message-ID: <a2fbb4331a54e1d94f1b918bb445e150@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2974 
====================================================================== 
Reported By:                Jean-Baptiste Maillet
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2974
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-20-2008 04:32 PDT
Last Modified:              04-24-2008 22:47 PDT
====================================================================== 
Summary:                    package lighttpd source fails
Description: 
$ make lighttpd
wget --passive-ftp -nd  -P /var/p2p/jbm/sandbox/buildroot/../download
"http://ftp.debian.org"/debian/pool/main/l/lighttpd/lighttpd_1.4.18.orig.tar.gz
--2008-04-20 13:25:21-- 
http://ftp.debian.org/debian/pool/main/l/lighttpd/lighttpd_1.4.18.orig.tar.gz
Resolving ftp.debian.org... 128.101.240.212
Connecting to ftp.debian.org|128.101.240.212|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2008-04-20 13:25:21 ERROR 404: Not Found.

make: ***
[/var/p2p/jbm/sandbox/buildroot/../download/lighttpd_1.4.18.orig.tar.gz]
Error 1

====================================================================== 

---------------------------------------------------------------------- 
 Jean-Baptiste Maillet - 04-24-08 22:47  
---------------------------------------------------------------------- 
lighttpd has been updated at r21835 (not the attached patch fix), but still
does not build, missing dep/select or config option.

jbm at polux:/var/p2p/jbm/sandbox/buildroot$ svn up
...
D    package/lighttpd/rc.lighttpd
A    package/lighttpd/lighttpd-1.4.19-configure.patch
C    package/lighttpd/lighttpd.mk
C    package/lighttpd/Config.in
...
jbm at polux:/var/p2p/jbm/sandbox/buildroot$ rm -rf package/lighttpd
jbm at polux:/var/p2p/jbm/sandbox/buildroot$ svn up
A    package/lighttpd
A    package/lighttpd/lighttpd-1.4.19-configure.patch
A    package/lighttpd/lighttpd.mk
A    package/lighttpd/Config.in
Updated to revision 21853.
jbm at polux:/var/p2p/jbm/sandbox/buildroot$ make  lighttpd

>>> lighttpd 1.4.19 Downloading

--2008-04-25 07:31:00-- 
http://www.lighttpd.net/download/lighttpd-1.4.19.tar.bz2
...
checking for OpenSSL... no
checking for perl regular expressions support... no
checking for zlib support... yes
checking for deflate in -lz... no
configure: error: zlib-headers and/or libs where not found, install them
or build with --without-zlib
make: ***
[/var/p2p/jbm/sandbox/buildroot/build_arm/lighttpd-1.4.19/.stamp_configured]
Error 1 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-20-08 04:32  Jean-Baptiste MailletNew Issue                                  
 
04-20-08 04:32  Jean-Baptiste MailletStatus                   new => assigned   
 
04-20-08 04:32  Jean-Baptiste MailletAssigned To               => buildroot     
 
04-20-08 04:32  Jean-Baptiste MailletFile Added: lighttpd.patch                 
  
04-24-08 22:47  Jean-Baptiste MailletNote Added: 0007124                        
 
======================================================================
