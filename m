From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 May 2015 17:37:40 +0200
Subject: [Buildroot] [PATCH 2/2 v2] manual: Add notes about GitHub and hashes
In-Reply-To: <cover.1430667367.git.yann.morin.1998@free.fr>
References: <cover.1430667367.git.yann.morin.1998@free.fr>
Message-ID: <65108fc814c42059f26b7690ccd505c0ebb6afb5.1430667367.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

We can't take hashes from GitHub, unless the tarball has been uploaded by
the maintainer, otherwise it is generated and may change over time,
which renders hash files useless.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
v3 -> v4 :
  - typo  (Arnout)

v2 -> v3 (YEM):
  - move the block down, to be with with the other "note"
  - add reference to the GitHub helper
  - small grammatical fix s/automated/automatically/

v1 -> v2:
  - Add changes as requested by Yann E. Morin
  - Reword the comment on released tarball
---
 docs/manual/adding-packages-directory.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 6c478c2..fb3764e 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -442,6 +442,13 @@ strong hash yourself (preferably +sha256+, but not +md5+), and mention
 this in a comment line above the hashes.
 
 .Note
+If +libfoo+ is from GitHub (see xref:github-download-url[] for details), we
+can only accept a +.hash+ file if the package is a released (e.g. uploaded
+by the maintainer) tarball. Otherwise, the automatically generated tarball
+may change over time, and thus its hashes may be different each time it is
+downloaded, making the +.hash+ file irrelevant for that tarball.
+
+.Note
 The number of spaces does not matter, so one can use spaces (or tabs) to
 properly align the different fields.
 
-- 
1.9.1
