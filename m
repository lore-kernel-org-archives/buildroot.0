From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Nov 2014 16:25:54 +0100
Subject: [Buildroot] [PATCH 2/5] manual: Add notes about GitHub and hashes
In-Reply-To: <cover.1414941796.git.yann.morin.1998@free.fr>
References: <cover.1414941796.git.yann.morin.1998@free.fr>
Message-ID: <491867f3b94c751438736dd797b474dd6046b5af.1414941796.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

We can't take hashes from GitHub, unless the tarball has been uploaded by
the maintainer, otherwise it is generated and may change over time,
which renders hash files, useless.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
v2-> v3 (YEM):
  - move the block down, to be with with the other "note"
  - add reference to the GitHub helper
  - small gramatical fix s/automated/automatically/

v1 -> v2:
  - Add changes as requested by Yann E. Morin
  - Reword the comment on released tarball
---
 docs/manual/adding-packages-directory.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 174e567..8d9c3b9 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -400,6 +400,13 @@ does not provide any hash, or only provides an +md5+ hash, then compute at
 least one strong hash yourself (like +sha1+ or +sha256+, but not +md5+),
 and mention this in a comment line above the hashes.
 
+*Note:* If +libfoo+ is from GitHub (see xref:github-download-url[] for
+details), we can only accept +.hash+ file if the package is a released
+(e.g. uploaded by the maintainer) tarball. Otherwise, the automatically
+generated tarball may change over time, and thus its hashes may be
+different each time it is downloaded, making the +.hash+ file irrelevant
+for that tarball.
+
 *Note:* the number of spaces does not matter, so one can use spaces to
 properly align the different fields.
 
-- 
1.9.1
