From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  9 Jun 2019 23:08:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/cargo: needs host-libxml2
Message-ID: <20190609210835.31236-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-cargo needs host-libxml2 to avoid depending on an unworking
libxml2:

--- stderr
cmake: /home/mark/buildroot-test/instance-1/output/host/lib/libcurl.so.4: no version information available (required by cmake)
cmake: symbol lookup error: /usr/lib/x86_64-linux-gnu/libxml2.so.2: undefined symbol: UCNV_TO_U_CALLBACK_STOP_60
thread 'main' panicked at '
command did not execute successfully, got: exit code: 127

Fixes:
 - http://autobuild.buildroot.org/results/017854ca4cce8c0e4f7b41b407e44cb91e8b09a0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cargo/cargo.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cargo/cargo.mk b/package/cargo/cargo.mk
index a387281b4c..dd0b93b304 100644
--- a/package/cargo/cargo.mk
+++ b/package/cargo/cargo.mk
@@ -28,6 +28,7 @@ HOST_CARGO_DEPENDENCIES = \
 	host-libhttpparser \
 	host-libssh2 \
 	host-libcurl \
+	host-libxml2 \
 	host-rustc \
 	host-cargo-bin
 
-- 
2.20.1
