From: =?UTF-8?q?Micha=C3=ABl=20Blanc?= <mika.blanc@gmail.com>
Date: Mon, 25 Feb 2019 01:16:11 +0100
Subject: [Buildroot] [PATCH] package/flatbuffers: do not install to target
Message-ID: <20190225001610.3786-1-mika.blanc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since flatbuffers does not have a shared library and flatc is only useful
for compiling schemas of other projects, there is no point in installing
flatbuffers in the target directory.

Signed-off-by: Micha?l Blanc <mika.blanc@gmail.com>
---
 package/flatbuffers/flatbuffers.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
index 69054885ea..32186788c5 100644
--- a/package/flatbuffers/flatbuffers.mk
+++ b/package/flatbuffers/flatbuffers.mk
@@ -9,6 +9,7 @@ FLATBUFFERS_SITE = $(call github,google,flatbuffers,$(FLATBUFFERS_VERSION))
 FLATBUFFERS_LICENSE = Apache-2.0
 FLATBUFFERS_LICENSE_FILES = LICENSE.txt
 FLATBUFFERS_INSTALL_STAGING = YES
+FLATBUFFERS_INSTALL_TARGET = NO
 
 FLATBUFFERS_CONF_OPTS += \
 	-DCMAKE_CXX_FLAGS="-std=c++11" \
-- 
2.20.1
