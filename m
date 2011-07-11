From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2011 23:53:22 +0200
Subject: [Buildroot] [PATCH 1/4] debug: do not force installation of
	gdbserver
In-Reply-To: <cover.1310421076.git.thomas.petazzoni@free-electrons.com>
References: <cover.1310421076.git.thomas.petazzoni@free-electrons.com>
Message-ID: <74cb14fae380ec1789a3d97a797fe15e9c957f58.1310421076.git.thomas.petazzoni@free-electrons.com>
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
index a67c08d..b130b27 100644
--- a/Config.in
+++ b/Config.in
@@ -172,7 +172,6 @@ config BR2_DEPRECATED
 
 config BR2_ENABLE_DEBUG
 	bool "build packages with debugging symbols"
-	select BR2_PACKAGE_GDB_SERVER
 	help
 	  Build packages with debugging symbols
 	  enabled
-- 
1.7.4.1
