From: Drew Cohan <drewcohan@gmail.com>
Date: Tue, 3 Apr 2007 15:06:11 -0400
Subject: [Buildroot] dhcp needs a version bump
Message-ID: <bf61e79a0704031206p522e4cffw75b7af84ebf48d72@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dhcp-3.0.4.tar.gz is 404.  A minor version bump fixes this.

wget --passive-ftp -P /home/myuser/buildroot/dl
ftp://ftp.isc.org/isc/dhcp/dhcp-3.0.4.tar.gz | tee outout.txt
--14:06:01--  ftp://ftp.isc.org/isc/dhcp/dhcp-3.0.4.tar.gz
           => `/home/myuser/buildroot/dl/dhcp-3.0.4.tar.gz'
Resolving ftp.isc.org... 204.152.184.110, 2001:4f8:0:2::18
Connecting to ftp.isc.org|204.152.184.110|:21... connected.
Logging in as anonymous ... Logged in!
==> SYST ... done.    ==> PWD ... done.
==> TYPE I ... done.  ==> CWD /isc/dhcp ... done.
==> PASV ... done.    ==> RETR dhcp-3.0.4.tar.gz ...
No such file `dhcp-3.0.4.tar.gz'.


Index: buildroot/package/dhcp/dhcp.mk
===================================================================
--- buildroot/package/dhcp/dhcp.mk    (revision 16609)
+++ buildroot/package/dhcp/dhcp.mk    (working copy)
@@ -3,7 +3,7 @@
 # dhcp
 #
 #############################################################
-DHCP_VER:=3.0.4
+DHCP_VER:=3.0.5
 DHCP_SOURCE:=dhcp-$(DHCP_VER).tar.gz
 DHCP_SITE:=ftp://ftp.isc.org/isc/dhcp
 DHCP_CAT:=$(ZCAT)

Thanks,

Drew
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070403/86e934da/attachment.htm 
