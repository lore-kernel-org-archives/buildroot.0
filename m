From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Feb 2020 13:16:58 +0100
Subject: [Buildroot] [git commit] package/ipsec-tools: annotate _IGNORE_CVES
 for the included security patches
Message-ID: <20200220120646.9F0CF82DF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dde8aa05b982f80febdc2837da7eaa5e79606e14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipsec-tools/ipsec-tools.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index 634d752661..72bd8c196c 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -15,6 +15,11 @@ IPSEC_TOOLS_DEPENDENCIES = openssl flex host-pkgconf host-flex host-bison
 # we patch configure.ac
 IPSEC_TOOLS_AUTORECONF = YES
 
+# 0004-CVE-2015-4047.patch
+IPSEC_TOOLS_IGNORE_CVES += CVE-2015-4047
+# 0005-CVE-2016-10396.patch
+IPSEC_TOOLS_IGNORE_CVES += CVE-2016-10396
+
 # configure hardcodes -Werror, so override CFLAGS on make invocation
 IPSEC_TOOLS_MAKE_OPTS = CFLAGS='$(TARGET_CFLAGS)'
 
