From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2011 07:52:00 +0200
Subject: [Buildroot] [PATCH 01/12] package: show complete URL for
	external-deps
In-Reply-To: <cover.1311141087.git.thomas.petazzoni@free-electrons.com>
References: <cover.1311141087.git.thomas.petazzoni@free-electrons.com>
Message-ID: <76d1930e304337674882703b70dcc6d92c0267b0.1311141087.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The WGET helper that is used for the "make external-deps" target was
only showing the filename, and not the complete download URL, which
was inconsistent with the SVN, BZR and GIT helpers that all show the
complete URL of the upstream project.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.package.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index faa7ff1..2798868 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -167,7 +167,7 @@ define SOURCE_CHECK_WGET
 endef
 
 define SHOW_EXTERNAL_DEPS_WGET
-  echo $(2)
+  echo $(1)/$(2)
 endef
 
 ################################################################################
-- 
1.7.4.1
