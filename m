From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 01 Nov 2013 17:06:45 +0100
Subject: [Buildroot] [PATCH 0 of 4] Add POST_RSYNC hook
Message-ID: <patchbomb.1383322005@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series adopts the POST_RSYNC hook patch by Tzu-Jung Lee and
changes the default rsync exclusion list, as discussed on the Buildroot
developer days.
The other rsync-related patch submitted by Tzu-Jung Lee (custom rsync
command) should not be needed anymore as its use case is covered by
the second patch in this series.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 Makefile                                  |  14 +++--
 docs/manual/adding-packages-autotools.txt |   3 +-
 docs/manual/adding-packages-cmake.txt     |   3 +-
 docs/manual/adding-packages-generic.txt   |  39 +-----------------
 docs/manual/adding-packages-hooks.txt     |  60 +++++++++++++++++++++++++++
 docs/manual/adding-packages.txt           |   2 +
 package/pkg-generic.mk                    |   4 +-
 7 files changed, 76 insertions(+), 49 deletions(-)
