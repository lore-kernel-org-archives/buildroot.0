From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  4 Jul 2013 00:04:49 +0200
Subject: [Buildroot] [PATCH 2/2] lttng-tools: remove bogus comment
In-Reply-To: <1372889089-3139-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1372889089-3139-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1372889089-3139-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lttng-tools doesn't require bison or flex, it contains pre-generated
versions of the lexer and parser, so it can build perfectly fine
without bison and flex. We have removed both of these tools from our
mandatory dependencies since a bit of time, the Free Electrons
autobuilders don't have them installed, and the build succeeds.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-tools/lttng-tools.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index d48bc0a..0eb5fdc 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -15,9 +15,6 @@ LTTNG_TOOLS_LICENSE_FILES = LICENSE
 # dependency. However, having the babeltrace utilities built for the
 # host is very useful, since those tools allow to convert the binary
 # trace format into an human readable format.
-# Since the 2.1.0 release, lttng-tools depends on flex and bison,
-# but they are not added to the dependency list since they are
-# already Buildroot dependencies.
 LTTNG_TOOLS_DEPENDENCIES = liburcu popt host-lttng-babeltrace util-linux
 
 LTTNG_AUTORECONF = YES
-- 
1.8.1.2
