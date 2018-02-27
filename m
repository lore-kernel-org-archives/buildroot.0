From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Feb 2018 21:05:00 +0100
Subject: [Buildroot] [git commit] mpv: security bump to 0.27.2
Message-ID: <20180227200714.DE3EE81342@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ec6b8b31e1930df4f10c65ec11cce0cca018e96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2018-6360: mpv through 0.28.0 allows remote attackers to execute
arbitrary code via a crafted web site, because it reads HTML documents
containing VIDEO elements, and accepts arbitrary URLs in a src attribute
without a protocol whitelist.

[Peter: Add CVE description]
Signed-off-by: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpv/mpv.hash | 2 +-
 package/mpv/mpv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpv/mpv.hash b/package/mpv/mpv.hash
index 60fb84335e..1dac3a4940 100644
--- a/package/mpv/mpv.hash
+++ b/package/mpv/mpv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 341d8bf18b75c1f78d5b681480b5b7f5c8b87d97a0d4f53a5648ede9c219a49c v0.27.0.tar.gz
+sha256 2ad104d83fd3b2b9457716615acad57e479fd1537b8fc5e37bfe9065359b50be v0.27.2.tar.gz
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index d577674bd9..f38a6b916f 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPV_VERSION = 0.27.0
+MPV_VERSION = 0.27.2
 MPV_SITE = https://github.com/mpv-player/mpv/archive
 MPV_SOURCE = v$(MPV_VERSION).tar.gz
 MPV_DEPENDENCIES = \
