From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue,  7 Mar 2017 23:23:47 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/pkg-download.mk: add gitlab
	helper
In-Reply-To: <1488925428-12805-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1488925428-12805-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1488925428-12805-2-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Downloaging tarball from gitlab it's not straigthforward cause
it uses a strange url format. Adding an helper to simplify things.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/pkg-download.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index cfc550e..eae30d8 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -55,6 +55,9 @@ domainseparator = $(if $(1),$(1),/)
 # github(user,package,version): returns site of GitHub repository
 github = https://github.com/$(1)/$(2)/archive/$(3)
 
+# gitlab(user,package,version): returns site of GitHub repository
+gitlab = "https://gitlab.com/$(1)/$(2)/repository/archive.tar.bz2?ref=$(3)&filename="
+
 # Expressly do not check hashes for those files
 # Exported variables default to immediately expanded in some versions of
 # make, but we need it to be recursively-epxanded, so explicitly assign it.
-- 
2.7.4
