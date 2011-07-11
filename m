From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2011 23:53:23 +0200
Subject: [Buildroot] [PATCH 2/4] debug: enable debugging symbols by default
In-Reply-To: <cover.1310421076.git.thomas.petazzoni@free-electrons.com>
References: <cover.1310421076.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5f88e49791af78262752e201d1d965c529939982.1310421076.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The reasoning is that having debugging symbols in the staging
directory is often useful for remote debugging, and since the staging
directory is only stored on the development workstation, disk space is
usually not an issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Config.in b/Config.in
index b130b27..dfca37b 100644
--- a/Config.in
+++ b/Config.in
@@ -172,6 +172,7 @@ config BR2_DEPRECATED
 
 config BR2_ENABLE_DEBUG
 	bool "build packages with debugging symbols"
+	default y
 	help
 	  Build packages with debugging symbols
 	  enabled
-- 
1.7.4.1
