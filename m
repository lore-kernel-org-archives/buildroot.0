From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 21:13:49 +0200
Subject: [Buildroot] [PATCH 2/7] package/pkg-download.mk: add gitlab macro
In-Reply-To: <20210328191355.778786-1-thomas.petazzoni@bootlin.com>
References: <20210328191355.778786-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210328191355.778786-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just like we have a "github" macro to calculate the URL of the tarball
to download source from Github, let's introduce a similar macro for
Gitlab.

This should be used to download the auto-generated tarballs from
Gitlab. If there is a specific release tarball uploaded by the
upstream developers, the <pkg>_SITE variable should not use this new
gitlab macro.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
-- 
2.30.2
