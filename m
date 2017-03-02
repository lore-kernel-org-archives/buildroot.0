From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 22:47:45 +0100
Subject: [Buildroot] [git commit] ljlinenoise: remove default definition of
	PKG_SUBDIR
Message-ID: <20170302215348.39904822BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4be4d75916ec7c4908428fca204e53a9679ce0cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The luarocks infra already provides the correct default value for
PKG_SUBDIR, so it doesn't have to be defined in the .mk file.

Therefore, _VERSION_UPSTREAM doesn't need to be defined either.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ljlinenoise/ljlinenoise.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/ljlinenoise/ljlinenoise.mk b/package/ljlinenoise/ljlinenoise.mk
index aca6358..edcbdc9 100644
--- a/package/ljlinenoise/ljlinenoise.mk
+++ b/package/ljlinenoise/ljlinenoise.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-LJLINENOISE_VERSION_UPSTREAM = 0.1.2
-LJLINENOISE_VERSION = $(LJLINENOISE_VERSION_UPSTREAM)-1
-LJLINENOISE_SUBDIR = ljlinenoise-$(LJLINENOISE_VERSION_UPSTREAM)
+LJLINENOISE_VERSION = 0.1.2-1
 LJLINENOISE_LICENSE = MIT
 LJLINENOISE_LICENSE_FILES = $(LJLINENOISE_SUBDIR)/COPYRIGHT
 
