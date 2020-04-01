From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Apr 2020 22:16:51 +0200
Subject: [Buildroot] [git commit] package/nftables: check for python
Message-ID: <20200401200346.171D38A53B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6f33d36af353668fe09a93a111c529e4ac5eaa7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If python or python3 is selected, nftables should depend on the package
and set the --enable-python option, otherwise set --disable-python

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nftables/nftables.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 11ef6844ce..210e950c11 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -27,6 +27,13 @@ else
 NFTABLES_CONF_OPTS += --without-json
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
+NFTABLES_CONF_OPTS += --enable-python
+NFTABLES_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3)
+else
+NFTABLES_CONF_OPTS += --disable-python
+endif
+
 ifeq ($(BR2_STATIC_LIBS)$(BR2_PACKAGE_LIBNFTNL_JSON),yy)
 NFTABLES_LIBS += -ljansson -lm
 endif
