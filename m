From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jan 2019 16:05:47 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] wireshark: disable build
 of user guide
Message-ID: <20190123151352.A12F2849D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55d9c073b23df9703b38f7d2f402f5aefb8273ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

--disable-guides has been added since version 2.5.0:
https://github.com/wireshark/wireshark/commit/aa04d2355effb1cf611831b0a260cf1aff199b9a

Fixes:
 - http://autobuild.buildroot.org/results/5ae6d46573942713687f4e659b3eaf0b768ebc71

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 92c32d389026222c6296094ec00e2cc03b1fab9d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index bb0d570391..468229df3f 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -16,6 +16,7 @@ WIRESHARK_CONF_ENV = \
 
 WIRESHARK_CONF_OPTS = \
 	--without-krb5 \
+	--disable-guides \
 	--enable-static=no \
 	--without-bcg729 \
 	--without-libxml2 \
