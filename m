From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 25 Oct 2011 09:29:37 +0200
Subject: [Buildroot] Configuring QMake project issue
Message-ID: <4EA66561.3000002@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I followed your instructions on how to integrate own small project into BR. This is Qt project based on a *.pro file. My *.mk looks like this:

VSGUITEST_VERSION = 1.0
VSGUITEST_SITE_METHOD = local

define VSGUITEST_EXTRACT_CMDS
        cp -a $(TOPDIR)/package/vscom/vsguitest/src/* $(@D)/
endef

define VSGUITEST_CONFIGURE_CMDS
        $(QT_QMAKE) $(@D)/vsguitest.pro
endef

define VSGUITEST_BUILD_CMDS
        $(MAKE) -C $(@D) all
endef

$(eval $(call GENTARGETS))

The vsguitest.pro looks like this:


HEADERS             = \
    vstestgui.h \
    vsserialtest.h \
    vsnetworktest.h
SOURCES             = main.cpp \
    vstestgui.cpp \
    vsserialtest.cpp \
    vsnetworktest.cpp

LIBS += -lSerialPort -lQtNetwork

My problem is, that after source code copy qmake generates Makefile directly in BR's root and overwrites the main Makefile. With QSerialDevice I haven't experienced such problems. What can I do about this?

Regards,
Yegor 

P.S. what about adding QMake project type in addition to CMake type?
