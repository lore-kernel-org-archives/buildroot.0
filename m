From: Arndt Kritzner <kritzner@logicway.de>
Date: Thu, 27 Mar 2008 10:52:23 +0100
Subject: [Buildroot] make clean problem and patch
Message-ID: <47EB6E57.4080101@logicway.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"make clean" fails after incomplete build attempts because of missing
files or directories. The attached patch precedes the clean actions with
a "-" to ignore these errors. With atstk1002_defconfig the packages
avahi, dropbear, file, lzo, ncftp and strace caused this sort of aborts.
The attached patch concerns these packages.
-- 

--
###############################################################
Dipl. Ing Arndt Kritzner    Tel:    (0385) 3993 448
Logic Way GmbH              Fax:    (0385) 3993 458
Hagenower Strasse 73        HTTP:   http://www.logicway.de
19061 Schwerin              email:  mailto:kritzner at logicway.de
###############################################################
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-make_clean.diff
Type: text/x-patch
Size: 2330 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080327/2d3fbc8a/attachment-0001.bin 
