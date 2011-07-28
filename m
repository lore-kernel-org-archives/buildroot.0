From: Tilman Glotzner <tilmanglotzner@hotmail.com>
Date: Thu, 28 Jul 2011 22:41:13 +0000
Subject: [Buildroot] adding nut to buildroot
Message-ID: <BAY160-W42BE42946C7EB9032C7376CF340@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello 
 
I try to add nut to a buildroot distribution. It downloads, compiles, and builds. The executables installed in the image are prefixed by the cross compiler, e.g. apcsmart becomes arm-linux-apcsmart (in the image as well as in output/target/usr/bin). How can I avoid this ?
 
In /buildroot/package/nut, I added 2 files:
 
Config.in
========
config BR2_PACKAGE_NUT
        bool "nut"
        help
          The primary goal of the Network UPS Tools (NUT) project is to provide           support for Power Devices, such as Uninterruptible Power Supplies,
          Power Distribution Units and Solar Controllers.
          http://www.networkupstools.org
 
 
 
nut.mk
=====
 
#############################################################
#
# nut
#
#############################################################
NUT_VERSION = 2.6.1
NUT_SOURCE = nut-$(NUT_VERSION).tar.gz
NUT_SITE = http://www.networkupstools.org/source/2.6/
NUT_INSTALL_STAGING = NO
NUT_INSTALL_TARGET = YES
NUT_LIBTOOL_PATCH = NO
 
$(eval $(call AUTOTARGETS,package,nut))
 
Can you kindly advise how to debug or fix it ?
 
Thanks
Tilman

 
 
 
  		 	   		  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110728/7706b63f/attachment.html>
