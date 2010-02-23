From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2010 21:27:28 +0100
Subject: [Buildroot] [git commit master] webkit: mention build failure with
	old linuxthread toolchains
Message-ID: <20100223202937.5DF9D776A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=596bcb63fb26052b86c1271913747e701883dbfa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I could have created a !dependency on !BR2_PTHREADS_OLD, but that
wouldn't work with external toolchains. So, let's just add a notice in
the help message of WebKit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/webkit/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index 3c669a5..10c8b38 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -14,6 +14,9 @@ config BR2_PACKAGE_WEBKIT
 	help
 	  WebKit is an open source, standards compliant web browser engine.
 
+	  Note that WebKit does not build with a toolchain using the
+	  old linuxthreads library.
+
 	  http://webkit.org/
 
 comment "webkit requires a toolchain with C++ support and WCHAR enabled"
-- 
1.6.3.3
