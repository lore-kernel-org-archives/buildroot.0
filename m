From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 20 Jun 2011 17:02:18 +0200
Subject: [Buildroot] [PATCH 03/26] linux: make it possible to install
 the	kernel in /boot
In-Reply-To: <d8edb7d215a430e3bd8494091ab04b5e2b2fa280.1306782275.git.thomas.petazzoni@free-electrons.com>
References: <cover.1306782275.git.thomas.petazzoni@free-electrons.com>
 <d8edb7d215a430e3bd8494091ab04b5e2b2fa280.1306782275.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4DFF60FA.3070404@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thomas Petazzoni wrote:
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
> ---
>   linux/Config.in |    8 ++++++++
>   linux/linux.mk  |    3 +++
>   2 files changed, 11 insertions(+), 0 deletions(-)
>
> diff --git a/linux/Config.in b/linux/Config.in
> index e7d1bd8..291f9e0 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -153,6 +153,14 @@ config BR2_LINUX_KERNEL_IMAGE_TARGET_NAME
>   	  Specify the kernel make target to build the kernel that you
>   	  need.
>
> +config BR2_LINUX_KERNEL_INSTALL_TARGET
> +	bool "Install kernel image to /boot in target"
> +	depends on BR2_i386 || BR_x86_64

Why not for other architectures?
I find it very useful on my ARM platform too.

-    depends on BR2_i386 || BR_x86_64
+    depends on BR2_LINUX_KERNEL

Luca
