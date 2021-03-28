From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 21:13:50 +0200
Subject: [Buildroot] [PATCH 3/7] docs/manual: add documentation for the
 gitlab macro
In-Reply-To: <20210328191355.778786-1-thomas.petazzoni@bootlin.com>
References: <20210328191355.778786-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210328191355.778786-4-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-tips.txt | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 6e4241d570..d8c2eceb10 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -210,3 +210,33 @@ image::github_hash_mongrel2.png[]
 - On the other hand, if there's is *only* the "Source code" link, then
   it's an automatically generated tarball and you should use the
   'github' helper function.
+
+[[gitlab-download-url]]
+==== How to add a package from Gitlab
+
+In a similar way to the +github+ macro described in
+xref:github-download-url[], Buildroot also provides the +gitlab+ macro
+to download from Gitlab repositories. It can be used to download
+auto-generated tarballs produced by Gitlab, either for specific tags
+or commits:
+
+------------------------
+# Use a tag or a full commit ID
+FOO_VERSION = 1.0
+FOO_SITE = $(call gitlab,<user>,<package>,v$(FOO_VERSION))
+------------------------
+
+By default, it will use a +.tar.gz+ tarball, but Gitlab also provides
++.tar.bz2+ tarballs, so by adding a +<pkg>_SOURCE+ variable, this
++.tar.bz2+ tarball can be used:
+
+------------------------
+# Use a tag or a full commit ID
+FOO_VERSION = 1.0
+FOO_SITE = $(call gitlab,<user>,<package>,v$(FOO_VERSION))
+FOO_SOURCE = foo-$(FOO_VERSION).tar.bz2
+------------------------
+
+If there is a specific tarball uploaded by the upstream developers in
++https://gitlab.com/<project>/releases/+, do not use this macro, but
+rather use directly the link to the tarball.
-- 
2.30.2
