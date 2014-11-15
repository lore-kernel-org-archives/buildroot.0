From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Nov 2014 17:19:27 +0100
Subject: [Buildroot] [PATCH 2/4] pkg-infra: squash DOWNLOAD_INNER into
	DOWNLOAD
In-Reply-To: <cover.1416068004.git.yann.morin.1998@free.fr>
References: <cover.1416068004.git.yann.morin.1998@free.fr>
Message-ID: <9d66b4e4909c2ca7967f7d37566a27e48aaa0a47.1416068004.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We no longer have a need for a DOWNLOAD wrapper around DOWNLOAD_INNER,
since all it does is call DOWNLOAD_INNER with the exact same arguments
it was called with.

So, just squash the two macros into a single one.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-download.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 7e932e9..e10ae36 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -252,10 +252,6 @@ endef
 ################################################################################
 
 define DOWNLOAD
-	$(call DOWNLOAD_INNER,$(1),$(2))
-endef
-
-define DOWNLOAD_INNER
 	$(Q)if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
 		case "$(call geturischeme,$(BR2_PRIMARY_SITE))" in \
 			scp) $(call $(DL_MODE)_SCP,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
-- 
1.9.1
