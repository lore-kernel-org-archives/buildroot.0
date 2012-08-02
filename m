From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:36 -0000
Subject: [Buildroot] [git commit branch/next] gpsd: Remove package version
	from the navcom patch
Message-ID: <20120802195233.208D696EA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b779b6bd948f96d20d6f12cc5591b436256177d4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

If the buildroot infrastructure finds a patch file that contains the
$PKG-$VERSION tuple in the filename, it will only apply this kind of
patches, ignoring the rest of the patches in the package directory.
As a result of which, the gpsd-fix-libgpsmm.patch did not apply
because the gpsd-2.95-navcom.patch satisfies the $PKG-$VERSION convention.
The buildroot policy (as discussed during the Buildroot Developer meeting)
is to remove the package version from the patch filename.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../{gpsd-2.95-navcom.patch => gpsd-navcom.patch}  |    0
 1 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/gpsd/gpsd-2.95-navcom.patch b/package/gpsd/gpsd-navcom.patch
similarity index 100%
rename from package/gpsd/gpsd-2.95-navcom.patch
rename to package/gpsd/gpsd-navcom.patch
