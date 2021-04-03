From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Apr 2021 11:08:01 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/ca-certificates:
 bump to version 20210119
Message-ID: <20210403094716.5670D834E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6935a70dec4bc39e12f1e97214300dbcaf9b82aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Upstream has switched to requiring python3, so change the dependency to
always use host-python3.

Signed-off-by: John Keeping <john@metanate.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7e0c490f4558b6922ccddf36a8bab0aef7e17c0a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ca-certificates/ca-certificates.hash |  4 ++--
 package/ca-certificates/ca-certificates.mk   | 10 +++-------
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.hash b/package/ca-certificates/ca-certificates.hash
index 1ed1c3ca06..024034c977 100644
--- a/package/ca-certificates/ca-certificates.hash
+++ b/package/ca-certificates/ca-certificates.hash
@@ -1,6 +1,6 @@
 # hashes from: $(CA_CERTIFICATES_SITE)/ca-certificates_$(CA_CERTIFICATES_VERSION).dsc :
-sha1  f17235bc9c3aec538065a655681815c242a6d7d5  ca-certificates_20200601.tar.xz
-sha256  43766d5a436519503dfd65ab83488ae33ab4d4ca3d0993797b58c92eb9ed4e63  ca-certificates_20200601.tar.xz
+sha1  c9875aa16e42981c6975e59a11727539053e2299  ca-certificates_20210119.tar.xz
+sha256  daa3afae563711c30a0586ddae4336e8e3974c2b627faaca404c4e0141b64665  ca-certificates_20210119.tar.xz
 
 # Locally computed
 sha256  e85e1bcad3a915dc7e6f41412bc5bdeba275cadd817896ea0451f2140a93967c  debian/copyright
diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index 5c24d4be49..94302ea96b 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -4,14 +4,10 @@
 #
 ################################################################################
 
-CA_CERTIFICATES_VERSION = 20200601
+CA_CERTIFICATES_VERSION = 20210119
 CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
-CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20200602T145955Z/pool/main/c/ca-certificates
-CA_CERTIFICATES_DEPENDENCIES = host-openssl
-# ca-certificates can be built with either python 2 or python 3
-# but it must be at least python 2.7
-CA_CERTIFICATES_DEPENDENCIES += \
-	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
+CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20210325T091936Z/pool/main/c/ca-certificates
+CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3
 CA_CERTIFICATES_LICENSE = GPL-2.0+ (script), MPL-2.0 (data)
 CA_CERTIFICATES_LICENSE_FILES = debian/copyright
 
