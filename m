From: Chris Packham <judge.packham@gmail.com>
Date: Mon, 26 Oct 2015 13:36:16 +1300
Subject: [Buildroot] [PATCH 2/2] syslog-ng: Fix build error
In-Reply-To: <1445819776-7028-1-git-send-email-judge.packham@gmail.com>
References: <1445819776-7028-1-git-send-email-judge.packham@gmail.com>
Message-ID: <1445819776-7028-2-git-send-email-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an upstream patch to fix the following build error.

  error: redefinition of typedef 'TransportMapperUnix'

Fixes:
http://autobuild.buildroot.net/results/c9b/c9b31d2de72a4e48a213b5c1d011814566732dfb

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/syslog-ng/syslog-ng.hash | 1 +
 package/syslog-ng/syslog-ng.mk   | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index 1c074a5..fed2475 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -5,3 +5,4 @@ sha256 77fcbe7d6df23e710a81d8e065e17ab91b14d580aead65bb292e4f25b4369192  f10941e
 sha256 4547b44d8241be716f321d2aed225197e517db9912d6aedd8565765b427db6f2  96a633ce3f46ed102f38115000730bad41c4ed65.patch
 sha256 15cdd963f5cae0e113724fb202baccc0056f8618723d7f7290f15e082f9e16cd  00526014247bb63680e53c35d4a76d0dac989405.patch
 sha256 ec76ed27ab01f9487a8adf092655bc99167a9e81f6be685a8a45fdb1b07cca32  46b07ecaffc154aa7cc713409196020736fe4f33.patch
+sha256 737b34b4457a1fa9cd38be6a98119f131f7d64e82480011880c178d3d2618dea  e30fe7c3717a7bda4036448c7777747df1a4e0f9.patch
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 99b2a06..1f51e04 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -19,7 +19,8 @@ SYSLOG_NG_PATCH = \
 	https://github.com/balabit/syslog-ng/commit/f10941e565d402e032948bb9711bfbab43eadd88.patch \
 	https://github.com/balabit/syslog-ng/commit/96a633ce3f46ed102f38115000730bad41c4ed65.patch \
 	https://github.com/balabit/syslog-ng/commit/00526014247bb63680e53c35d4a76d0dac989405.patch \
-	https://github.com/balabit/syslog-ng/commit/46b07ecaffc154aa7cc713409196020736fe4f33.patch
+	https://github.com/balabit/syslog-ng/commit/46b07ecaffc154aa7cc713409196020736fe4f33.patch \
+	https://github.com/balabit/syslog-ng/commit/e30fe7c3717a7bda4036448c7777747df1a4e0f9.patch
 
 # We override busybox's S01logging init script
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-- 
2.5.3
