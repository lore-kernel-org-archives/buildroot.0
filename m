From: Patryk Benderz <Patryk.Benderz@esp.pl>
Date: Tue, 12 Apr 2011 19:41:40 +0200
Subject: [Buildroot] Xorg via (unichrome) binary driver
Message-ID: <1302630100.3538.45.camel@esp-patben-lin.espdx1.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,
I need to run dual head VIA VT8623 [Apollo CLE266] GPU. According to
[1] (bottom of page), currently dual head is unsupported by openchrome
driver. So I tried to manually copy VIA's binary driver
(5.74.33.86a-u904-50937) files to appropriate  locations in target
directory, the same way as VIA's install script does on running host.
Lets assume I have copied all files correctly.
	There are two commands in install script, which i do not know how to
emulate:
1. After "#install the 3D driver" step, installer does:
# ldconfig -X
2. After "#install the DRM module" step, installer does:
# depmod -a
	So my questions are:
1. Should I run this commands on target directory before build? How to
do it?
2. When I try to run X I get:
(EE) Failed to load /usr/lib/xorg/modules/drivers/via_drv.so ,
(EE) Failed to load module "via" (loader failed, 7)
however ls gives:
# la /usr/lib/xorg/modules/drivers/
[...]
-rwxr-xr-x 1 root root 709657 [...] openchrome_drv.so
-rwxr-xr-x 1 root root 709657 [...] via_drv.so

[1] http://www.openchrome.org/trac/wiki/Configuration

-- 
Patryk "LeadMan" Benderz
Linux Registered User #377521
()  ascii ribbon campaign - against html e-mail 
/\  www.asciiribbon.org   - against proprietary attachments
