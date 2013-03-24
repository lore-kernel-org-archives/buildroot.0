From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 09:26:38 +0100
Subject: [Buildroot] [PATCH 14/22] gettext: provide a host variant
In-Reply-To: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364113606-20836-15-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In preparation for the removal of gettext as a hard dependency, we
need to be able to provide a host variant of gettext for the few
packages that require msgfmt.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gettext/gettext.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index d374050..fe42c42 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -56,3 +56,4 @@ GETTEXT_POST_PATCH_HOOKS += GETTEXT_DISABLE_TOOLS
 GETTEXT_POST_PATCH_HOOKS += GETTEXT_DISABLE_TESTS
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
\ No newline at end of file
-- 
1.7.9.5
