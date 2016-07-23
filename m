From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 23 Jul 2016 14:30:01 -0300
Subject: [Buildroot] [PATCH 2/2] zeromq: disable documentation
In-Reply-To: <1469295001-21786-1-git-send-email-gustavo@zacarias.com.ar>
References: <1469295001-21786-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1469295001-21786-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If asciidoc and xmlto are around it will automatically enable the
documentation build which is pointless.
Build time on i5-3330 with docs = 37s, without docs 25s.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/zeromq/zeromq.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 889c94a..05f789c 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -9,6 +9,7 @@ ZEROMQ_SITE = http://download.zeromq.org
 ZEROMQ_SITE = https://github.com/zeromq/zeromq4-1/releases/download/v$(ZEROMQ_VERSION)
 ZEROMQ_INSTALL_STAGING = YES
 ZEROMQ_DEPENDENCIES = util-linux
+ZEROMQ_CONF_OPTS = --without-documentation
 ZEROMQ_LICENSE = LGPLv3+ with exceptions
 ZEROMQ_LICENSE_FILES = COPYING COPYING.LESSER
 # For 0001-acinclude.m4-make-kernel-specific-flags-cacheable.patch
-- 
2.7.3
