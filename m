From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 16 Aug 2007 01:24:11 +0200
Subject: [Buildroot] Allowing hotplug and udev in the same root fs???
Message-ID: <1187220251.2429.2.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Does it make sense to allow both Hotplug and udev?
Is it not so that you either have hotplug (real old...) or udev?

The following then would make sense.

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Index: package/hotplug/Config.in
===================================================================
--- package/hotplug/Config.in   (revision 19502)
+++ package/hotplug/Config.in   (arbetskopia)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOTPLUG
        bool "hotplug"
        default n
+       depends on !BR2_PACKAGE_UDEV
        help
          Plug in new devices and use them immediately.
 
-------------------------------------------------------------------

Comments ?

BR
Ulf Samuelsson
