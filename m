From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 13 Feb 2019 08:46:07 +0100
Subject: [Buildroot] [PATCH] qemu: Update defconfigs to Linux 4.19.16
In-Reply-To: <d93f0671-7695-1604-272d-4145a4ad2182@smile.fr>
References: <20190206221441.11654-1-gerome.burlats@smile.fr>
 <20190207094156.106ebb0c@windsurf>
 <d93f0671-7695-1604-272d-4145a4ad2182@smile.fr>
Message-ID: <20190213084607.55ef5dc9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Feb 2019 23:21:48 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> > Actually, maybe it would make sense for those qemu defconfigs to be
> > runtime tested as part of the .gitlab-ci.yml that is in Buildroot
> > itself ?  
> 
> Actually we discussed about that with Gerome. Maybe we needs something like in
> toolchain-builder project that retrieve the Qemu command line from the
> readme.txt file present in each board/qemu/<target>/readme.txt.

It already works like this. In the build.sh script:

    # Extract Qemu command from readme.txt
    test_qemu_cmd=$(grep qemu-system ${buildroot_dir}/board/qemu/${test_board_dir}/readme.txt)

and then further tweaks to build the Qemu command line.

> > with some additional commands to see if it is a qemu defconfig, and if
> > it is, run it under Qemu.  
> 
> Maybe we should use host-qemu build by Buildroot instead of qemu from the host
> distribution. Some Qemu configs (ex aarch64) requires a recent qemu version.

Yes, we could use host-qemu if needed.

> Gerome, tested the network device emulation by trying to login to the target
> using ssh. But we are not sure what was the network test used by [1] (ping, ssh,
> iperf etc...).

I'm not sure it matters a lot: just test if network support is working,
ping or ssh is enough. I believe in the cases where network was not
working, it was simply not working at all.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
