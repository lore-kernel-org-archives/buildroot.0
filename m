From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  1 Feb 2014 08:50:14 +0000 (UTC)
Subject: [Buildroot] [Bug 6830] Qt5: no fonts are installed
In-Reply-To: <bug-6830-163@https.bugs.busybox.net/>
References: <bug-6830-163@https.bugs.busybox.net/>
Message-ID: <20140201085014.6062A9C727@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6830

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-02-01 08:50:14 UTC ---
Interesting. We do have some code that should install fonts to the target
directory, when Qt has installed them to the staging directory. From
qt5base.mk:

define QT5BASE_INSTALL_TARGET_FONTS
        if [ -d $(STAGING_DIR)/usr/lib/fonts/ ] ; then \
                mkdir -p $(TARGET_DIR)/usr/lib/fonts ; \
                cp -dpfr $(STAGING_DIR)/usr/lib/fonts/*
$(TARGET_DIR)/usr/lib/fonts ; \
        fi
endef

So maybe the specific configuration you're using does not install fonts to the
staging directory.

Can you post your Buildroot .config file?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
