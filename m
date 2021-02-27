From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2021 19:06:03 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/unbound: bump to
 version 1.13.1
Message-ID: <20210227182007.C0F6C814CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=862cb008946091d92f8745e4af2c595a0adc78e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

This release contains a number of bug fixes. There is added support
for the EDNS Padding option (RFC7830 and RFC8467), and the EDNS NSID
option (RFC 5001). Unbound control has added commands to enable and
disable rpz processing. Reply callbacks have a start time passed to
them that can be used to calculate time, these are callbacks for
response processing. With the option serve-original-ttl the TTL served
in responses is the original, not counted down, value, for when in
front of authority service.

https://github.com/NLnetLabs/unbound/releases/tag/release-1.13.1

Signed-off-by: Stefan Ott <stefan@ott.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 048f7723543a8d6b8f24942c0e6eab7e2a3c87ce)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/unbound/unbound.hash | 4 ++--
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index 9ccea6eb88..ec7e940791 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,5 +1,5 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.13.0.tar.gz.sha256
-sha256  a954043a95b0326ca4037e50dace1f3a207a0a19e9a4a22f4c6718fc623db2a1  unbound-1.13.0.tar.gz
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.13.1.tar.gz.sha256
+sha256  8504d97b8fc5bd897345c95d116e0ee0ddf8c8ff99590ab2b4bd13278c9f50b8  unbound-1.13.1.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 8b7d1e8e9f..cec3195b9b 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.13.0
+UNBOUND_VERSION = 1.13.1
 UNBOUND_SITE = https://www.unbound.net/downloads
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
 UNBOUND_LICENSE = BSD-3-Clause
