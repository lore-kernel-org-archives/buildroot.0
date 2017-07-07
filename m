From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 7 Jul 2017 23:04:39 +0200
Subject: [Buildroot] [PATCH] util-linux: remove leftover comment
Message-ID: <20170707210439.28530-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We no longer have automatic derivation of DEPENDENCIES for host
packages, so the comment that we don't want a host-busybox dependency
is no longer valid.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/util-linux/util-linux.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index bf55badfc4..29cbfeb5a1 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -33,7 +33,6 @@ UTIL_LINUX_CONF_OPTS += \
 	--without-systemd \
 	--with-systemdsystemunitdir=no
 
-# We don't want the host-busybox dependency to be added automatically
 HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
 
 # We also don't want the host-python dependency
-- 
2.13.2
