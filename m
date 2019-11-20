From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 20 Nov 2019 15:19:11 +0000
Subject: [Buildroot] [Bug 12331] meson issue
In-Reply-To: <bug-12331-163@https.bugs.busybox.net/>
References: <bug-12331-163@https.bugs.busybox.net/>
Message-ID: <bug-12331-163-tkOWqWxfpF@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12331

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Yes, I also encountered this error. What I did so far to work around it is:

define HOST_MESON_FIXUP_SHEBANG
        $(SED) 's%^#!.*%#!/usr/bin/env python3%' $(HOST_DIR)/bin/meson
endef
HOST_MESON_POST_INSTALL_HOOKS += HOST_MESON_FIXUP_SHEBANG

in package/meson/meson.mk.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
