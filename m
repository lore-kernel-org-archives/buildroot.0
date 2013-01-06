From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 16:22:48 +0100
Subject: [Buildroot] [PATCH 08/15] argp-standlone: build position
	independent code
In-Reply-To: <cover.1357485747.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357485747.git.thomas.petazzoni@free-electrons.com>
Message-ID: <49ea89bd0f8704ba32554477c679bf3f959d5938.1357485747.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even though argp-standalone is built as a static library, it might get
linked in a shared library, so we must built it as
position-independent code.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/argp-standalone/argp-standalone.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/argp-standalone/argp-standalone.mk b/package/argp-standalone/argp-standalone.mk
index 47c09b2..ba7f757 100644
--- a/package/argp-standalone/argp-standalone.mk
+++ b/package/argp-standalone/argp-standalone.mk
@@ -8,6 +8,9 @@ ARGP_STANDALONE_VERSION = 1.3
 ARGP_STANDALONE_SITE = http://www.lysator.liu.se/~nisse/archive
 ARGP_STANDALONE_INSTALL_STAGING = YES
 
+ARGP_STANDALONE_CONF_ENV = \
+	CFLAGS="$(TARGET_CFLAGS) -fPIC"
+
 define ARGP_STANDALONE_INSTALL_STAGING_CMDS
 	$(INSTALL) -D $(@D)/libargp.a $(STAGING_DIR)/usr/lib/libargp.a
 	$(INSTALL) -D $(@D)/argp.h $(STAGING_DIR)/usr/include/argp.h
-- 
1.7.9.5
