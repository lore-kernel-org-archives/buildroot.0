From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 12:08:05 +0100
Subject: [Buildroot] [git commit] package/multicat: add missing dependency
	on bitstream
Message-ID: <20160306111117.B6F5280404@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e81d33944f86cdd7c27149d130cb2cbb26bbe976
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Multicat select bitstream package without adding it as build dependencies.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/multicat/multicat.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/multicat/multicat.mk b/package/multicat/multicat.mk
index 5909bc5..cc6eb78 100644
--- a/package/multicat/multicat.mk
+++ b/package/multicat/multicat.mk
@@ -10,6 +10,8 @@ MULTICAT_SITE = https://get.videolan.org/multicat/$(MULTICAT_VERSION)
 MULTICAT_LICENSE = GPLv2+
 MULTICAT_LICENSE_FILES = COPYING
 
+MULTICAT_DEPENDENCIES = bitstream
+
 MULTICAT_MAKE_ENV = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS)
 
 define MULTICAT_BUILD_CMDS
