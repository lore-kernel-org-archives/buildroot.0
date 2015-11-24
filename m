From: Peter Rosin <peda@lysator.liu.se>
Date: Tue, 24 Nov 2015 22:45:51 +0100
Subject: [Buildroot] [PATCH v2 0/2] bump libtirpc to 1.0.1
Message-ID: <1448401554-16331-1-git-send-email-peda@lysator.liu.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Peter Rosin <peda@axentia.se>

Hi!

I'd like to bump libtirpc to 1.0.1. However there is an api incompatibility
introduced in 0.3.2 which requires a patch to rpcbind, which I took from
upstream. The rpcbind patch make rpcbind work with either tirpc 0.3.2 or
1.0.1, so I added that patch first in the series even if it might seem
backwards.

Note that I have not tested the rpcbind patch with more than a compile
test. I know nothing about rpcbind.

That also goes for the changes to libtirpc patch 0007-Disable-DES-..., which
removes DES support, since apparently musl and uclibc do not provide DES. I
know nothing about musl and uclibc and have not tested if there are more
newfangled DES things that needs to be removed...

Fixups since v1:

- Removed execute bit on one of the patches.
- Thomas found one more newfangled DES thing to remove in patch 0007.
- Rebased to the next branch.

Cheers,
Peter

Peter Rosin (2):
  rpcbind: backport adjustment to changes in libtirpc 1.0.1
  libtirpc: bump to version 1.0.1

 ...able-parts-of-TIRPC-requiring-NIS-support.patch |   14 +--
 ...0007-Disable-DES-authentification-support.patch |   93 +++++++++++++++++---
 ...d-missing-rwlock_unlocks-in-xprt_register.patch |   63 +++++++++++++
 package/libtirpc/libtirpc.hash                     |    4 +-
 package/libtirpc/libtirpc.mk                       |    2 +-
 ...ly-Don-t-use-the-xp_auth-pointer-directly.patch |   42 +++++++++
 6 files changed, 199 insertions(+), 19 deletions(-)
 create mode 100644 package/libtirpc/0008-Add-missing-rwlock_unlocks-in-xprt_register.patch
 create mode 100644 package/rpcbind/0002-handle_reply-Don-t-use-the-xp_auth-pointer-directly.patch

-- 
1.7.10.4
