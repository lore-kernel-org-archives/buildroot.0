From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 22:58:46 +0200
Subject: [Buildroot] [git commit] package/matchbox: remove superfluous
	conditional includes
Message-ID: <20150609211052.0483B81D65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0513fef19af23740128b9000848063ce596753e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the matchbox package no longer forcibly add entries to the
PACKAGES list, and entirely relies on having proper packages, we can
safely include all matchbox sub-packages .mk files, and the pkg-infra
will take care of building only those that are enabled.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/matchbox/matchbox.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
index 17d89d8..ae989b3 100644
--- a/package/matchbox/matchbox.mk
+++ b/package/matchbox/matchbox.mk
@@ -1,3 +1 @@
-ifeq ($(BR2_PACKAGE_MATCHBOX),y)
 include $(sort $(wildcard package/matchbox/*/*.mk))
-endif
