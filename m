From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 18:14:27 +0100
Subject: [Buildroot] [git commit] qt5: install headers into /usr/include/qt5
Message-ID: <20131225171527.5D3D29C150@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dacc0a44acefefec47d9a90d928b03e6f88e17fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are places in Qt's source where headers included with the name of
the module subdirectory (e.g. #include <QtCore/QHash>). Therefore, the
build system passes the top header directory to the compiler; but this
results in a error when building host tools since sysroot/usr/include
directory includes architecture specific system headers.

In order to prevent this, install all Qt headers into a subdirectory in
/usr/include.

Fixes: http://autobuild.buildroot.net/results/4f1/4f16c0b38bdd6e40efcc781c12fae81c0bfabb72/

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5base/qt5base.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 1b753d3..e46bdeb 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -159,6 +159,7 @@ define QT5BASE_CONFIGURE_CMDS
 		-v \
 		-prefix /usr \
 		-hostprefix $(HOST_DIR)/usr \
+		-headerdir /usr/include/qt5 \
 		-sysroot $(STAGING_DIR) \
 		-plugindir /usr/lib/qt/plugins \
 		-no-rpath \
