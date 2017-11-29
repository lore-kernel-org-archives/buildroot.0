From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 23:45:25 +0100
Subject: [Buildroot] [git commit] package/lttng-tools: fix typo in variable
 name
Message-ID: <20171129223804.8393A81F55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9911730bda553535befda3ca75cba12abb161bf6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's lttng-tools, not lttng-libust. ;-)

Fixes numerous build failures caused by a late autoreconf:
    http://autobuild.buildroot.org/results/b84/b84a6e39fcca70c56bfe49d54c385dfe6da82422/
    etc...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Philippe Proulx <eeppeliteloop@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-tools/lttng-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index f0c5feb..451f652 100644
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
