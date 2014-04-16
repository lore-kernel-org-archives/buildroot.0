From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Apr 2014 19:29:33 +0200
Subject: [Buildroot] [git commit] Makefile: add PATH to the
	USER_HOOKS_EXTRA_ENV
Message-ID: <20140416172939.7893A9C80D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=57eb048c302db6f71c3b486c57bc32cb6c1b16fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This can be useful for post-{build,image} scripts, in case some host-tools
were specifically built to be used by these scripts.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 3549f15..31eaaf2 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -302,6 +302,7 @@ HOST_MAKE_ENV=PATH=$(BR_PATH) \
 # explicitly pass it to user-supplied external hooks (eg. post-build,
 # post-images)
 USER_HOOKS_EXTRA_ENV=\
+	PATH=$(BR_PATH) \
 	BUILD_DIR=$(BUILD_DIR)
 
 ################################################################################
