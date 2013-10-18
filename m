From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 18 Oct 2013 11:34:17 +0200
Subject: [Buildroot] [PATCH v8 RESEND 5/8] glibc: add support for top-level
	parallel make
In-Reply-To: <1382088860-30524-1-git-send-email-fabio.porcedda@gmail.com>
References: <1382088860-30524-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1382088860-30524-6-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To be able to use top-level parallel make we must not depend in a rule
on the order of evaluation of the prerequisites, so instead of relyng on
the left to right ordering of evaluation of the prerequisites add
an explicit rule to describe the dependencies.

The glibc-install-target depends on glibc-install-staging so add a rule
for it.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/glibc/glibc.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index e89c12a..838fb8c 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -130,3 +130,5 @@ define GLIBC_INSTALL_TARGET_CMDS
 endef
 
 $(eval $(autotools-package))
+
+$(GLIBC_TARGET_INSTALL_TARGET): $(GLIBC_TARGET_INSTALL_STAGING)
-- 
1.8.4
