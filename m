From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Apr 2021 09:28:35 +0200
Subject: [Buildroot] [git commit] package/bash: drop SHOBJ_STATUS from
 BASH_CONF_ENV
Message-ID: <20210424072119.4C9F681343@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24656c23f9302a032de1d3b6527a221614102636
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SHOBJ_STATUS=unsupported was added in commit
4a2af11cba83ef176672609dd7321712fa7f6a28 to work around a limitation
of the configure script that forgot to set this variable in
static-linking configurations.

It turns out that this issue has been fixed upstream as of bash 5.0:

  https://git.savannah.gnu.org/cgit/bash.git/diff/configure.ac?id=d233b485e83c3a784b803fb894280773f16f2deb

  (see hunk @@ -1151,6 +1179,9 @@)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bash/bash.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 996c6a6097..31cb1f50a3 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -29,7 +29,6 @@ BASH_CONF_ENV += \
 # The static build needs some trickery
 ifeq ($(BR2_STATIC_LIBS),y)
 BASH_CONF_OPTS += --enable-static-link
-BASH_CONF_ENV += SHOBJ_STATUS=unsupported
 # bash wants to redefine the getenv() function. To check whether this is
 # possible, AC_TRY_RUN is used which is not possible in
 # cross-compilation.
