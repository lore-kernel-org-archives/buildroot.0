From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Apr 2015 00:08:33 +0200
Subject: [Buildroot] [PATCH v7 0/8] toolchain: better handle hashes (branch
	yem/dl-hash-toolchains)
Message-ID: <1429740521-31943-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series makes it so we can download custom external toolchains, and
still have mandatory checks of hashes.

It also adds the long-awaited-for hashes for gcc and binutils.

Changes v6 -> v7:
  - Minor fixes in commit messages (Arnout)
  - Add Acks where appropriate (Arnout, Yann)
  - Beautify the pattern in the check-hash script (Yann)

Changes v5 -> v6:
  - Add patch 4/4 (uclibc: update hash for arc) (Arnout)
  - Fix check-hash script so the pattern actually works (Arnout)

Changes v4 -> v5:
  - drop patch #8, that errored-out when an excluded file did have
    one or more associated hashes  (Arnout)
  - typoes  (Arnout)

Changes v3 -> v4:
  - add missing fake-hash for uClibc eXtensa git snapshot; add uClibc
    daily snapshots to exclusion list  (Arnout)
  - drop using a magic value; use a list of excluded files  (Arnout)

Changes v2 -> v3:
  - add hashes for gcc and binutils
  - fix a few more typoes

Changes v1 -> v2:
  - fix a few typoes


Regards,
Yann E. MORIN.
----------------------------------------------------------------
Arnout Vandecappelle (1):
      uclibc: update hash for arc

Yann E. MORIN (7):
      package/gcc: add hashes
      package/binutils: add hashes
      package/uclibc: add missing hash for eXtensa
      support/download: add possibility to not fail on missing hash
      toolchain/external: ignore missing hash for custom downloaded toolchain
      package/uclibc: ignore missing hash for snapshots
      support/download: restore mandatory check of hashes

 package/binutils/binutils.hash                     |  7 +++++++
 package/gcc/gcc-final/gcc-final.hash               |  1 +
 package/gcc/gcc-initial/gcc-initial.hash           |  1 +
 package/gcc/gcc.hash                               | 10 ++++++++++
 package/pkg-download.mk                            |  3 +++
 package/uclibc/uclibc.hash                         |  9 ++++++---
 package/uclibc/uclibc.mk                           |  1 +
 support/download/check-hash                        |  8 +++++++-
 toolchain/toolchain-external/toolchain-external.mk |  2 ++
 9 files changed, 38 insertions(+), 4 deletions(-)
