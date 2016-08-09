From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue,  9 Aug 2016 15:33:04 +0200
Subject: [Buildroot] [PATCH] docs/manual: fix patch naming convention
Message-ID: <1470749584-17489-1-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise conflicts with the naming convention from previous section.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi all,

While creating a patch for the gst1-imx package I wasn't sure what
was the latest naming convention. Looking at the documentation, it
said in section 18.1.2. that it should be:
<number>-<description>.patch
whereas section 18.2. still recommends:
<packagename>-<number>-<description>.patch

Looking at the patches it is clear section 18.2 was outdated.

Also, should we insist on the fact that the series file is deprecated
in section 18.2.?

Regards,
Gary
---
 docs/manual/patch-policy.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
index 5a1fe4f..e1df8b0 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -73,12 +73,12 @@ details.
 * If a +series+ file exists in the package directory, then patches are
   applied according to the +series+ file;
 +
-* Otherwise, patch files matching +<packagename>-*.patch+
-  are applied in alphabetical order.
+* Otherwise, patch files matching +*.patch+ are applied in alphabetical
+  order.
   So, to ensure they are applied in the right order, it is highly
   recommended to name the patch files like this:
-  +<packagename>-<number>-<description>.patch+, where +<number>+
-  refers to the 'apply order'.
+  +<number>-<description>.patch+, where +<number>+ refers to the
+  'apply order'.
 
 . If +BR2_GLOBAL_PATCH_DIR+ is defined, the directories will be
   enumerated in the order they are specified. The patches are applied
-- 
2.8.1
