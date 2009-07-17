From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Jul 2009 18:03:12 +0200
Subject: [Buildroot] [PATCH 05/13] midori: remove configuration comment on
	X.org dependency
In-Reply-To: <cover.1247846596.git.thomas.petazzoni@free-electrons.com>
References: <cover.1247846596.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0c7ee23c9c2b876661fc410f4cb2647f262c2b1c.1247846597.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Configuration comments make the configuration system messy. And if we
want to tell the user about the possible missing depencies for each
and every package, there would be an unmaintable mess of configuration
comments.

Let's get rid of them, and let the user figure out using the help of
each package available in the configuration system.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/midori/Config.in |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/package/midori/Config.in b/package/midori/Config.in
index fd1da35..80b7f77 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -7,6 +7,3 @@ config BR2_PACKAGE_MIDORI
 	  Midori is a lightweight web browser based on WebKit
 
 	  http://software.twotoasts.de/?page=midori
-
-comment "midori		- disabled (requires Xorg(7))"
-	depends on !(BR2_PACKAGE_XORG || BR2_PACKAGE_XORG7)
-- 
1.6.0.4
