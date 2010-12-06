From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Dec 2010 22:02:13 +0100
Subject: [Buildroot] [PATCH 10/55] Remove all Config.in/Makefile.in
 files in target/device
In-Reply-To: <522C1DF17AF50042AD8AE87F7887BD3D01E0B5DDE7@exch.hq.tensilica.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
	<9a3eb8017e9fcebefdd16f6971909d0f18b6f953.1291582351.git.thomas.petazzoni@free-electrons.com>
	<522C1DF17AF50042AD8AE87F7887BD3D01E0B5DDE7@exch.hq.tensilica.com>
Message-ID: <20101206220213.1f69afb2@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marc, Maxim,

[ Since your question is about Buildroot and has nothing that looks
  private, I took the freedom to copy the Buildroot list again. ]

On Sun, 5 Dec 2010 17:13:44 -0800
Marc Gauthier <marc@tensilica.com> wrote:

> So, where do we put the contents of these Config.in / Makefile.in ?

In the existing Config.in/Makefile.in, there were only options to
select a particular board.

> Are we not to use the config tools to select a given board?

You just need to write a defconfig file for your different boards in
the configs/ directory. Those defconfigs file will select, for each of
your boards, the correct toolchain, bootloader and kernel configuration.

And then your users could do:

	make mywonderfulboard_defconfig
	make

To get a Buildroot build that works for "mywonderfulboard".

If you need any help or have questions about how this would work for
your use cases, do not hesitate to ask.

Thanks for your feedback!

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
