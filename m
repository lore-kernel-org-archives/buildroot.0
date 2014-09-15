From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Sep 2014 22:50:02 +0200
Subject: [Buildroot] [PATCH 0/8] gdb updates
Message-ID: <1410814210-10002-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here are a bunch of gdb updates:

 * Addition of version 7.8, switch to 7.7 as the default one, removal
   of version 7.6.

 * Addition of the missing host-ncurses dependency to host-gdb.

 * Addition of TUI support for the target gdb (patch from Vincent
   Stehl?).

 * Addition of Python support for the host and target gdb.

Best regards,

Thomas

Thomas Petazzoni (7):
  gdb: add version 7.8
  gdb: switch to 7.7 as the default version
  gdb: remove version 7.6
  gdb: needs host-ncurses on the host
  gdb: reword prompt for host TUI option
  gdb: add support for Python in host gdb
  gdb: add support for Python in target gdb

Vincent Stehl? (1):
  gdb: enable tui support for target package

 package/gdb/Config.in         | 23 +++++++++++++++++++++++
 package/gdb/Config.in.host    | 21 ++++++++++++---------
 package/gdb/gdb-python-config | 36 ++++++++++++++++++++++++++++++++++++
 package/gdb/gdb.mk            | 31 +++++++++++++++++++++++++++----
 4 files changed, 98 insertions(+), 13 deletions(-)
 create mode 100755 package/gdb/gdb-python-config

-- 
2.0.0
