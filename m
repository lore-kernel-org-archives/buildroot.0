From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2013 17:25:47 +0100
Subject: [Buildroot] [git commit] util-linux: tweak sscanf-no-ms-as patch
Message-ID: <20131128162659.415EE9BE35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=62d15df19a0d181a266a88b46525d0d4959c8739
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch has a minor mistake so fix it.
Credit go to Daniel Mentz <daniel@exxm.de> for the detailed bug report.
Closes bug #6428

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../util-linux-001-sscanf-no-ms-as.patch           |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/util-linux/util-linux-001-sscanf-no-ms-as.patch b/package/util-linux/util-linux-001-sscanf-no-ms-as.patch
index 72a060e..c95b755 100644
--- a/package/util-linux/util-linux-001-sscanf-no-ms-as.patch
+++ b/package/util-linux/util-linux-001-sscanf-no-ms-as.patch
@@ -124,7 +124,7 @@ ported to util-linux-2.23.2
  			"%jd"		/* (4) used */
  			"%d",		/* priority */
  
-+#ifndef HAVE_SCANF_MS_MODIFIER
++#ifdef HAVE_SCANF_MS_MODIFIER
  			&src,
  			&fs->swaptype,
 +#else
