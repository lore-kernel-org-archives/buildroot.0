From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 25 May 2021 14:27:36 +0200
Subject: [Buildroot] [PATCHv3 01/15] package/Makefile.in: pass '-g0'
 explicitly if !BR2_ENABLE_DEBUG
In-Reply-To: <20210525122750.5022-1-patrickdepinguin@gmail.com>
References: <20210525122750.5022-1-patrickdepinguin@gmail.com>
Message-ID: <20210525122750.5022-2-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

If BR2_ENABLE_DEBUG is not set, Buildroot did not pass any flag
to control debug level. This means that the build system of the package
itself would control it.

Instead, provide an explicit '-g0' (no debugging symbols) to get consistent
behavior across packages.

Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/Makefile.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index f4028bc67c..86db62ba5b 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -136,6 +136,9 @@ endif
 ifeq ($(BR2_OPTIMIZE_FAST),y)
 TARGET_OPTIMIZATION = -Ofast
 endif
+ifeq ($(BR2_ENABLE_DEBUG),)
+TARGET_DEBUGGING = -g0
+endif
 ifeq ($(BR2_DEBUG_1),y)
 TARGET_DEBUGGING = -g1
 endif
-- 
2.26.3
