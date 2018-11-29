From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Nov 2018 21:45:12 +0100
Subject: [Buildroot] [git commit] package/c-ares: support host build
Message-ID: <20181202071600.D4603803E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=740a9893816b5904c7f78dcfa9f6875a59b8eff1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A host version of this package will be useful as a dependency of the
host-grpc package.

Signed-off-by: Robert Rose <robertroyrose@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/c-ares/c-ares.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 67254244a1..76e9687b37 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -15,3 +15,4 @@ C_ARES_LICENSE = MIT
 C_ARES_LICENSE_FILES = ares_mkquery.c
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
