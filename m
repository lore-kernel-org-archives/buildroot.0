From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 20 Jul 2015 19:47:52 +0200
Subject: [Buildroot] [PATCH 04/11] package/neard: remove autoreconf
In-Reply-To: <1437414479-16714-1-git-send-email-romain.naour@openwide.fr>
References: <1437414479-16714-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437414479-16714-4-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

neard have been bumped several time since autoreconf
was added in neard.mk.
autoreconf seems not needed anymore.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/neard/neard.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/neard/neard.mk b/package/neard/neard.mk
index fc92421..ed2c6b1 100644
--- a/package/neard/neard.mk
+++ b/package/neard/neard.mk
@@ -10,7 +10,6 @@ NEARD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/nfc
 NEARD_LICENSE = GPLv2
 NEARD_LICENSE_FILES = COPYING
 
-NEARD_AUTORECONF = YES
 NEARD_DEPENDENCIES = host-pkgconf dbus libglib2 libnl
 NEARD_CONF_OPTS = --disable-traces
 
-- 
2.4.3
