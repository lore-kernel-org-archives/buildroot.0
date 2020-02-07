From: unixmania at gmail.com <unixmania@gmail.com>
Date: Fri,  7 Feb 2020 19:33:20 -0300
Subject: [Buildroot] [PATCH v2 0/2] A better solution for the swapon/swapoff
 issue in inittag
Message-ID: <20200207223322.7182-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

The current solution adds target-finalize hooks to two packages and
defines the hook in system/system.mk. The hook code is more complex than
it needs to be.

This solution adds the hook to skeleton-init-sysv, only, and uses a
simpler logic.
---
CC: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
CC: Peter Korsgaard <peter@korsgaard.com>
---

Carlos Santos (2):
  Revert "system: don't attempt swapon/swapoff in inittab if not
    available"
  package/skeleton-init-sysv: conditionally enable swapon/swapoff in
    inittab

 package/busybox/busybox.mk                       |  1 -
 package/skeleton-init-sysv/skeleton-init-sysv.mk | 10 ++++++++++
 package/sysvinit/sysvinit.mk                     |  1 -
 system/system.mk                                 | 13 -------------
 4 files changed, 10 insertions(+), 15 deletions(-)

-- 
2.18.2
