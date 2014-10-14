From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 14 Oct 2014 11:33:17 +0200
Subject: [Buildroot] [PATCH v3] manual: Add note about uses of github helper
Message-ID: <1413279197-11949-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a little comment regarding the uses of the github helper for the releases.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
---
v1 -> v2:
  - Remove typo
  - Add indication to uses green button's link
---
 docs/manual/adding-packages-tips.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 0d4fcb0..9896a9b 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -52,3 +52,17 @@ FOO_SITE = $(call github,<user>,<package>,$(FOO_VERSION))
   Buildroot (e.g.: +foo-f6fb6654af62045239caed5950bc6c7971965e60.tar.gz+),
   so it is not necessary to specify it in the +.mk+ file.
 - When using a commit ID as version, you should use the full 40 hex characters.
+
+If the package you wish to add does have a release section on GitHub,
+you need to be careful, the maintainer of the package may have
+uploaded a specific file along with the releases.
+You can see it from the pages:
+- If there is a green download button, like
+  https://github.com/zedshaw/mongrel2/releases/tag/v1.9.1[mongrel2], you
+  should uses the link of that button to specify +FOO_SITE+.
+- If there is grey downlaod button, like
+  https://github.com/xbmc/xbmc/releases/tag/13.2-Gotham[xbmc], then you
+  can use the 'github' helper.
+
+If there is a green download button, it should be used in priority over
+the grey one.
-- 
2.1.1
