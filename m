From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 Dec 2014 12:13:55 +0100
Subject: [Buildroot] [PATCH 5/9 v2] pkg-infra: add support for Gitorious as
	a forge
In-Reply-To: <cover.1417863715.git.yann.morin.1998@free.fr>
References: <cover.1417863715.git.yann.morin.1998@free.fr>
Message-ID: <5296b0ddc970e6c8ac33f78d85c86286bed14347.1417863715.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to what we did for GitHub, add Gitorious as a known forge.

We need to specify the _UPSTREAM tarball name, because Gitorious uses a
custom naming scheme, whereby the basename of the archive only contains
the version string (plus the extension), but not the package name.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-generic.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index dd67b51..415574e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -357,6 +357,10 @@ ifndef $(2)_SITE
 ifeq ($$($(2)_FORGE),github)
 $(2)_SITE = https://github.com/$$($(2)_FORGE_PATH)/archive/$$($(2)_VERSION)
 endif # github
+ifeq ($$($(2)_FORGE),gitorious)
+$(2)_SITE = https://gitorious.org/$$($(2)_FORGE_PATH)/archive/
+$(2)_UPSTREAM_SOURCE = $$($(2)_VERSION).tar.gz
+endif # github
 endif
 
 ifndef $(2)_SOURCE
-- 
1.9.1
