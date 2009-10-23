From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 23 Oct 2009 15:15:44 +0200
Subject: [Buildroot] Autoconf still not building (M4 )
Message-ID: <131BA3469857423890A1E94BFB0402F7@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
i discovered 2 things : 
 
1) when changing the autoconf.mk to use version 2.63 instead of 2.64 then
everything builds .
 
 
2) when using the 2.64 version results in the error 
 
 
running configure with : --prefix=/home/johan/buildroot/output/host/usr
--sysconfdir=/home/johan/buildroot/output/host/etc
....
checking whether directories can have trailing spaces... yes
checking for expr... /usr/bin/expr
checking for GNU M4 that supports accurate traces... configure: error: no
acceptable m4 could be found in $PATH.
GNU M4 1.4.6 or later is required; 1.4.13 is recommended
....
 
BUT  
when creating and running a shell script containing 
 
#!/bin/sh
HOST_DIR=/home/johan/buildroot/output/host
echo running configure with : --prefix="$HOST_DIR/usr"
--sysconfdir="$HOST_DIR/etc"
./configure  --prefix="$HOST_DIR/usr" --sysconfdir="$HOST_DIR/etc"

produces :
 
running configure with : --prefix=/home/johan/buildroot/output/host/usr
--sysconfdir=/home/johan/buildroot/output/host/etc

checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... no
checking for mawk... mawk
checking whether make sets $(MAKE)... yes
checking whether /bin/sh -n is known to work... no
checking for characters that cannot appear in file names... none
checking whether directories can have trailing spaces... yes
checking for expr... /usr/bin/expr
checking for GNU M4 that supports accurate traces... /usr/bin/m4
checking whether /usr/bin/m4 accepts --gnu... yes
checking how m4 supports trace files... --debugfile
checking for perl... /usr/bin/perl
checking for emacs... no
...
 
Why is behaves this this differently ?
 
 
 
 
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091023/4face466/attachment.htm>
