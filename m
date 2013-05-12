From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 12 May 2013 21:25:01 +0200
Subject: [Buildroot] [PATCH] filemq: disable asciidoc documentation
	generation
Message-ID: <1368386701-5188-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

filemq uses asciidoc for its documentation. asciidoc uses python and import
the unicodedata module, which is not in host-python. So disable asciidoc
entirely.

This doesn't get hit by the autobuilders because they don't have asciidoc
installed in their chroot.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/filemq/filemq.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/filemq/filemq.mk b/package/filemq/filemq.mk
index 0ea7a9d..c715292 100644
--- a/package/filemq/filemq.mk
+++ b/package/filemq/filemq.mk
@@ -8,6 +8,7 @@ FILEMQ_VERSION = 8fac5140dd
 FILEMQ_SITE = git://github.com/zeromq/filemq.git
 
 FILEMQ_AUTORECONF = YES
+FILEMQ_CONF_ENV = fmq_have_asciidoc=no
 FILEMQ_INSTALL_STAGING = YES
 FILEMQ_DEPENDENCIES = czmq openssl zeromq
 FILEMQ_LICENSE = LGPLv3+ with exceptions
-- 
1.8.2.1
