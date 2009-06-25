From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Jun 2009 17:12:48 +0200
Subject: [Buildroot] [git commit] Fix dropbear compilation with glibc
Message-ID: <20090701181741.A8329777FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b7d98b2d42e8a715230166367d8489b17fbc9498
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch is too large, so refusing to show it


The patch introduced at c579e32dbe6d927bdcfffeede18123aa92abbdd5 was
incorrect, since __USE_GNU is an internal C library defined, and
should not be used by programs. _GNU_SOURCE should be used instead.

This fixes a build failure on Dropbear when compiling against a
glibc-based toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../dropbear-fix-missing-TIMEVAL_TO_TIMESPEC.patch |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
