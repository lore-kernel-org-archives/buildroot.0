From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Mar 2012 23:49:56 +0100
Subject: [Buildroot] [PATCH 1/3] debug: do not force installation of
	gdbserver
In-Reply-To: <cover.1331765391.git.thomas.petazzoni@free-electrons.com>
References: <cover.1331765391.git.thomas.petazzoni@free-electrons.com>
Message-ID: <ac1c43ed34958caca4be080514c167e6121a0238.1331765391.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The BR2_ENABLE_DEBUG option selects the compilation and installation
of gdbserver on the target. This is a bit restrictive, especially for
external toolchains, which may already contain a gdbserver on the
target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/Config.in b/Config.in
index 2002996..e07e52f 100644
--- a/Config.in
+++ b/Config.in
@@ -205,7 +205,6 @@ config BR2_DEPRECATED
 
 config BR2_ENABLE_DEBUG
 	bool "build packages with debugging symbols"
-	select BR2_PACKAGE_GDB_SERVER
 	help
 	  Build packages with debugging symbols
 	  enabled
-- 
1.7.4.1
