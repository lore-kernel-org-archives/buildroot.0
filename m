From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 23:06:16 +0200
Subject: [Buildroot] [git commit master 1/1] binutils,
	gcc: use correct --prefix
Message-ID: <20100727210656.9ED1E835A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2ae84ac85ff72a861e8c276ba4e650e1e9ba7982
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The cross binutils and cross gcc are actually going to be executed
from $(STAGING_DIR)/usr, so the correct prefix is $(STAGING_DIR)/usr
and not /usr.

This also fixes what is known as the "AVR32 toolchain build failure",
which was due to the fact that the prefix directory wasn't writable
(since it was /usr).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Patch is too large, so refusing to show it
