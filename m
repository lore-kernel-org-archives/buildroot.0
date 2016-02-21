From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 15:01:21 +0100
Subject: [Buildroot] [git commit] package/shairport-sync: fix static build
	issue
Message-ID: <20160221140126.56B4680E16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e4c622799321be1bd3c4a69f6cb5575561d3606
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch from upstream to fix static build issue with linking against openssl
and alsa.

Fixes:
http://autobuild.buildroot.net/results/682/6821605cf12e1a5393c29b30baf00cb0f1e1a451/
http://autobuild.buildroot.net/results/3cb/3cb79d566e197771d88e317789d05e9f467f4717/
http://autobuild.buildroot.net/results/9bc/9bcc27461b67e718f49419ba292afd28f1152dc6/
http://autobuild.buildroot.net/results/75a/75afbec6ba4c4b0ae2c18423a0d7eccf098b2eaa/
.. and possibly more.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/shairport-sync/shairport-sync.hash | 1 +
 package/shairport-sync/shairport-sync.mk   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
index e87dacd..35aba30 100644
--- a/package/shairport-sync/shairport-sync.hash
+++ b/package/shairport-sync/shairport-sync.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  6f3535012ed25017e4f893f9bad5391c2ea23c64f398caac3f29d8dad5f9e987  shairport-sync-2.8.0.tar.gz
+sha256  e0c750f51c54611e564ddb1ee161aa57ba6be36d3bf54198d9a6435ad6bf1757  8e8a0ee7ab0db61dc46735a1206843fe943ffc61.patch
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index e25a78c..628d121 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -10,6 +10,7 @@ SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VE
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3c
 SHAIRPORT_SYNC_LICENSE_FILES = LICENSES
 SHAIRPORT_SYNC_DEPENDENCIES = alsa-lib libconfig libdaemon popt host-pkgconf
+SHAIRPORT_SYNC_PATCH = https://github.com/mikebrady/shairport-sync/commit/8e8a0ee7ab0db61dc46735a1206843fe943ffc61.patch
 
 # git clone, no configure
 SHAIRPORT_SYNC_AUTORECONF = YES
