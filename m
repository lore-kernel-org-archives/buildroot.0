From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Jan 2017 14:40:37 +0100
Subject: [Buildroot] [PATCH] opus: security bump to 1.1.4
Message-ID: <20170121134037.32421-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2017-0381: A remote code execution vulnerability in
silk/NLSF_stabilize.c in libopus in Mediaserver could enable an attacker
using a specially crafted file to cause memory corruption during media file
and data processing.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opus/opus.hash | 2 +-
 package/opus/opus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opus/opus.hash b/package/opus/opus.hash
index 2aac69b06..7349ec4b7 100644
--- a/package/opus/opus.hash
+++ b/package/opus/opus.hash
@@ -1,2 +1,2 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
-sha256	58b6fe802e7e30182e95d0cde890c0ace40b6f125cffc50635f0ad2eef69b633	opus-1.1.3.tar.gz
+sha256	9122b6b380081dd2665189f97bfd777f04f92dc3ab6698eea1dbb27ad59d8692	opus-1.1.4.tar.gz
diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index 5cd727f1e..020be88b6 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPUS_VERSION = 1.1.3
+OPUS_VERSION = 1.1.4
 OPUS_SITE = http://downloads.xiph.org/releases/opus
 OPUS_LICENSE = BSD-3c
 OPUS_LICENSE_FILES = COPYING
-- 
2.11.0
