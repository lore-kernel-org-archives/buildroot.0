From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Fri,  8 Apr 2016 10:24:42 +0200
Subject: [Buildroot] [PATCH v3] package/turbolua: new package
Message-ID: <1460103883-7608-1-git-send-email-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This is the third attempt for adding turbolua. Changes include mostly
Thomas and Arnout suggestions.

Changes v2 -> v3:
 * Do not use SSL variable, set TURBOLUA_MAKE_OPTS instead
 * Remove dependency on !BR2_ARM_INSTRUCTIONS_THUMB2, as it is
   not clear what is the reason of crashes on Thumb2 target
 * Bump to upstream HEAD version to correctly pass LDFLAGS

Changes v1 -> v2:
 * Use TARGET_CONFIGURE_OPTS instead of CC and LD only
 * Bump to upstream HEAD version to handle TARGET_CONFIGURE_OPTS
   correctly
 * Add comment for dependency on disabled Thumb2
 * Reduce help block column size in Config.in
 * Add URL of the project homepage
 * Disable SSL support when OpenSSL is not selected

Marcin Niestroj (1):
  package/turbolua: new package

 package/Config.in              |  1 +
 package/turbolua/Config.in     | 15 +++++++++++++++
 package/turbolua/turbolua.hash |  2 ++
 package/turbolua/turbolua.mk   | 27 +++++++++++++++++++++++++++
 4 files changed, 45 insertions(+)
 create mode 100644 package/turbolua/Config.in
 create mode 100644 package/turbolua/turbolua.hash
 create mode 100644 package/turbolua/turbolua.mk

-- 
2.8.0
