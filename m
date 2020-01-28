From: Adrian Martinez <adrian.martinez@sevensols.com>
Date: Tue, 28 Jan 2020 10:45:40 +0100
Subject: [Buildroot] Fwd: Building helloworld package
In-Reply-To: <CAL=12L3JEZrrx_vW=XYBob4x1_vN1yP+TNvtKH=UPOAM0Eg-9Q@mail.gmail.com>
References: <CAL=12L3JEZrrx_vW=XYBob4x1_vN1yP+TNvtKH=UPOAM0Eg-9Q@mail.gmail.com>
Message-ID: <CAL=12L0cJNEKwgZ7qVTs-4xGh2HNxCTBU7PsYa+iqpc4yd2HHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!! I have a ZCU102 (Xilinx) board and I'm trying to build a linux with a
simple package, helloworld.

I've been following this page -->
https://techfortalk.co.uk/2017/06/16/how-to-create-a-new-package-under-buildroot/

- My package/Config.in is:



*config BR2_PACKAGE_PAQPRUEBAADRI       bool "paqpruebaadri"       help
           This is sample package.*

- My package/paq_prueba_adri.mk is:



















*paqpruebaadri_MODULE_VERSION = 1.0paqpruebaadri_SITE =
/home/adrian/Documents/codigo_holamundopaqpruebaadri_SITE_METHOD =
localpaqpruebaadri_LICENSE = GPLv2paqpruebaadri_LICENSE_FILES =
COPYINGpaqpruebaadri_MODULE_MAKE_OPTS = \        CONFIG_DUMMY1= \
CONFIG_DUMMY2=ydefine ADRI_BUILD_CMDS$(MAKE) CC="$(TARGET_CC)"
LD="$(TARGET_LD)" -C $(@D) allendefdefine
ADRI_INSTALL_TARGET_CMDS$(INSTALL) -D -m 0755 $(@D)/adritest
$(TARGET_DIR)/bin$(INSTALL) -D -m 0755 $(@D)//run_adritest.sh
$(TARGET_DIR)/bin$(TARGET_DIR)/rootendef $(eval $(generic-package))*

- And, inside of the main Config.in, I've written:

















*menu "Target packages" source "package/busybox/Config.in" source
"package/skeleton/Config.in" source "package/skeleton-custom/Config.in"
source "package/skeleton-init-common/Config.in" source
"package/skeleton-init-none/Config.in" source
"package/skeleton-init-systemd/Config.in" source
"package/skeleton-init-sysv/Config.in"--> menu "Paq prueba
ADRI"                                            <---->         source
"package/paq_prueba_adri/Config.in"  <---->
endmenu
<--menu "Audio and video applications" source
"package/alsa-utils/Config.in" source "package/atest/Config.in".*
*.*

*.*

- The code and make files are:






*#include <stdio.h>int main(){        printf("Hola mundo");        return
0;}*



*holamundo:
/home/adrian/Documents/ZCU-102/buildroot-2019.02.3/output/host/usr/bin/aarch64-linux-gnu-gcc
holamundo.c*

But, when I boot the board, I don't find anything about my package.
Am I following the correct steps?

Thanks, Adri?n.

-- 
?This e-mail and any materials attached hereto, including, without 
limitation, all content hereof and thereof are confidential and proprietary 
to Seven Solutions,S.L and/or its affiliates, and are *confidential*. 
Without the prior written consent of Seven Solutions, this content may not 
(i) be disclosed to any third party, (ii) be reproduced, modified or 
otherwise used by anyone other than current employees of Seven Solutions or 
its affiliates. If you are not the intended recipient or if this message 
has been received in error, please notify us immediately via e-mail and 
delete it.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200128/de695a52/attachment.html>
