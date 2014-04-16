From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Apr 2014 19:28:44 +0200
Subject: [Buildroot] [git commit] Makefile: add $(HOST_DIR)/sbin to BR_PATH
Message-ID: <20140416172939.530D29BF11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c7d660b18e4874073f5affef3da71d588700593c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Extend BR_PATH because a few host-packages install programs in this
location.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index fb0493d..137921c 100644
--- a/Makefile
+++ b/Makefile
@@ -331,7 +331,7 @@ TAR_OPTIONS=$(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 HOST_DIR:=$(call qstrip,$(BR2_HOST_DIR))
 
 # Quotes are needed for spaces and all in the original PATH content.
-BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin:$(PATH)"
+BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin:$(PATH)"
 
 # locales to generate
 GENERATE_LOCALE=$(call qstrip,$(BR2_GENERATE_LOCALE))
