From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  2 May 2018 21:50:38 +0200
Subject: [Buildroot] [PATCH] core/pkg-infra: check for an SCM in the correct
 variable
Message-ID: <20180502195038.16092-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The site method is stored in FOO_SITE_METHOD, not in FOO_SITE.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index e9ee88882c..a303dc2e07 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -483,7 +483,7 @@ ifndef $(2)_PATCH
  endif
 endif
 
-ifneq ($$(filter bzr cvs hg svn,$$($(2)_SITE)),)
+ifneq ($$(filter bzr cvs hg svn,$$($(2)_SITE_METHOD)),)
 BR_NO_CHECK_HASH_FOR += $$($(2)_SOURCE)
 endif
 
-- 
2.14.1
