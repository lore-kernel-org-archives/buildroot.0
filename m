From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Jan 2017 09:06:46 +0100
Subject: [Buildroot] [git commit branch/2016.11.x] opus: security bump to
	1.1.4
Message-ID: <20170123080913.EDC4781E41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bfa4b1a65ee27a43e0f1c0e1212d7483d2cc17c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2016.11.x

Fixes CVE-2017-0381: A remote code execution vulnerability in
silk/NLSF_stabilize.c in libopus in Mediaserver could enable an attacker
using a specially crafted file to cause memory corruption during media file
and data processing.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit f00a528ce68e24bb9f162416a5cf25bdc65fce20)
---
 package/opus/opus.hash | 2 +-
 package/opus/opus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opus/opus.hash b/package/opus/opus.hash
index 2aac69b..7349ec4 100644
--- a/package/opus/opus.hash
+++ b/package/opus/opus.hash
@@ -1,2 +1,2 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
-sha256	58b6fe802e7e30182e95d0cde890c0ace40b6f125cffc50635f0ad2eef69b633	opus-1.1.3.tar.gz
+sha256	9122b6b380081dd2665189f97bfd777f04f92dc3ab6698eea1dbb27ad59d8692	opus-1.1.4.tar.gz
diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index 5cd727f..020be88 100644
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
