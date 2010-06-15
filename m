From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jun 2010 09:21:13 +0200
Subject: [Buildroot] [PATCH 2/2] [skeleton] option to define path to
 custom rootfs skeleton
In-Reply-To: <4c114472.0d01df0a.4f84.1499@mx.google.com>
References: <4c114472.0d01df0a.4f84.1499@mx.google.com>
Message-ID: <20100615092113.19f92cf3@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Jun 2010 22:58:40 +0300
Dmytro Milinevskyy <milinevskyy@gmail.com> wrote:

> index 6865eea..2163890 100644
> --- a/fs/Config.in
> +++ b/fs/Config.in
> @@ -23,6 +23,30 @@ config BR2_ROOTFS_DEVICE_TABLE
>           to the makedevs utility to create all the special device
>           files in the target filesystem.
>  
> +choice
> +	prompt "Root FS skeleton"
> +
> +	config BR2_ROOTFS_SKELETON_DEFAULT
> +		bool "default target skeleton"
> +        help
> +          Use default target skeleton
> +
> +	config BR2_ROOTFS_SKELETON_CUSTOM
> +		bool "custom target skeleton"
> +		help
> +	  	 Use custom target skeleton.
> +
> +endchoice
> +
> +if BR2_ROOTFS_SKELETON_CUSTOM
> +	config BR2_ROOTFS_SKELETON_CUSTOM_PATH
> +		string "custom target skeleton path"
> +        default "fs/skeleton"
> +		help
> +	  	 Path custom target skeleton.
> +endif
> +
> +

You have indentation issues here. It should be:

choice
	prompt "Root FS skeleton"

config BR2_ROOTFS_SKELETON_DEFAULT
	bool "default target skeleton"
	help
	  Use default target skeleton

config BR2_ROOTFS_SKELETON_CUSTOM
	bool "custom target skeleton"
	help
	  Use custom target skeleton

endchoice

if BR2_ROOTFS_SKELETON_CUSTOM

config BR2_ROOTFS_SKELETON_CUSTOM_PATH
	string "custom target skeleton path"
	default "fs/skeleton"
	help
	  Path to the custom target skeleton

endif

So :

 * config statements at the beginning of the line
 * one tab before "bool" and "help"
 * tab + 2 spaces before each line of the help message

Otherwise, looks good to me, thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
