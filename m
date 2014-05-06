From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue,  6 May 2014 12:59:45 +0200
Subject: [Buildroot] [PATCH] nftables: disable dblatex check
Message-ID: <1399373985-12045-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

On the systems with old dblatex (for example 3.0) the build step will
fail, because dblatex doesn't support '-q' parameter. This patch
overrides dblatex check.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/nftables/nftables.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 1cfeeeb..4cfffd1 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -12,4 +12,6 @@ NFTABLES_DEPENDENCIES = gmp libmnl libnftnl readline host-bison host-flex \
 NFTABLES_LICENSE = GPLv2
 NFTABLES_LICENSE_FILES = COPYING
 
+NFTABLES_CONF_ENV = ac_cv_prog_CONFIG_PDF=no
+
 $(eval $(autotools-package))
-- 
1.7.7
