From: Tian Yuanhao <tianyuanhao@aliyun.com>
Date: Fri, 25 Sep 2020 10:31:43 +0800
Subject: [Buildroot] [PATCH 2/2] linux: support Image.gz on arm64 and
 riscv
In-Reply-To: <20200924122222.3449188-2-thomas.petazzoni@bootlin.com>
References: <20200924122222.3449188-1-thomas.petazzoni@bootlin.com>
 <20200924122222.3449188-2-thomas.petazzoni@bootlin.com>
Message-ID: <1601001103.10480.0.camel@aliyun.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On ?, 2020-09-24 at 14:22 +0200, Thomas Petazzoni wrote:
> Both arm64 and riscv allow generating a compressed Image.gz file, so
> let's support that as a first class citizen.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> ?linux/Config.in | 4 ++++
> ?linux/linux.mk??| 2 ++
> ?2 files changed, 6 insertions(+)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 9f2af6da5b..73b9c30b26 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -262,6 +262,10 @@ config BR2_LINUX_KERNEL_IMAGE
> ?	bool "Image"
> ?	depends on BR2_aarch64 || BR2_riscv
> ?
> +config BR2_LINUX_KERNEL_IMAGE_GZ
> +	bool "Image.gz"
> +	depends on BR2_aarch64 || BR2_riscv
> +
> ?config BR2_LINUX_KERNEL_LINUX_BIN
> ?	bool "linux.bin"
> ?	depends on BR2_microblaze
> diff --git a/linux/linux.mk b/linux/linux.mk
> index e07e014d1e..133023f78c 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -201,6 +201,8 @@ else ifeq ($(BR2_LINUX_KERNEL_SIMPLEIMAGE),y)
> ?LINUX_IMAGE_NAME = simpleImage.$(firstword $(LINUX_DTS_NAME))
> ?else ifeq ($(BR2_LINUX_KERNEL_IMAGE),y)
> ?LINUX_IMAGE_NAME = Image
> +else ifeq ($(BR2_LINUX_KERNEL_IMAGE_GZ),y)
> +LINUX_IMAGE_NAME = Image.gz
> ?else ifeq ($(BR2_LINUX_KERNEL_LINUX_BIN),y)
> ?LINUX_IMAGE_NAME = linux.bin
> ?else ifeq ($(BR2_LINUX_KERNEL_VMLINUX_BIN),y)

Tested-by: Tian Yuanhao <tianyuanhao@aliyun.com>
