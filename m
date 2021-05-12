From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 May 2021 10:41:03 +0200
Subject: [Buildroot] [PATCH 2/2] boot/opensbi: only check/reference
 COPYING.BSD when _LATEST_VERSION is used
In-Reply-To: <20210512084104.26689-1-peter@korsgaard.com>
References: <20210512084104.26689-1-peter@korsgaard.com>
Message-ID: <20210512084104.26689-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the addition of support for custom opensbi version in commit
5c7166d387b (boot/opensbi: add support for version configuration), we can no
longer be sure that the license file name / hash will be correct in all
cases, so only specify COPYING.BSD when _LATEST_VERSION is used, similar to
how we do it for the Linux kernel.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/opensbi/opensbi.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
index f8cbbb8fcc..a525b8aea3 100644
--- a/boot/opensbi/opensbi.mk
+++ b/boot/opensbi/opensbi.mk
@@ -20,7 +20,9 @@ OPENSBI_SITE = $(call github,riscv,opensbi,v$(OPENSBI_VERSION))
 endif
 
 OPENSBI_LICENSE = BSD-2-Clause
+ifeq ($(BR2_TARGET_OPENSBI_LATEST_VERSION),y)
 OPENSBI_LICENSE_FILES = COPYING.BSD
+endif
 OPENSBI_INSTALL_TARGET = NO
 OPENSBI_INSTALL_STAGING = YES
 
-- 
2.20.1
