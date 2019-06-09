From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 9 Jun 2019 23:25:40 +0200
Subject: [Buildroot] [git commit] package/iputils: fix IDN support
Message-ID: <20190609212531.266398DF8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=569f95acbb0dba797f7fb7fc1d5c845155bc28ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

iputils depends on libidn2 since version s20180629 and
https://github.com/iputils/iputils/commit/665fe4d30ff8b6649454ae25e4768b2f23605332

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/iputils/iputils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index f0902c7038..2b326838f7 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -24,9 +24,9 @@ else
 IPUTILS_CONF_OPTS += -DUSE_CAP=false
 endif
 
-ifeq ($(BR2_PACKAGE_LIBIDN),y)
+ifeq ($(BR2_PACKAGE_LIBIDN2),y)
 IPUTILS_CONF_OPTS += -DUSE_IDN=true
-IPUTILS_DEPENDENCIES += libidn
+IPUTILS_DEPENDENCIES += libidn2
 else
 IPUTILS_CONF_OPTS += -DUSE_IDN=false
 endif
