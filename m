From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 23:16:42 +0200
Subject: [Buildroot] [git commit] rauc: add missing dependencies for host
	variant
Message-ID: <20170702212420.2AF4A81D8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c7966d22e53ac83f2d8fe41b1a04c3f598502f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rauc unconditionally needs OpenSSL and libglib2. Those dependencies
were properly accounted for the target variant, but not the host
variant, causing build failures. This commit adds the missing
dependencies.

Fixes:

  http://autobuild.buildroot.net/results/2695202ee3b0734430abc2db03828a45cd5e5ef5
  (host-openssl missing)

  http://autobuild.buildroot.net/results/77a5db1120bf90ccaac00cfc0a8db358cacd894c
  (host-libglib2 missing)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rauc/rauc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 12819d9..479a583 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -29,7 +29,7 @@ ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 RAUC_DEPENDENCIES += systemd
 endif
 
-HOST_RAUC_DEPENDENCIES = host-pkgconf
+HOST_RAUC_DEPENDENCIES = host-pkgconf host-openssl host-libglib2
 HOST_RAUC_CONF_OPTS += --disable-network --disable-json --disable-service
 
 $(eval $(autotools-package))
