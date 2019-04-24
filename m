From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 21:58:56 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/msmtp: drop
 unneeded static openssl workaround
Message-ID: <20190424195441.A03F281287@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5af3db74613c634557f5447e572a2be6d54ddf00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

msmtp uses pkg-config to find openssl dependencies such as lz or latomic
so drop unneeded openssl workaround that was added by
https://git.buildroot.net/buildroot/commit/package/msmtp?id=468bbc1538aaea87beaf455a2ad6ea5a255d5f58

I don't know why it was added seven years ago as msmtp already used
pkg-config at this time:
https://github.com/marlam/msmtp-mirror/blob/rel-1-4-27/configure.ac

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 117108d59c32b29d332454f63d491ed63321e754)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/msmtp/msmtp.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index 079c7c2319..db3d42cd94 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -46,10 +46,6 @@ MSMTP_DEPENDENCIES += gnutls
 else ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MSMTP_CONF_OPTS += --with-tls=openssl
 MSMTP_DEPENDENCIES += openssl
-ifeq ($(BR2_STATIC_LIBS),y)
-# openssl uses zlib, so we need to explicitly link with it when static
-MSMTP_CONF_ENV += LIBS=-lz
-endif
 else
 MSMTP_CONF_OPTS += --with-tls=no
 endif
