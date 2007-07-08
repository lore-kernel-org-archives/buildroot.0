From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 8 Jul 2007 11:15:34 -0700
Subject: [Buildroot] [buildroot 0001424]: lighttpd: buildroot wants
	debian/init.d which no longer exists
Message-ID: <b926d9a0556f4569585f311f09007f6b@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1424 
====================================================================== 
Reported By:                vogelchr
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1424
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             07-08-2007 09:08 PDT
Last Modified:              07-08-2007 11:15 PDT
====================================================================== 
Summary:                    lighttpd: buildroot wants debian/init.d which no
longer exists
Description: 
When building the lighttpd package the build script wants to install the
file $(LIGHTTPD_DIR)/debian/init.d which no longer is in the lighttpd
tarball.

atrocity buildroot $ tar tzf dl/lighttpd-1.4.13.tar.gz | grep debian
 ---> there is nothing named debian in the tarball

in package/lighttpd/lighttpd.mk:

$(TARGET_DIR)/$(LIGHTTPD_TARGET_BINARY):
$(LIGHTTPD_DIR)/$(LIGHTTPD_BINARY)
        $(MAKE) DESTDIR=$(TARGET_DIR) -C $(LIGHTTPD_DIR) install
        $(INSTALL) -m 0755 -D $(LIGHTTPD_DIR)/debian/init.d
$(TARGET_DIR)/etc/init.d/S99lighttpd

Make aborts on this rule:

make[1]: Leaving directory
`/home/chris/buildroot/build_i586/lighttpd-1.4.13'
/usr/bin/install -m 0755 -D
/home/chris/buildroot/build_i586/lighttpd-1.4.13/debia
n/init.d /home/chris/buildroot/build_i586/root/etc/init.d/S99lighttpd
/usr/bin/install: cannot stat
/home/chris/buildroot/build_i586/lighttpd-1.4.13/debian/init.d': No such
file or directory


======================================================================
Relationships       ID      Summary
----------------------------------------------------------------------
related to          0001206 lighttpd version incorrect in lighttpd.mk
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 07-08-07 11:15  
---------------------------------------------------------------------- 
Should be fixed in r19041. Thanks for mentioning this 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-08-07 09:08  vogelchr       New Issue                                    
07-08-07 09:08  vogelchr       Status                   new => assigned     
07-08-07 09:08  vogelchr       Assigned To               => buildroot       
07-08-07 09:40  bernhardf      Relationship added       related to 0001206  
07-08-07 11:15  bernhardf      Status                   assigned => closed  
07-08-07 11:15  bernhardf      Note Added: 0002577                          
======================================================================
