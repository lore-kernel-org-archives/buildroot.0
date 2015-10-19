From: Jan Viktorin <viktorin@rehivetech.com>
Date: Mon, 19 Oct 2015 18:24:50 +0200
Subject: [Buildroot] [PATCH 0/4] Attempt to improve support for Altera SoC
	FPGA boards
Message-ID: <1445271894-22553-1-git-send-email-viktorin@rehivetech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Buildroot community,

the following patch series attempts to improve support for building for
Altera SoC FPGA boards. I mean, I'd like to have it ready out-of-the-box.

The readme says that it is necessary to "sign" (it is now signing, just CRC
by the way) the SPL image in order to boot. I cannot ack this because my
SoC Development Kit (not the Arrow one!) boots normally with the generated
SPL. How is it possible then? Is it fixed in U-Boot? I doubt, didn't find it
there... I am confused about it.

I don't have the second board (Arrow SoCKit) to prove it boots without it.

Anyway, this series contains updates to the readme.txt and also adds mkpimage
package to support the "signing" of the SPL images. Those patches are not
very coherent and I do not expect to merge them at this stage.

Can somebody check whether the generated SPL boots on Arrow SoCKit?

If it does not, I would like to add the mkpimage package to Buildroot (however,
it requires a Go compiler).

If there is no issue, I would just leave the readme updates (an improve them
a bit).

Regards
Jan Viktorin

Jan Viktorin (4):
  mkpimage: new host package
  boot/uboot: compute CRC on SPLs for Altera SoC FPGA
  socfpga: update readme for sockit/socdk boards
  socfpga: note about unnecessary mkpimage of SPL

 board/altera/readme.txt      | 31 +++++++++++++++++--------------
 boot/uboot/Config.in         | 10 ++++++++++
 boot/uboot/uboot.mk          |  9 +++++++++
 package/mkpimage/mkpimage.mk | 28 ++++++++++++++++++++++++++++
 4 files changed, 64 insertions(+), 14 deletions(-)
 create mode 100644 package/mkpimage/mkpimage.mk

-- 
2.6.1
