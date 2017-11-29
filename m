From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 30 Nov 2017 00:08:38 +0100
Subject: [Buildroot] [PATCH 1/8] package/lttng-tools: fix typo in variable
 name
In-Reply-To: <cover.1511996903.git.yann.morin.1998@free.fr>
References: <cover.1511996903.git.yann.morin.1998@free.fr>
Message-ID: <e23ade0d8a644cbe3967628f9b1b907a9cde3dde.1511996903.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's lttng-tools, not lttng-libust. ;-)

Fixes numerous build failures caused by a late autoreconf:
    http://autobuild.buildroot.org/results/b84/b84a6e39fcca70c56bfe49d54c385dfe6da82422/
    etc...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Philippe Proulx <eeppeliteloop@gmail.com>
---
 package/lttng-tools/lttng-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index f0c5febafd..451f652cdc 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -11,7 +11,7 @@ LTTNG_TOOLS_LICENSE = GPL-2.0+, LGPL-2.1+ (include/lttng/*, src/lib/lttng-ctl/*)
 LTTNG_TOOLS_LICENSE_FILES = gpl-2.0.txt lgpl-2.1.txt LICENSE
 LTTNG_TOOLS_CONF_OPTS += --disable-man-pages
 # 0001-Fix-detect-dlmopen-and-disable-corresponding-tests-i.patch
-LTTNG_LIBUST_AUTORECONF = YES
+LTTNG_TOOLS_AUTORECONF = YES
 LTTNG_TOOLS_DEPENDENCIES = liburcu libxml2 popt util-linux
 
 ifeq ($(BR2_PACKAGE_LTTNG_LIBUST),y)
-- 
2.11.0
