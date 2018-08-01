From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 1 Aug 2018 13:10:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/polkit: bump version to 1.105
In-Reply-To: <95d466c1-9af7-a8e7-4ac4-ee5fa2fcc7a9@spectracom.com>
References: <20180801074108.8926-1-apanfilov@spectracom.com>
 <20180801105740.6d5ba467@windsurf>
 <95d466c1-9af7-a8e7-4ac4-ee5fa2fcc7a9@spectracom.com>
Message-ID: <20180801131030.2f75554f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

(Now with the mailing list in Cc)

On Wed, 1 Aug 2018 14:01:35 +0300, tema wrote:
> > Is this version still independent from the Javascript stuff that newer
> > versions need ? I thought we were stuck to 0.103 because of the
> > dependency of newer versions on MozJS.  
> 
> Could you please provide name of the package which depends on polkit?

Sorry, I don't get your question. My point is that recent versions of
Polkit require a Javascript interpreter, and this Javascript
interpreter is not packaged in Buildroot yet, and is a pain to package.
There were some effort a few years ago to achieve this, but it was
never completed.

> > Also, do you have a defconfig that exhibits the issue. I'm surprised
> > our autobuilders haven't found any build issue.  
> 
> defconfig used for build:
> BR2_arm=y
> BR2_cortex_a9=y
> BR2_ARM_ENABLE_NEON=y
> BR2_ARM_ENABLE_VFP=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_INIT_SYSTEMD=y
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_DEFCONFIG="socfpga"
> BR2_PACKAGE_NETWORK_MANAGER=y
> BR2_PACKAGE_SYSTEMD_POLKIT=y
> 
> This is build output:
>    CCLD     clients/cli/nmcli
> clients/common/clients_cli_nmcli-nm-polkit-listener.o: In function `compare_users':
> nm-polkit-listener.c:(.text.compare_users+0x48): undefined reference to `polkit_unix_user_get_name'
> clients/common/clients_cli_nmcli-nm-polkit-listener.o: In function `initiate_authentication':
> nm-polkit-listener.c:(.text.initiate_authentication+0x1c4): undefined reference to `polkit_unix_user_get_name'
> collect2: error: ld returned 1 exit status

Thanks, I'll try this out!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
