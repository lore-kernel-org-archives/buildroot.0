From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Mar 2020 09:58:21 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/wpewebkit:
 security bump to version 2.26.4
Message-ID: <20200307110059.0A66F815D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb275e11e36d779b157aae464ca1efbd1860b43d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Fixes the following security issues:

- CVE-2020-3862: Impact: A malicious website may be able to cause a denial
  of service.  Description: A denial of service issue was addressed with
  improved memory handling.

- CVE-2020-3864: Impact: A DOM object context may not have had a unique
  security origin.  Description: A logic issue was addressed with improved
  validation.

- CVE-2020-3865: Impact: A top-level DOM object context may have incorrectly
  been considered secure.  Description: A logic issue was addressed with
  improved validation.

- CVE-2020-3867: Impact: Processing maliciously crafted web content may lead
  to universal cross site scripting.  Description: A logic issue was
  addressed with improved state management.

- CVE-2020-3868: Impact: Processing maliciously crafted web content may lead
  to arbitrary code execution.  Description: Multiple memory corruption
  issues were addressed with improved memory handling.

For more details, see the advisory:
https://wpewebkit.org/security/WSA-2020-0002.html

While we are at it, adjust the white space in the .hash function to match
the new agreements.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit abafaedd05e1ca5eed3c793c34d3f1ad58d09a18)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpewebkit/wpewebkit.hash | 12 ++++++------
 package/wpewebkit/wpewebkit.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 07a06466d0..fd78264914 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,8 +1,8 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.26.3.tar.xz.sums
-md5 735beb5c1f825d5feda2e355aca6bec0 wpewebkit-2.26.3.tar.xz
-sha1 aeda665b3a137ac748ff1d08ce9e4c751f7caf97 wpewebkit-2.26.3.tar.xz
-sha256 2da9fe9c3a8bdfecc4281d848a4eacdd7be8ac5e0fc397020094d68cf32c10b3 wpewebkit-2.26.3.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.26.4.tar.xz.sums
+md5  4cd2883ec9da38a0ffe413bb75239874  wpewebkit-2.26.4.tar.xz
+sha1  337f78ee237fe98c7e6e728d8fc0508069b007be  wpewebkit-2.26.4.tar.xz
+sha256  0c292182864b63b725491f1a69b55c03e0e75f6db0875389caff31fe9c0d3ae9  wpewebkit-2.26.4.tar.xz
 
 # Hashes for license files:
-sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
-sha256 f2b3bd09663381deb99721109d22b47af1213bb43007a8b56a06c6375c8050ce Source/WebCore/LICENSE-LGPL-2.1
+sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
+sha256  f2b3bd09663381deb99721109d22b47af1213bb43007a8b56a06c6375c8050ce  Source/WebCore/LICENSE-LGPL-2.1
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index e823e0d4e4..c94e979d62 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.26.3
+WPEWEBKIT_VERSION = 2.26.4
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
