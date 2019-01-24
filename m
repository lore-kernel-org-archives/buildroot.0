From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 17:17:35 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/lxc: add optional
 dependency to bash-completion
Message-ID: <20190124161708.A282A8E451@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ab0ca5e38da8cbe225735f0469ea5afcfa4797a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

lxc uses the completionsdir variable from bash-completions.pc to decide
where to install things.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 61a425590a71d232480181431eb0073ad0c420a9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lxc/lxc.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index c9838fb229..c758a15b9d 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -17,6 +17,10 @@ LXC_CONF_OPTS = --disable-apparmor --with-distro=buildroot \
 	--disable-werror \
 	$(if $(BR2_PACKAGE_BASH),,--disable-bash)
 
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+LXC_DEPENDENCIES += bash-completion
+endif
+
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 LXC_CONF_OPTS += --enable-gnutls
 LXC_DEPENDENCIES += gnutls
