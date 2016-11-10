From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Thu, 10 Nov 2016 08:05:34 +0100
Subject: [Buildroot] [PATCH v2 0/4] configs: atmel: update of old boards
Message-ID: <20161110070538.7193-1-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thomas reported me that some components (kernel or u-Boot) are no longer
compiling due to incompatibilities with the new default version of gcc.

Bump components to latest AT91bootstrap, U-Boot and kernel release.

Changes:
- v2:
  - Try to be consistent for the config order and comments with the latest
  defconfig submitted.
  - Stick to the latest version of U-Boot and Linux instead of using Buildroot
  default version.
  - at91sam9260eknf: replace Barebox by U-Boot since it is the prefered
  bootloaders and remove the useless defconfig file for the kernel.

Ludovic Desroches (4):
  configs: atmel: at91sam9260eknf: update defconfig
  configs: atmel: at91sam9rlek: update defconfig
  configs: atmel: at91sam9g20dfc: update defconfig
  configs: atmel: at91sam9g45m10ek: update defconfig

 board/atmel/at91sam9260ek/linux-3.9.config | 98 ------------------------------
 configs/at91sam9260eknf_defconfig          | 35 ++++++-----
 configs/at91sam9g20dfc_defconfig           | 38 ++++++------
 configs/at91sam9g45m10ek_defconfig         | 27 +++++---
 configs/at91sam9rlek_defconfig             | 27 +++++---
 5 files changed, 74 insertions(+), 151 deletions(-)
 delete mode 100644 board/atmel/at91sam9260ek/linux-3.9.config

-- 
2.9.0
