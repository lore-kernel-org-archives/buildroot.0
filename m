From: Philip Molloy <philip@philipmolloy.com>
Date: Tue, 02 Apr 2019 20:47:04 +0000
Subject: [Buildroot] Building U-Boot tools from the same source as U-Boot
Message-ID: <2Y33zxBDORlgwoH3fxYVQaMDaUMU8f0QA0bJxUmQoZOTBYSE82zmf7279qlnT894bLCWFPcQRJXYtmlzbiv1b_GBOAT6iR7HN3s0qny9XvI=@philipmolloy.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I maintain a slightly patched up-to-date mainline U-Boot at work. I point to that using BR2_TARGET_UBOOT_CUSTOM_GIT. I noticed today that the U-Boot user space tools (i.e. fw_printenv and fw_setenv) were built with a default environment that doesn't match our custom environment that we store in a text file and gets compiled into the U-Boot binary and a standalone U-Boot binary environment.

The default environment that finds its way into the tools is defined here:
http://git.denx.de/?p=u-boot.git;a=blob;f=tools/env/fw_env_private.h;h=86be16dabc621b61e2f97274457042f76d39d0f6;hb=HEAD#l48

If the environment is corrupted the tool will print a warning and use the default environment that is compiled into the tool, but not error out.

Is there a way to use the same source for BR2_TARGET_UBOOT and BR2_PACKAGE_UBOOT_TOOLS? It seems like that would be a good practice anyway, but appears to be especially important in this case.

Best,
Philip
