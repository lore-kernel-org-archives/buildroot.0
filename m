From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Jun 2018 13:13:58 +0200
Subject: [Buildroot] [git commit] autossh: fix manual set of ssh path
Message-ID: <20180615111559.7B6D0886BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=acf255e559c60eea03409ae457d673261910e9f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/autossh/autossh.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/autossh/autossh.mk b/package/autossh/autossh.mk
index 1538a4c8bc..5af8b735c2 100644
--- a/package/autossh/autossh.mk
+++ b/package/autossh/autossh.mk
@@ -9,6 +9,8 @@ AUTOSSH_SITE = http://www.harding.motd.ca/autossh
 AUTOSSH_SOURCE = autossh-$(AUTOSSH_VERSION).tgz
 AUTOSSH_LICENSE = Modified BSD
 AUTOSSH_LICENSE_FILES = autossh.c
+# Fix AC_ARG_WITH code generation for --with-ssh
+AUTOSSH_AUTORECONF = YES
 
 AUTOSSH_CONF_OPTS = --with-ssh=/usr/bin/ssh
 
