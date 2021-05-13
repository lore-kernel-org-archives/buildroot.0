From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 May 2021 09:48:32 +0200
Subject: [Buildroot] [git commit] boot/opensbi: only check/reference
 COPYING.BSD when _LATEST_VERSION is used
Message-ID: <20210513072035.DF4478749B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=448910b017e5e10728dcd4e9e2048abcefc44422
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
 
