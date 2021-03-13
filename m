From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Mar 2021 16:08:44 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/prosody: security
 bump to 0.11.8
Message-ID: <20210313144532.C3440865AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df6b120e9336f23a025264af254ef452c988ec02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

From the release notes:
https://blog.prosody.im/prosody-0.11.8-released/

This release also fixes a security issue, where channel binding, which
connects the authentication layer (i.e.  SASL) with the security layer (i.e.
TLS) to detect man-in-the-middle attacks, could be used on connections
encrypted with TLS 1.3, despite the holy texts declaring this undefined.

https://issues.prosody.im/1542

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Peter: mark as security bump, expand commit text]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9aba85e3f509498426bd37df8a043fdaa8220953)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/prosody/prosody.hash | 8 ++++----
 package/prosody/prosody.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
index dc4e567d4e..309ae0181f 100644
--- a/package/prosody/prosody.hash
+++ b/package/prosody/prosody.hash
@@ -1,8 +1,8 @@
 # Locally computed:
-md5  a9bf18a713804b5cc9d0322d1bf5d5d8  prosody-0.11.7.tar.gz
-sha1  425e1c7ca37464b31711da8eb4a4c9444a70360f  prosody-0.11.7.tar.gz
-sha256  28ffc07653485cb63e22b387d3ea4825ee2baaee0c5827de4d6053a35b1c8747   prosody-0.11.7.tar.gz
-sha512  923aa92598ef851ed8408931942859f78f1e3d700fee251f4f5ca67abdcdae43448318ed90a9a1cdc7824d5f4dc5a4732fad4b9ed36d97455fa9b3bff0881a20  prosody-0.11.7.tar.gz
+md5  24cd3c1f7ab16a6b3726423d2fff802d  prosody-0.11.8.tar.gz
+sha1  f1f030c75abde6e3c7232fedbe8371f5cb913245  prosody-0.11.8.tar.gz
+sha256  830f183b98d5742d81e908d2d8e3258f1b538dad7411f06fda5b2cc5c75068f8  prosody-0.11.8.tar.gz
+sha512  b0b7e1d3e41f47f0f88ad5b76444e4959b20f4c7a937f3cc605ba6ed5d92e713a3054dcb61ee6629063883a8f9ff1a03952893de4a0d840dcec4e5e42079eb57  prosody-0.11.8.tar.gz
 
 # Hash for license file:
 sha256 bbbdc1c5426e5944cf869fc0faeaf19d88a220cd2b39ea98b7b8e86b0e88a2ef  COPYING
diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index ad51f6797e..b2641545b9 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROSODY_VERSION = 0.11.7
+PROSODY_VERSION = 0.11.8
 PROSODY_SITE = https://prosody.im/downloads/source
 PROSODY_LICENSE = MIT
 PROSODY_LICENSE_FILES = COPYING
