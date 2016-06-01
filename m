From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed,  1 Jun 2016 11:39:38 -0300
Subject: [Buildroot] [PATCH next 0/4] uboot-tools: fix support for Flat
	Image Trees (FIT).
In-Reply-To: <1462736800-9552-1-git-send-email-casantos@datacom.ind.br>
References: <1462736800-9552-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <1464791982-10166-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current package is partially broken due to a bug in Das U-Boot. FIT
support is always built but requires the "dtc" utility, which is not
available because uboot-tools does not depend on it. Additionally, the
BR2_STRIP_xxxx setup is ignored and the utilities are always stripped.

This series fixes the bugs and introduces a more fine-grained selection
of features for both host and target packages,

Carlos Santos (4):
  uboot-tools: use $(TARGET_STRIP) for target utilities
  uboot-tools: improve the help text of existing options
  uboot-tools: re-generate patches to match v2016.05
  uboot-tools: fix FIT support and make it optional

 Config.in.legacy                                   | 16 ++++
 .../uboot-tools/0001-drop-configh-from-tools.patch | 14 ++--
 .../0002-tools-only-in-no-dot-config-targets.patch | 19 ++---
 .../0003-Make-FIT-support-really-optional.patch    | 93 ++++++++++++++++++++++
 package/uboot-tools/Config.in                      | 35 ++++++--
 package/uboot-tools/Config.in.host                 | 16 ++++
 package/uboot-tools/uboot-tools.mk                 | 57 +++++++------
 7 files changed, 201 insertions(+), 49 deletions(-)
 create mode 100644 package/uboot-tools/0003-Make-FIT-support-really-optional.patch

-- 
2.7.4
