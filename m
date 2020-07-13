From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Jul 2020 22:46:29 +0200
Subject: [Buildroot] [git commit] package/jq: fix license
Message-ID: <20200713204252.DBA8A83C05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16d0f5bff84a8e0384679d013eae511ef693776b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit c94794175fab58823fde539eac83ec0234768f36 forgot to update hash of
COPYING

ICU license has been added for decNumber library since
https://github.com/stedolan/jq/commit/b6be13d5de6dd7d8aad5fd871eb6b0b30fc7d7f6

Fixes:
 - http://autobuild.buildroot.org/results/569aa7ba86a022d3c32a65fb8b58f558aba7ae4c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jq/jq.hash | 2 +-
 package/jq/jq.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jq/jq.hash b/package/jq/jq.hash
index e9f15afa78..125781385c 100644
--- a/package/jq/jq.hash
+++ b/package/jq/jq.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  20249104d4df2247253df6df4a980b8be1f5232f03fef7cd41bacb7e6eab04fd  jq-a17dd3248a666d01be75f6b16be37e80e20b0954.tar.gz
-sha256  111136aebcbfa68b6b0084e582b30e981da76adcff84eab6f9be32a1f38c5bf1  COPYING
+sha256  c8437d414ca5b394718784c3bf5bdff7f01fee417625fabf1fb722ca263037da  COPYING
diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index 297a608b12..f3a0493b89 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -6,7 +6,7 @@
 
 JQ_VERSION = a17dd3248a666d01be75f6b16be37e80e20b0954
 JQ_SITE = $(call github,stedolan,jq,$(JQ_VERSION))
-JQ_LICENSE = MIT (code), CC-BY-3.0 (documentation)
+JQ_LICENSE = MIT (code), ICU (decNumber), CC-BY-3.0 (documentation)
 JQ_LICENSE_FILES = COPYING
 JQ_INSTALL_STAGING = YES
 
