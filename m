From: Abhishek Ashtekar <Abhishek.Ashtekar@ubitronix.com>
Date: Thu, 11 Nov 2010 12:18:39 +0100
Subject: [Buildroot] Makefile for user applications
Message-ID: <0C11C5BF0B29FD43A8D0250F711D497F7F6CC9DB5A@ex01-ubitronix.ubitronix.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,



I would like to add a precompiled/built application to the Linux 2.6.34.1 running on the at91sam9260ek board.

I have done the following steps

i)  Add  to /package   /package/myapp

ii)  introduce Config.in and myapp.mk and the application binary to the folder

iii) added   "source /package/ myapp/ Config.in"  line to the /package/Config.in and also select it through menuconfig



 Questions:-



 Actually I just want the makefile to copy the binary from the package to /targert/usr/bin

 However it goes to download myapp 1.0 Downloading ....... To a sourceforge.net  link and stops.

 What exactly do I need to mention in the make file ?



 Pasted below ....



#############################################################

 #

 # myapp

 #

 #############################################################

 MYAPP_VERSION = 1.0

 MYAPP _BINARY = myapp

 MYAPP _TARGET_BINARY =usr/bin/myapp



 MYAPP_INSTALL_TARGET = YES



 define MYAPP_INSTALL_TARGET_CMDS

            $(INSTALL) -D package/myapp/myapp  $(TARGET_DIR)/usr/bin/

 endef



 define MYAPP_CLEAN_CMDS

            $(MAKE) -C $(@D) clean

            rm -f $(TARGET_DIR)/usr/bin

 endef



 $(eval $(call GENTARGETS,package,myapp))

 #############################################################



Thanks a lot.



Regards,

Abhi









__________ Hinweis von ESET NOD32 Antivirus, Signaturdatenbank-Version 5609 (20101111) __________

E-Mail wurde gepr?ft mit ESET NOD32 Antivirus.

http://www.eset.com



__________ Hinweis von ESET NOD32 Antivirus, Signaturdatenbank-Version 5610 (20101111) __________

E-Mail wurde gepr?ft mit ESET NOD32 Antivirus.

http://www.eset.com

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101111/a0df8aa0/attachment.html>
