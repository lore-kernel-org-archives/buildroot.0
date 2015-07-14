From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Tue, 14 Jul 2015 12:11:01 -0300
Subject: [Buildroot] [PATCH v4 0/3] Add ARM Cortex-M3 support
In-Reply-To: <1435340002-20396-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1435340002-20396-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <1436886664-3206-1-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

this patchset introduces support for the M3 processors. These processors
don't have an MMU and they don't support the regular ARM mode (only
Thumb and Thumb2).

The OSELAS 2014.12.0 toolchain is added, in 32-bit and 64-bit variants.

I'm planning to send a defconfig for the CIAA board[1] once it's
mainlined in Linux. But, for now, this config can generate a proper
rootfs:
  BR2_arm=y
  BR2_cortex_m3=y

The changes from v3 are:
  * Patches 1 and 2 were committed, so dropped.

  * Add x86 and x86_64 versions of the toolchain, as suggested by Yann.

  * Drop the HAS_RESOLVER patch and just disable nslookup from the
    default busybox config.

  * Disable the internal toolchain for Cortex-M3. It won't work for now
    since ARM instructions are used as a fall back in some cases.

Any comments and testing welcome!

[1] http://www.proyecto-ciaa.com.ar/

Guido Mart?nez (3):
  busybox: disable nslookup applet
  toolchain-external: add OSELAS 2014.12.0 Cortex-M3 toolchain
  toolchain: disable internal for blackfin

 package/busybox/busybox.config                       |  2 +-
 toolchain/Config.in                                  |  1 +
 toolchain/toolchain-external/Config.in               | 12 ++++++++++++
 toolchain/toolchain-external/toolchain-external.hash |  6 ++++++
 toolchain/toolchain-external/toolchain-external.mk   | 14 ++++++++++++++
 5 files changed, 34 insertions(+), 1 deletion(-)

-- 
2.1.4
