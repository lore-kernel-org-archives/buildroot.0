From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 22:20:13 +0200
Subject: [Buildroot] [git commit] syslog-ng: Add upstream patches to support
	python 3
Message-ID: <20151021202042.16B6781EBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=19f9f6c8d549ddff6408545660c8abedf5ce329b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From https://github.com/balabit/syslog-ng/pull/711

Fixes:
http://autobuild.buildroot.net/results/8bf/8bfb199bda2218252bc21b228066d41af37e2753/
http://autobuild.buildroot.net/results/ab8/ab8ec583d1836d0c246ac792391549bfe277ce76/

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/syslog-ng/syslog-ng.hash |    5 +++++
 package/syslog-ng/syslog-ng.mk   |    6 ++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index 56dc75f..1c074a5 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,2 +1,7 @@
 # Locally computed
 sha256 4c19841b9079b377cd814b1e6ebbf273af41d04d51c648f4c31f19bfadc20220  syslog-ng-3.7.1.tar.gz
+sha256 ca6b18c00e72a531dc3e4da24ff79e4b4420cb0f666b3d72af6597648b36a696  7b2b673ae2640ce9ad396f538fc25acb6e4405ec.patch
+sha256 77fcbe7d6df23e710a81d8e065e17ab91b14d580aead65bb292e4f25b4369192  f10941e565d402e032948bb9711bfbab43eadd88.patch
+sha256 4547b44d8241be716f321d2aed225197e517db9912d6aedd8565765b427db6f2  96a633ce3f46ed102f38115000730bad41c4ed65.patch
+sha256 15cdd963f5cae0e113724fb202baccc0056f8618723d7f7290f15e082f9e16cd  00526014247bb63680e53c35d4a76d0dac989405.patch
+sha256 ec76ed27ab01f9487a8adf092655bc99167a9e81f6be685a8a45fdb1b07cca32  46b07ecaffc154aa7cc713409196020736fe4f33.patch
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 2bbace8..1ade7cf 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -12,6 +12,12 @@ SYSLOG_NG_LICENSE_FILES = COPYING
 SYSLOG_NG_DEPENDENCIES = host-bison host-flex host-pkgconf \
 	eventlog libglib2 openssl pcre
 SYSLOG_NG_CONF_OPTS = --disable-manpages
+SYSLOG_NG_PATCH = \
+	https://github.com/dnsjts/syslog-ng/commit/7b2b673ae2640ce9ad396f538fc25acb6e4405ec.patch \
+	https://github.com/dnsjts/syslog-ng/commit/f10941e565d402e032948bb9711bfbab43eadd88.patch \
+	https://github.com/dnsjts/syslog-ng/commit/96a633ce3f46ed102f38115000730bad41c4ed65.patch \
+	https://github.com/dnsjts/syslog-ng/commit/00526014247bb63680e53c35d4a76d0dac989405.patch \
+	https://github.com/dnsjts/syslog-ng/commit/46b07ecaffc154aa7cc713409196020736fe4f33.patch
 
 # We override busybox's S01logging init script
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
