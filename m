From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Dec 2017 18:23:02 +0100
Subject: [Buildroot] [PATCH 2/2] core/tests: add test for compressed
 iso9660
In-Reply-To: <d9148095910e211f1b38a85f93a10ab88fa1af04.1513805241.git.yann.morin.1998@free.fr>
References: <cover.1513805241.git.yann.morin.1998@free.fr>
 <d9148095910e211f1b38a85f93a10ab88fa1af04.1513805241.git.yann.morin.1998@free.fr>
Message-ID: <20171231182302.59012b3f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Dec 2017 22:27:43 +0100, Yann E. MORIN wrote:

> +class TestIso9660Grub2ExternalCompress(infra.basetest.BRTest):
> +    config = BASIC_CONFIG + \
> +        """
> +        BR2_TARGET_ROOTFS_ISO9660=y
> +        # BR2_TARGET_ROOTFS_ISO9660_INITRD is not set
> +        BR2_TARGET_ROOTFS_ISO9660_TRANSP_COMPRESS

Not sure you really tested with transparent compression enabled, since
=y was missing. So I've fixed that, taken into account the option
rename, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
