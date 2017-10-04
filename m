From: Ismael Luceno <ismael@iodev.co.uk>
Date: Wed,  4 Oct 2017 05:57:45 -0300
Subject: [Buildroot] [PATCH] pkg-download: make package name optional in
	github helper
Message-ID: <20171004085745.15457-1-ismael@iodev.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
---
 package/pkg-download.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index dc4ff1c8c755..78307eee8a33 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -52,8 +52,8 @@ notdomain = $(patsubst $(call domain,$(1),$(2))$(call domainseparator,$(2))%,%,$
 # default domainseparator is /, specify alternative value as first argument
 domainseparator = $(if $(1),$(1),/)
 
-# github(user,package[,version]): returns site of GitHub repository
-github = https://github.com/$(1)/$(2)/archive/$(or $(3),$($(call UPPERCASE,$(pkgname))_VERSION))
+# github(user[,package[,version]]): returns site of GitHub repository
+github = https://github.com/$(1)/$(or $(2),$(pkgname))/archive/$(or $(3),$($(call UPPERCASE,$(pkgname))_VERSION))
 
 # Expressly do not check hashes for those files
 # Exported variables default to immediately expanded in some versions of
-- 
2.14.2
