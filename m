From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Jun 2021 22:56:31 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/mpv: security
 bump to version 0.33.1
Message-ID: <20210609202608.D994B83B47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cfbe193dc8667d72b9dfc5ce59d842b4fa593c58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix CVE-2021-30145: A format string vulnerability in mpv through 0.33.0
allows user-assisted remote attackers to achieve code execution via a
crafted m3u playlist file.

https://github.com/mpv-player/mpv/releases/tag/v0.33.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 34a387b5f68d2cc259d4fe641c128232edb6da62)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpv/mpv.hash | 2 +-
 package/mpv/mpv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpv/mpv.hash b/package/mpv/mpv.hash
index 548a0f0159..0c7eb5f8a5 100644
--- a/package/mpv/mpv.hash
+++ b/package/mpv/mpv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f1b9baf5dc2eeaf376597c28a6281facf6ed98ff3d567e3955c95bf2459520b4  mpv-0.33.0.tar.gz
+sha256  100a116b9f23bdcda3a596e9f26be3a69f166a4f1d00910d1789b6571c46f3a9  mpv-0.33.1.tar.gz
 sha256  a99d7b0625a0566271aad6de694e52eafd566db024f9516720d526c680d3ee30  LICENSE.GPL
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index ca3b8c878a..5713b98e8e 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPV_VERSION = 0.33.0
+MPV_VERSION = 0.33.1
 MPV_SITE = $(call github,mpv-player,mpv,v$(MPV_VERSION))
 MPV_DEPENDENCIES = \
 	host-pkgconf ffmpeg libass zlib \
