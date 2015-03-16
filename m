From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 22:10:23 +0100
Subject: [Buildroot] [git commit] gdb: fix target gdb building from git
Message-ID: <20150316212645.D085C817DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=155a474f993b207594b0c66f80910d280b609866
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently we only add "host-texinfo" dependency for host GDB built
from git sources. But in case of target gdb texinfo won't be built
and so gdb building will fail on attempt to build documentation.

Fix is trivial - add "host-texinfo" as a dependency for target gdb
in the sme way as we disable documentation building via both
GDB_CONF_ENV (for target) and HOST_GDB_CONF_ENV (host) GDB flavors.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 6a192fb..58f0631 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -151,6 +151,7 @@ else
 endif
 
 ifeq ($(GDB_FROM_GIT),y)
+GDB_DEPENDENCIES += host-texinfo
 HOST_GDB_DEPENDENCIES += host-texinfo
 else
 # don't generate documentation
