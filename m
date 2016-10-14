From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Fri, 14 Oct 2016 16:18:30 +0100
Subject: [Buildroot] [PATCHv3 0/3] new packages: atfirmware and scpfirmware
Message-ID: <cover.1476458119.git.jpinto@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds to buildroot an important package for ARM64 based development 
boards: The ARM Trusted Firmware (atfirmware).
It also adds the scpfirmware which is a hidden package to get the System Control
Processor (SCP) binary to be included in the bootloader (fip image), which is
a requirement for ARM Juno's board. With this 2 packages, Juno gets fully 
supported in the Buildroot.

Tested-by: Liviu Dudau <Liviu.Dudau@arm.com>

Joao Pinto (3):
  new package: atfirmware
  new package: scpfirmware
  configs: add u-boot and atfirmware options to juno

 board/arm/juno/readme.txt       | 21 ++++++++--
 boot/Config.in                  |  2 +
 boot/atfirmware/Config.in       | 70 +++++++++++++++++++++++++++++++++
 boot/atfirmware/atfirmware.hash |  5 +++
 boot/atfirmware/atfirmware.mk   | 85 +++++++++++++++++++++++++++++++++++++++++
 boot/scpfirmware/Config.in      | 23 +++++++++++
 boot/scpfirmware/scpfirmware.mk | 18 +++++++++
 configs/arm_juno_defconfig      |  9 +++++
 8 files changed, 230 insertions(+), 3 deletions(-)
 create mode 100644 boot/atfirmware/Config.in
 create mode 100644 boot/atfirmware/atfirmware.hash
 create mode 100644 boot/atfirmware/atfirmware.mk
 create mode 100644 boot/scpfirmware/Config.in
 create mode 100644 boot/scpfirmware/scpfirmware.mk

-- 
1.8.1.5
