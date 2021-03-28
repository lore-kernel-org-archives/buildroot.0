From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Mar 2021 22:44:57 +0200
Subject: [Buildroot] [git commit] package/pkg-download.mk: add gitlab macro
Message-ID: <20210328202028.565B67FB91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f83826c90daf9cdb5a6196d2d2830eea8c2f0e09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Just like we have a "github" macro to calculate the URL of the tarball
to download source from Github, let's introduce a similar macro for
Gitlab.

This should be used to download the auto-generated tarballs from
Gitlab. If there is a specific release tarball uploaded by the
upstream developers, the <pkg>_SITE variable should not use this new
gitlab macro.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-download.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 4d97ef9a31..2527ba5c60 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -61,6 +61,9 @@ domainseparator = $(if $(1),$(1),/)
 # github(user,package,version): returns site of GitHub repository
 github = https://github.com/$(1)/$(2)/archive/$(3)
 
+# gitlab(user,package,version): returns site of Gitlab-generated tarball
+gitlab = https://gitlab.com/$(1)/$(2)/-/archive/$(3)
+
 # Expressly do not check hashes for those files
 # Exported variables default to immediately expanded in some versions of
 # make, but we need it to be recursively-epxanded, so explicitly assign it.
