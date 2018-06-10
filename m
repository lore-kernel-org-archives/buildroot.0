From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Jun 2018 16:33:44 +0200
Subject: [Buildroot] [git commit] docs/manual: always point to the correct
 license file
Message-ID: <20180610143352.8477882690@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=529219ba96128b3de17dc1201f0b64d723013315
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The manual is GPL-2, and points to the COPYING file in the repository.
When we do a rendering of the manual for a specific version, that URL
is currently always poitning to the latest version of the COPYING file.

If we ever have to change the content of that file (e.g. to add a new
exception, more clarifications, a license change, or whatever), then
an old manual would point to that newer version, which would then be
incorrect.

Include the sha1 of the commit in the URL, so that the manual always
point to the tree at the time the manual was rendered, not the time
it is consulted. Contrary to the informative text above, use the full
sha1, not the shortened one.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/manual.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index afb53d0482..9d5076047f 100644
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -9,8 +9,8 @@ Buildroot {sys:echo $\{BR2_VERSION%%-git*\}} manual generated on {localdate}
 
 The Buildroot manual is written by the Buildroot developers.
 It is licensed under the GNU General Public License, version 2. Refer to the
-http://git.buildroot.org/buildroot/tree/COPYING[COPYING] file in the Buildroot
-sources for the full text of this license.
+http://git.buildroot.org/buildroot/tree/COPYING?id={sys:git rev-parse HEAD}[COPYING]
+file in the Buildroot sources for the full text of this license.
 
 Copyright (C) 2004-2018 The Buildroot developers
 
