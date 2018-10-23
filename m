From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 01:08:03 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] scanpypi: improve BSD
 licence handling
Message-ID: <20181023230620.BB03C8878A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9610b1dd2365564fdcd0d23c2fa4e4bfd7c1dd8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

When used without spdx_lookup the BSD licence cannot be
detected correctly because many Python packages just specify
BSD without the exact version in their metadata. So add a
special message warning the user instead of the licence id.

Bonus: fix typo.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d05e41eb1a934b2358799588bb305073d6df8e52)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/scanpypi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index bc593e0e89..56b9f420ff 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -379,7 +379,7 @@ class BuildrootPackage():
         """
         Try to determine the related license name.
 
-        There are two possibilities. Either the scripts tries to
+        There are two possibilities. Either the script tries to
         get license name from package's metadata or, if spdx_lookup
         package is available, the script compares license files with
         SPDX database.
@@ -388,7 +388,7 @@ class BuildrootPackage():
         if liclookup is None:
             license_dict = {
                 'Apache Software License': 'Apache-2.0',
-                'BSD License': 'BSD',
+                'BSD License': 'FIXME: please specify the exact BSD version',
                 'European Union Public Licence 1.0': 'EUPL-1.0',
                 'European Union Public Licence 1.1': 'EUPL-1.1',
                 "GNU General Public License": "GPL",
