From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 23 Apr 2017 00:49:12 +0200
Subject: [Buildroot] [PATCH v9 0/7] e2fsprogs: refactor to fix conflicts
	with busybox and util-linux
Message-ID: <20170422224919.3257-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 This is v9 of the large patch sent previously by Carlos Santos, split
up into smaller bits for each individual change. Compared to v8, it is
split up a little less heavily: Thomas found out that it is not possible
to let the e2fsprogs build system create the symlinks while Buildroot is
still removing e2fsck and mke2fs.

 Regards,
 Arnout

---
Carlos Santos (7):
  e2fsprogs: refactor to fix conflicts with busybox and util-linux
  e2fsprogs: add help text for all config options
  e2fsprogs: disable unneeded features for host
  e2fsprogs: add explicit --enable/--disable configure options
  e2fsprogs: avoid conflict with util-linux fsck wrapper
  e2fsprogs: only add -lintl for static builds
  e2fsprogs: add empty lines to .mk file

 package/e2fsprogs/Config.in    |  74 ++++++++------------------
 package/e2fsprogs/e2fsprogs.mk | 118 +++++++++--------------------------------
 2 files changed, 46 insertions(+), 146 deletions(-)
