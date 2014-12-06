From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 Dec 2014 12:13:59 +0100
Subject: [Buildroot] [PATCH 9/9 v2] pkg-infra: remove the legacy github
	helper
In-Reply-To: <cover.1417863715.git.yann.morin.1998@free.fr>
References: <cover.1417863715.git.yann.morin.1998@free.fr>
Message-ID: <cfd6a26419331267f1351dc1e32c0ff36f65612a.1417863715.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we have GitHub as a forge, we can get rid of the now useless
github helper.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-download.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 5bd8eac..0fa7750 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -55,9 +55,6 @@ notdomain = $(patsubst $(call domain,$(1),$(2))$(call domainseparator,$(2))%,%,$
 # default domainseparator is /, specify alternative value as first argument
 domainseparator = $(if $(1),$(1),/)
 
-# github(user,package,version): returns site of GitHub repository
-github = https://github.com/$(1)/$(2)/archive/$(3)
-
 # Helper for checking a tarball's checksum
 # If the hash does not match, remove the incorrect file
 # $(1): the path to the file with the hashes
-- 
1.9.1
