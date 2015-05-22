From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 May 2015 07:30:54 +0200
Subject: [Buildroot] [git commit] package/protobuf: autoreconf is now needed
Message-ID: <20150522055830.C22C681E1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=754f0015c89e9d17e09f073259ecbc1bd64a0ef6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since its update, the *_SITE points to the git repository, so configure
script is not generated in this tarball.

Fixes:
  http://autobuild.buildroot.org/results/ccb/ccba6d8c73b5e826b86065b77b3fe5077db7b99c/
  http://autobuild.buildroot.org/results/57e/57ea34e9b48293075e10f0dd2331de2785730827/
  and many more...

[Peter: drop redundant HOST_*_AUTORECONF]
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/protobuf/protobuf.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index b426873..0426fce 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -8,6 +8,8 @@ PROTOBUF_VERSION = v2.5.0
 PROTOBUF_SITE = $(call github,google,protobuf,$(PROTOBUF_VERSION))
 PROTOBUF_LICENSE = BSD-3c
 PROTOBUF_LICENSE_FILES = COPYING.txt
+# no configure script
+PROTOBUF_AUTORECONF = YES
 
 # N.B. Need to use host protoc during cross compilation.
 PROTOBUF_DEPENDENCIES = host-protobuf
