From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Apr 2016 13:50:03 +0200
Subject: [Buildroot] [git commit] package/cryptopp: Backport gcc
	compatibility patch
Message-ID: <20160428115012.1B0D581E7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4ccab90608efca6a7c753a4980c546a61f715ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Import patch from cryptopp upstream which fixes the gcc version checks
for using attribute deprecated with messages. Fixes build with host
gcc versions < 4.5.

Signed-off-by: Julian Scheel <julian@jusst.de>
[Thomas:
 - directly use the patch from upstream through <pkg>_PATCH rather
   than storing it in package/cryptopp/, as it helps avoiding
   line-endings problems: upstream has the source code with DOS line
   endings.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cryptopp/cryptopp.hash | 1 +
 package/cryptopp/cryptopp.mk   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/cryptopp/cryptopp.hash b/package/cryptopp/cryptopp.hash
index 3af7183..bf59c04 100644
--- a/package/cryptopp/cryptopp.hash
+++ b/package/cryptopp/cryptopp.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256  9390670a14170dd0f48a6b6b06f74269ef4b056d4718a1a329f6f6069dc957c9  cryptopp563.zip
+sha256  74b88c2caf7cf843bdc74d3331adaf83e516167cc8eebe66a79612189549cfa4  f707b9ef1688d4429ca6239cf2dc236440974681.patch
diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index 887557d..df07cf6 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -7,6 +7,8 @@
 CRYPTOPP_VERSION = 5.6.3
 CRYPTOPP_SOURCE = cryptopp$(subst .,,$(CRYPTOPP_VERSION)).zip
 CRYPTOPP_SITE = http://cryptopp.com/
+# Upstream patch needed to fix the build with gcc < 4.5
+CRYPTOPP_PATCH = https://github.com/weidai11/cryptopp/commit/f707b9ef1688d4429ca6239cf2dc236440974681.patch
 CRYPTOPP_LICENSE = Boost-v1.0
 CRYPTOPP_LICENSE_FILES = License.txt
 CRYPTOPP_INSTALL_STAGING = YES
