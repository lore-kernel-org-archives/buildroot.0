From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Oct 2019 09:59:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/libva: switch to virtual opengl
 provider
References: <20191012153931.24484-1-bernd.kuhls@t-online.de>
 <20191012214504.3db2b51e@windsurf>
Message-ID: <ncsq7gxjjs.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 12 Oct 2019 21:45:04 +0200 schrieb Thomas Petazzoni:

> Do all OpenGL implementation provide GLX support ? I would assume that
> in most practical cases, yes, but I'm wondering.

Hi Thomas,

three packages contain "select BR2_PACKAGE_HAS_LIBGL":

- amd-catalyst
- mesa3d
- nvidia-driver

Building libva with glx support was successful with these defconfigs:

BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17=y
BR2_PACKAGE_AMD_CATALYST=y
BR2_PACKAGE_LIBVA=y

BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_NVIDIA_DRIVER=y
BR2_PACKAGE_LIBVA=y

Regards, Bernd
