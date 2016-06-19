From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Jun 2016 10:54:48 +0200
Subject: [Buildroot] [git commit] autofs: force hesiod and kerberos off
Message-ID: <20160619085506.AE50281999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5ea4d3d067185a61e8b2e2657b1274bc4666ec5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we don't have such packages in buildroot it can pick up the distro
config scripts and pollute the include path.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/autofs/autofs.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
index 622bbe0..8206720 100644
--- a/package/autofs/autofs.mk
+++ b/package/autofs/autofs.mk
@@ -14,6 +14,7 @@ AUTOFS_DEPENDENCIES = host-flex host-bison
 # autofs looks on the build machine for the path of modprobe, so tell
 # it explicitly where it will be located on the target.
 AUTOFS_CONF_ENV = \
+	ac_cv_path_KRB5_CONFIG=no \
 	ac_cv_path_MODPROBE=/sbin/modprobe
 
 # instead of looking in the PATH like any reasonable package, autofs
@@ -24,7 +25,8 @@ AUTOFS_CONF_OPTS = \
 	--enable-ignore-busy \
 	--without-openldap \
 	--without-sasl \
-	--with-path="$(BR_PATH)"
+	--with-path="$(BR_PATH)" \
+	--with-hesiod=no
 
 AUTOFS_MAKE_ENV = DONTSTRIP=1
 
