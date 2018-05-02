From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 May 2018 21:56:37 +0200
Subject: [Buildroot] [git commit] core/pkg-infra: check for an SCM in the
 correct variable
Message-ID: <20180502195713.731D38B4E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e85734709e0da78cc399c1b85655528e2d5f209
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The site method is stored in FOO_SITE_METHOD, not in FOO_SITE.

Fixes:
http://autobuild.buildroot.net/results/131/13196dd779bc9e3b172c74851546dd4c4752aa02/

[Peter: add autobuilder reference]
Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
