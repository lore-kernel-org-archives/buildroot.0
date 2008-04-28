From: John Voltz <john.voltz@gmail.com>
Date: Mon, 28 Apr 2008 13:05:33 -0400
Subject: [Buildroot] question about make
Message-ID: <46a136670804281005t11bcda79mb985e6b78b25e717@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm hoping someone can help me figure out the best way to fix the buildroot
makefiles for the festival voices and lexicons, right now make doesn't check
to see if you have already downloaded the tarball before it does it again.
What's the easiest way to check for the existence of a file with make?

This is the very simplistic method that is currently used for grabbing the
lexicons:

$(FESTLEX_STATUS_DIR)/.downloaded:
    mkdir -p $(FESTLEX_STATUS_DIR)
ifeq ($(BR2_PACKAGE_FESTLEX_CMU),y)
    $(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(LEX1)
endif
ifeq ($(BR2_PACKAGE_FESTLEX_OALD),y)
    $(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(LEX2)
endif
ifeq ($(BR2_PACKAGE_FESTLEX_POS),y)
    $(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(LEX3)
endif
    touch $@
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080428/53688978/attachment.htm 
