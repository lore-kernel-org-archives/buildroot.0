From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Oct 2014 22:49:59 +0100
Subject: [Buildroot] [git commit] mongrel2: Add comments to avoid use of
	github call
Message-ID: <20141030215056.61B37B213F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=502a08b681c9cc96603e5de6e22bfa892f078c03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As the comment says, we don't want to uses the github helper, as we
would end up with a generated tarball, which is not the same one as the
one linked with the releases.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mongrel2/mongrel2.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/mongrel2/mongrel2.mk b/package/mongrel2/mongrel2.mk
index 14e3a80..23cec50 100644
--- a/package/mongrel2/mongrel2.mk
+++ b/package/mongrel2/mongrel2.mk
@@ -5,6 +5,8 @@
 ################################################################################
 
 MONGREL2_VERSION = v1.9.1
+# Do not use the github helper here, the generated tarball is *NOT* the same
+# as the one uploaded by upstream for the release.
 MONGREL2_SITE = https://github.com/zedshaw/mongrel2/releases/download/$(MONGREL2_VERSION)
 MONGREL2_LICENSE = BSD-3c
 MONGREL2_LICENSE_FILES = LICENSE
