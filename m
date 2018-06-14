From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 14 Jun 2018 21:38:48 +0300
Subject: [Buildroot] [PATCH] autossh: fix manual set of ssh path
Message-ID: <48dfa0b109e0ae3b807a77444106a0aa6d8768d6.1529001528.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure script that is bundled with autossh does not generate the
correct code for the AC_ARG_WITH() macro of --with-ssh. As a result, the
configure scripts always check the host location, and fails with ssh is
not found.

Restore the autoreconf that has been removed in the last bump to fix the
--with-ssh configure option.

Fixes:
http://autobuild.buildroot.net/results/25d/25d681f9df22c07cdf5a6b8756bfc2d5ecf36247/
http://autobuild.buildroot.net/results/f0a/f0ae62d0ed6bac011c507cfea7cd7157671baf39/
http://autobuild.buildroot.net/results/b15/b1546bb3e861c14771bdd03cda9ce2e9176a2069/

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/autossh/autossh.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/autossh/autossh.mk b/package/autossh/autossh.mk
index 1538a4c8bcfb..9b0df3a34b4a 100644
--- a/package/autossh/autossh.mk
+++ b/package/autossh/autossh.mk
@@ -9,6 +9,7 @@ AUTOSSH_SITE = http://www.harding.motd.ca/autossh
 AUTOSSH_SOURCE = autossh-$(AUTOSSH_VERSION).tgz
 AUTOSSH_LICENSE = Modified BSD
 AUTOSSH_LICENSE_FILES = autossh.c
+AUTOSSH_AUTORECONF = YES
 
 AUTOSSH_CONF_OPTS = --with-ssh=/usr/bin/ssh
 
-- 
2.17.1
