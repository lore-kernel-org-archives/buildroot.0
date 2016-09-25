From: Cassiano Martin <cassiano@polaco.pro.br>
Date: Sun, 25 Sep 2016 13:53:05 -0300
Subject: [Buildroot] pppd breaks build without libutils
Message-ID: <CAOoxthNVzy2PCz1tsACpxdhaoVO=RZgQR-A1dMB2u0HA3yXPqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am generating a small firmware environment, and pppd breaks build process
if libutils is not included. I looked under its sources and its used to
wtmp logging.

diff -rupN pppd.b/pppd.mk pppd/pppd.mk
--- pppd.b/pppd.mk      2016-09-25 13:51:06.125430110 -0300
+++ pppd/pppd.mk        2016-09-19 13:48:11.223130150 -0300
@@ -45,6 +45,7 @@ PPPD_POST_EXTRACT_HOOKS += PPPD_SET_RESO

 define PPPD_CONFIGURE_CMDS
        $(SED) 's/FILTER=y/#FILTER=y/' $(PPPD_DIR)/pppd/Makefile.linux
+       $(SED) 's/USE_LIBUTIL=y/#USE_LIBUTIL=y/'
$(PPPD_DIR)/pppd/Makefile.linux
        $(SED) 's/ifneq ($$(wildcard \/usr\/include\/pcap-bpf.h),)/ifdef
FILTER/' $(PPPD_DIR)/*/Makefile.linux
        ( cd $(@D); ./configure --prefix=/usr )
 endef

[]'s
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160925/cf6fad79/attachment.html>
