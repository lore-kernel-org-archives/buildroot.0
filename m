From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 14:43:37 +0200
Subject: [Buildroot] [git commit] docs: clarify <packagename>_PATCH behaviour
Message-ID: <20170924124820.3F733806B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48934ed0a97b7baee7ad8fbfb19e449024cdda9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reiterate once more that <packagename>_PATCH variable can point
to an arbitrary URL, not just to a path relative to <packagename>_SITE.

While we're at it, also explain that the patch should be added to the
.hash file.

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
[Arnout: add sentence about .hash file.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/patch-policy.txt | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
index e1df8b0..e704a0d 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -19,9 +19,14 @@ global patch directory.
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
+
+Like for all downloads, a hash should be added to the +<packagename>.hash+
+file.
 
 This method is typically used for packages from Debian.
 
