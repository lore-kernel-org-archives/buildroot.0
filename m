From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 22 Nov 2013 13:40:01 -0300
Subject: [Buildroot] [PATCH 3/3] jq: switch to official tarball
In-Reply-To: <1385138401-26445-1-git-send-email-gustavo@zacarias.com.ar>
References: <1385138401-26445-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1385138401-26445-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ships configure thus fixing the breakage from the automake bump
to version 1.14 with AUTORECONF, with the added bonus of being faster.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/jq/jq.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index 8d4f24f..cc7c99e 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-JQ_VERSION = jq-1.3
-JQ_SITE = http://github.com/stedolan/jq/tarball/$(JQ_VERSION)
-JQ_AUTORECONF = YES
+JQ_VERSION = 1.3
+JQ_SITE = http://stedolan.github.io/jq/download/source
 JQ_DEPENDENCIES = host-flex host-bison
 JQ_LICENSE = MIT (code), CC-BY-3.0 (documentation)
 JQ_LICENSE_FILES = COPYING
-- 
1.8.3.2
