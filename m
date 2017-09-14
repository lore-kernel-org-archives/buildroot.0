From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Date: Thu, 14 Sep 2017 17:47:42 +0300
Subject: [Buildroot] [PATCH] docs: clarify <packagename>_PATCH behaviour
Message-ID: <20170914144742.1844-1-alexander.i.mukhin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reiterate once more that <packagename>_PATCH variable can point
to an arbitrary URL, not just to a path relative to <packagename>_SITE.

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
---
 docs/manual/patch-policy.txt | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
index e1df8b003..5e2e5fc4b 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -19,9 +19,11 @@ global patch directory.
 ==== Downloaded
 
 If it is necessary to apply a patch that is available for download, then add it
-to the +<packagename>_PATCH+ variable. It is downloaded from the same site
-as the package itself. It can be a single patch, or a tarball containing a
-patch series.
+to the +<packagename>_PATCH+ variable. If an entry contains +://+,
+then Buildroot will assume it is a full URL and download the patch
+from this location. Otherwise, Buildroot will assume that the patch should be
+downloaded from +<packagename>_SITE+. It can be a single patch,
+or a tarball containing a patch series.
 
 This method is typically used for packages from Debian.
 
-- 
2.11.0
