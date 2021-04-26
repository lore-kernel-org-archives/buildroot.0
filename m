From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 21:09:46 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/coreutils: ignore
 CVE-2013-0221, CVE-2013-0222, CVE-2013-0223
Message-ID: <20210426203328.3B33A85F4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2fd0c8d540c408de07fe119d342c4d99753a08f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

This CVE is only relevant to a build when the SUSE coreutils-i18n.patch
is included. The upstream codebase does not include this patch, nor
does Buildroot.

https://security-tracker.debian.org/tracker/CVE-2013-0221
https://security-tracker.debian.org/tracker/CVE-2013-0222
https://security-tracker.debian.org/tracker/CVE-2013-0223

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8ae9156d8b730689484927fba2ec2fa6c1dc0433)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/coreutils/coreutils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 0e75cdfcda..65234a113e 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -10,6 +10,10 @@ COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPL-3.0+
 COREUTILS_LICENSE_FILES = COPYING
 COREUTILS_CPE_ID_VENDOR = gnu
+# Only when including SUSE coreutils-i18n.patch
+COREUTILS_IGNORE_CVES = CVE-2013-0221
+COREUTILS_IGNORE_CVES += CVE-2013-0222
+COREUTILS_IGNORE_CVES += CVE-2013-0223
 # We're patching m4/pthread-cond.m4
 COREUTILS_AUTORECONF = YES
 
