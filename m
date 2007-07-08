From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 8 Jul 2007 09:08:49 -0700
Subject: [Buildroot] [buildroot 0001424]: lighttpd: buildroot wants
	debian/init.d which no longer exists
Message-ID: <91b448bac36daef2629ace1e6dd4d146@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
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
Status:                     assigned
====================================================================== 
Date Submitted:             07-08-2007 09:08 PDT
Last Modified:              07-08-2007 09:08 PDT
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

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-08-07 09:08  vogelchr       New Issue                                    
07-08-07 09:08  vogelchr       Status                   new => assigned     
07-08-07 09:08  vogelchr       Assigned To               => buildroot       
======================================================================
