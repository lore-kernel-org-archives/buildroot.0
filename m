From: Dittmann, Daniel <ddittmann@gmx.net>
Date: Wed, 26 Mar 2008 18:59:33 +0100
Subject: [Buildroot] using of local dir
Message-ID: <47EA8F05.8090102@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

in buildroot Makefile this includes the board specific config
file from the local dir.

-include $(TOPDIR)/local/$(BOARD)/$(BOARD).config

Some lines later the LOCAL variable will be set:

ifneq ($(BUILDROOT_LOCAL),)
LOCAL:=$(BUILDROOT_LOCAL)
else
LOCAL:=local
endif


I think the LOCAL variable must be initialized before the include
command and it have to use the LOCAL variable.

Is this correct?

Thanks,

Daniel
