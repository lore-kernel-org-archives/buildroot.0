From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jun 2021 08:32:10 +0200
Subject: [Buildroot] [git commit branch/2021.05.x] package/openswan: disable
 -Werror
Message-ID: <20210623060732.631938DAD8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06f9da4013b200c3a2b16b78ee178714610a8e7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Disable -Werror to avoid the following build failure with -DNDEBUG
raised since commit 5a8c50fe05afacc3cbe8e7347e238da9f242fab0

/srv/storage/autobuild/run/instance-2/output-1/build/openswan-3.0.0/programs/rsasigkey/rsasigkey.c:524:6: error: variable 'success' set but not used [-Werror=unused-but-set-variable]
  524 |  int success;
      |      ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/327a0f2b8f0c51bcbb3edb1c3671870d593e93b9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit cc1c8c3bb1ca4a1f1d2978f3cc100d292c70db8b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openswan/openswan.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index 7f083f695d..bb56e4516c 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -15,7 +15,7 @@ OPENSWAN_MAKE_OPTS = ARCH=$(BR2_ARCH) CC="$(TARGET_CC)" POD2MAN="" XMLTO="" \
 	USERCOMPILE="$(TARGET_CFLAGS) $(if $(BR2_TOOLCHAIN_SUPPORTS_PIE),-fPIE)" \
 	USERLINK="$(TARGET_LDFLAGS) $(if $(BR2_TOOLCHAIN_SUPPORTS_PIE),-fPIE)" \
 	INC_USRLOCAL=/usr USE_KLIPS=false USE_MAST=false USE_NM=false \
-	USE_NOMANINSTALL=true
+	USE_NOMANINSTALL=true WERROR=""
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 OPENSWAN_DEPENDENCIES += libcurl
