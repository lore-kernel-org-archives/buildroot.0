From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 13:45:46 +0200
Subject: [Buildroot] [git commit] perl: fix build on big endian arch
Message-ID: <20141005114559.188F0B76B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4daf09bff1f8eff1661513c1c723b7aed244e318
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

see http://autobuild.buildroot.org/results/3a1/3a1c2f0bc802d3cec26ffd4ded8f5c04473a3d4b/build-end.log

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl/perl.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 09b1aa7..3c3348a 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -58,6 +58,7 @@ PERL_CONF_OPTS = \
 	-Dld="$(TARGET_CC_NOCCACHE)" \
 	-Dccflags="$(TARGET_CFLAGS)" \
 	-Dldflags="$(TARGET_LDFLAGS) -lm" \
+	-Dmultiarch \
 	-Dmydomain="" \
 	-Dmyhostname="$(BR2_TARGET_GENERIC_HOSTNAME)" \
 	-Dmyuname="Buildroot $(BR2_VERSION_FULL)" \
