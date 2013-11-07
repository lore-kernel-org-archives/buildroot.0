From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 07 Nov 2013 17:26:50 +0100
Subject: [Buildroot] [PATCH 0 of 3] infra: misc. changes related to
	pkgparentdir
Message-ID: <patchbomb.1383841610@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series was driven by the observation that the 'Patching' message
contained a double slash which annoyed me:

>>> host-lzop 1.03 Patching package//lzop

While fixing this (pkgparentdir change), I bumped into FOO_DIR_PREFIX which
had an incorrect default, and the realization that the Patching message
didn't really need that directory anyway.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/pkg-generic.mk |  6 +++---
 package/pkg-utils.mk   |  2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
