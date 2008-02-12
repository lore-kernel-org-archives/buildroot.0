From: John Voltz <john.voltz@gmail.com>
Date: Mon, 11 Feb 2008 20:53:38 -0500
Subject: [Buildroot] Libtool relinking problem
Message-ID: <46a136670802111753w4b6a7fbar93030a13b101eb28@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm wondering if anyone else has noticed problems when installing some
libraries to the staging_dir, sometimes libtool will place a  random
dependency reference as /usr/lib/xxx.la instead of
$(STAGING_DIR)/usr/lib/xxx.la.

This appears to be caused by the libtool re-linking during install.
Anybody know what to do to fix this? I tried adding
LDFLAGS="-L$(STAGING_DIR)/usr/lib" to make install, but it didn't
help.

Thanks,

John Voltz
