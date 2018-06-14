From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 14 Jun 2018 21:00:34 +0200
Subject: [Buildroot] [PATCH 1/1] autossh: put back AUTORECONF
Message-ID: <20180614190034.10022-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cabf1d658ebc878088e8ee592549d412f8f82f6f wrongly removed AUTORECONF=YES
indeed configure is still not up to date.
Without it, --with-ssh option is not taken into account and so build
fails if ssh is not installed in PATH.

Fixes:
 - http://autobuild.buildroot.net/results/25d681f9df22c07cdf5a6b8756bfc2d5ecf36247

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/autossh/autossh.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/autossh/autossh.mk b/package/autossh/autossh.mk
index 1538a4c8bc..f2869e726f 100644
--- a/package/autossh/autossh.mk
+++ b/package/autossh/autossh.mk
@@ -10,6 +10,9 @@ AUTOSSH_SOURCE = autossh-$(AUTOSSH_VERSION).tgz
 AUTOSSH_LICENSE = Modified BSD
 AUTOSSH_LICENSE_FILES = autossh.c
 
+# Bundled ./configure is not up-to-date with what is in configure.ac
+AUTOSSH_AUTORECONF = YES
+
 AUTOSSH_CONF_OPTS = --with-ssh=/usr/bin/ssh
 
 $(eval $(autotools-package))
-- 
2.14.1
