From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 May 2015 15:40:14 +0200
Subject: [Buildroot] [git commit] manual: Add notes about GitHub and hashes
Message-ID: <20150504134035.6D46381941@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9474cc2594c8643301164500ce6eb62546da2b8f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We can't take hashes from GitHub, unless the tarball has been uploaded by
the maintainer, otherwise it is generated and may change over time,
which renders hash files useless.

[Peter: slightly reword]
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-directory.txt |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 6c478c2..3d0982f 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -442,6 +442,13 @@ strong hash yourself (preferably +sha256+, but not +md5+), and mention
 this in a comment line above the hashes.
 
 .Note
+If +libfoo+ is from GitHub (see xref:github-download-url[] for details), we
+can only accept a +.hash+ file if the package is a released (e.g. uploaded
+by the maintainer) tarball. Otherwise, the automatically generated tarball
+may change over time, and thus its hashes may be different each time it is
+downloaded, causing a +.hash+ mismatch for that tarball.
+
+.Note
 The number of spaces does not matter, so one can use spaces (or tabs) to
 properly align the different fields.
 
