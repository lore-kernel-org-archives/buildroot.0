From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Sep 2015 19:08:06 +0200
Subject: [Buildroot] Generating a defconfig
In-Reply-To: <56002C63.1070806@synopsys.com>
References: <56002C63.1070806@synopsys.com>
Message-ID: <20150921190806.5b845258@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joao,

On Mon, 21 Sep 2015 17:12:19 +0100, Joao Pinto wrote:

> I am about to generate a buildroot' defconfig for ARM Juno r1 board, and I would
> like to know what is the std procedure to make this on buildroot.

Just create your Buildroot configuration, and then run:

	make savedefconfig

It will create a file named 'defconfig', which you can simply move to
configs/<foo>_defconfig.

You can also do it in one step like this:

	make BR2_DEFCONFIG=configs/<foo>_defconfig savedefconfig

Note that for the board defconfig, we have a few rules in Buildroot:

 * The version of the kernel headers and kernel must be fixed (you
   should not use the "latest version" option)

 * The configuration should be minimal, i.e nothing but the default
   userspace package (just Busybox).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
