From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Mon, 9 May 2016 10:27:12 +0100
Subject: [Buildroot] [PATCH 0/2] new package: atfirmware
In-Reply-To: <cover.1462269854.git.jpinto@synopsys.com>
References: <cover.1462269854.git.jpinto@synopsys.com>
Message-ID: <573057F0.3000606@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,
I will have to give a Juno training soon, and this feature would be great to
have in the time. Could you comment of the atfirmware patch? Do you have any
improvement suggestions?

Thanks.

On 5/3/2016 11:13 AM, Joao Pinto wrote:
> This patch adds to buildroot an important package for ARM64 based development 
> boards: The ARM Trusted Firmware (atfirmware).
> It also adds the scpfirmware which is a hidden package to get the System Control
> Processor (SCP) binary to be included in the bootloader (fip image), which is
> a requirement for ARM Juno's board. With this 2 packages, Juno gets fully 
> supported in the Buildroot.
> 
> Joao Pinto (2):
>   new packages: atfirmware and scpfirmware
>   configs: add u-noot and atfirmware options to juno
> 
>  board/arm/juno/readme.txt       | 21 ++++++++--
>  boot/Config.in                  |  2 +
>  boot/atfirmware/Config.in       | 70 +++++++++++++++++++++++++++++++++
>  boot/atfirmware/atfirmware.hash |  5 +++
>  boot/atfirmware/atfirmware.mk   | 85 +++++++++++++++++++++++++++++++++++++++++
>  boot/scpfirmware/Config.in      | 23 +++++++++++
>  boot/scpfirmware/scpfirmware.mk | 18 +++++++++
>  configs/arm_juno_defconfig      |  9 +++++
>  8 files changed, 230 insertions(+), 3 deletions(-)
>  create mode 100644 boot/atfirmware/Config.in
>  create mode 100644 boot/atfirmware/atfirmware.hash
>  create mode 100644 boot/atfirmware/atfirmware.mk
>  create mode 100644 boot/scpfirmware/Config.in
>  create mode 100644 boot/scpfirmware/scpfirmware.mk
> 
