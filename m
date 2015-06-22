From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Jun 2015 15:53:22 +0200
Subject: [Buildroot] [git commit] openvmtools: fix legal info
Message-ID: <20150622135356.81178807BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=260d4461479f99baaeff802867ee6977e48a95ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In ab71dff0 it was moved to SUBDIR, but this was never reflected for the
legal-info files, update this to fix:
http://autobuild.buildroot.net/results/836/8363943cc9c967713f585209408ea087a052a12d/

[Thomas: put OPENVMTOOLS_SUBDIR before OPENVMTOOLS_LICENSE_FILES, as
suggested by Yann.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Karoly Kasza <kaszak@gmail.com>
Tested-by: Karoly Kasza <kaszak@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openvmtools/openvmtools.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index 9819640..57271c8 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -6,11 +6,11 @@
 
 OPENVMTOOLS_VERSION = stable-9.10.0
 OPENVMTOOLS_SITE = $(call github,vmware,open-vm-tools,$(OPENVMTOOLS_VERSION))
+OPENVMTOOLS_SUBDIR = open-vm-tools
 OPENVMTOOLS_LICENSE = LGPLv2.1
-OPENVMTOOLS_LICENSE_FILES = COPYING
+OPENVMTOOLS_LICENSE_FILES = $(OPENVMTOOLS_SUBDIR)/COPYING
 # Autoreconf needed or config/missing will run configure again at buildtime
 OPENVMTOOLS_AUTORECONF = YES
-OPENVMTOOLS_SUBDIR = open-vm-tools
 OPENVMTOOLS_CONF_OPTS = --with-dnet \
 	--without-icu --without-x --without-gtk2 \
 	--without-gtkmm --without-kernel-modules \
