From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Thu, 20 Nov 2008 11:34:38 +0100
Subject: [Buildroot] how to setup a target prerequisite?
Message-ID: <e4c675870811200234w1721c5e1k5fc9d3c483e6885e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi to all,

 I have create a target/ugles for my porpoises which overwrite some
skeleton files.

 Unfortunately because alphabetical ordering target ugles happens to
be done AFTER ext2 file system generation. In fact, if I rename it as
000ugles it works properly.

 Is there any methods to tell make that ugles should happen before
doing another target? At this time I used this:

ifeq ($(strip $(BR2_TARGET_UGLES)),y)
TARGETS:=$(subst ext2root,ugles ext2root,$(TARGETS))
endif

-- 
/roberto
