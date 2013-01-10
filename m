From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Thu, 10 Jan 2013 18:58:00 +0000
Subject: [Buildroot] pkg-generic.mk question
Message-ID: <F9C551623D2CBB4C9488801D14F864C610B9E3A3@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

Consider the following (from pkg-generic.mk):

define inner-generic-package

<snip>

$(2)_TYPE                       =  $(5)

<snip>

$(2)_DIR        =  $$(BUILD_DIR)/$$($(2)_BASE_NAME)


The <PKG>_TYPE is set to "$" (5), however, the <PKG>_DIR is set to
"$$" (BUILD_DIR)/$$<the rest>.  My question is why the need for the $$
for BUILD_DIR?  I THINK I understand the reason for the
$$($(2)_BASE_NAME):  The eval will boil this down to $(<PKG>_BASE_NAME),
which will the get POST interrupted AFTER <PKG>_BASE_NAME is assigned
LATER, right?

But, I'm confused as to the reason for the $$(BUILD_DIR).  It is
assigned well before the reading of this file and is essentially a
static variable.

NOTE:  This question is for my own edification and learning.  I'm not
questioning the ability/logic of this Makefile as I know it works
perfectly.  I'm attempting to do something similar in a Makefile of my
own.

Thanks in advance for the information!

Andy
