From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 02 Sep 2014 11:25:44 +0200
Subject: [Buildroot] [PATCH 0 of 2] RedHat 5 support fixes
Message-ID: <patchbomb.1409649944@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This small patch series fixes two issues when using Buildroot on RedHat 5.
Granted, RedHat 5 is an old distribution, but in some corporate environments
it is still used. As the fixes are relatively small, I hope they can be
accepted.

The corresponding problems have been introduced somewhere between 2013.05
and 2014.05, and are still present on current master.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Thomas De Schampheleire (2)
  check-kernel-headers: mktemp --tmpdir not available on RedHat 5
  kmod: add patches to support build on Redhat 5

 package/kmod/kmod-0001-fix-O_CLOEXEC.patch                    |  38 ++++++
 package/kmod/kmod-0002-use-bswap-instead-of-htobe-betoh.patch |  41 +++++++
 support/scripts/check-kernel-headers.sh                       |   2 +-
 3 files changed, 80 insertions(+), 1 deletions(-)
