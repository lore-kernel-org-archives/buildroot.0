From: John Voltz <john.voltz@gmail.com>
Date: Wed, 30 Apr 2008 15:09:15 -0400
Subject: [Buildroot] fixing libtool in buildroot
In-Reply-To: <46a136670804301207h74ed82cesf54bfd604795fabb@mail.gmail.com>
References: <46a136670804300814n1fb0bb1bi796d5e1db3a82134@mail.gmail.com>
	<87a5b0800804300818w26275393x8eb43fbdec13c1e4@mail.gmail.com>
	<46a136670804300825i60392054g3f1b191afef5ce95@mail.gmail.com>
	<46a136670804300914o6419f372yd25ac44dc475fdb6@mail.gmail.com>
	<46a136670804301207h74ed82cesf54bfd604795fabb@mail.gmail.com>
Message-ID: <46a136670804301209y221896e1ic5c0f313f1d828ba@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Try again:

# Configuring
$(BUILD_DIR)/%/.stamp_configured:
    $(call MESSAGE,"Configuring")
    $(Q)if test "$($(PKG)_AUTORECONF)" = "YES"; then \
        cd $(@D)/$($(PKG)_SUBDIR) && $(AUTORECONF); \
        for i in `find $(@D)/$($(PKG)_SUBDIR) -name ltmain.sh`; do \
            ../../toolchain/patch-kernel.sh $${i%/*} ../../package
buildroot-libtool.patch; \
        done \
    fi
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080430/b0259b36/attachment.htm 
