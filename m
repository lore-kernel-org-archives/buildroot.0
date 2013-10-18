From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 18 Oct 2013 11:27:15 +0200
Subject: [Buildroot] [PATCH v8 6/8] uclibc: add support for top-level
	parallel make
In-Reply-To: <1382088437-30393-1-git-send-email-fabio.porcedda@gmail.com>
References: <1382088437-30393-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1382088437-30393-8-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To be able to use top-level parallel make we must not depend in a rule
on the order of evaluation of the prerequisites, so instead of relyng on
the left to right ordering of evaluation of the prerequisites add an
explicit rule to describe the dependencies.

The uclibc-install-target depends on uclibc-install-staging so add a
rule for it.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/uclibc/uclibc.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index dea36e7..c8eeb3d 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -559,3 +559,5 @@ uclibc-menuconfig: dirs uclibc-patch
 	rm -f $(UCLIBC_DIR)/.stamp_{configured,built,target_installed,staging_installed}
 
 $(eval $(generic-package))
+
+$(UCLIBC_TARGET_INSTALL_TARGET): $(UCLIBC_TARGET_INSTALL_STAGING)
-- 
1.8.4
