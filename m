From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Nov 2013 12:25:32 +0100
Subject: [Buildroot] [git commit] protobuf-c: disable parallel build
Message-ID: <20131126113735.30A4D9BDF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=720008338acd7012b0a8c69525f2479f0794dffe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/f47c4f0883019ba3a8e61a9ae51b7bd7f347b38c/

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/protobuf-c/protobuf-c.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
index 31fb593..271f6d8 100644
--- a/package/protobuf-c/protobuf-c.mk
+++ b/package/protobuf-c/protobuf-c.mk
@@ -8,6 +8,7 @@ PROTOBUF_C_VERSION = 0.15
 PROTOBUF_C_SITE = http://protobuf-c.googlecode.com/files
 PROTOBUF_C_DEPENDENCIES = protobuf host-protobuf-c
 HOST_PROTOBUF_C_DEPENDENCIES = host-protobuf
+PROTOBUF_C_MAKE = $(MAKE1)
 PROTOBUF_C_CONF_OPT = --disable-protoc
 PROTOBUF_C_INSTALL_STAGING = YES
 PROTOBUF_C_LICENSE = BSD-3c
