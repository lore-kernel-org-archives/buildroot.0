From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 09 Jan 2020 10:15:47 +0100
Subject: [Buildroot] [PATCH 0/2] package/wireguard upgrade
In-Reply-To: <20200108210929.GD17943@scaer> (Yann E. MORIN's message of "Wed, 
 8 Jan 2020 22:09:29 +0100")
References: <20200106104731.13306-1-peter@korsgaard.com>
 <20200108210929.GD17943@scaer>
Message-ID: <87imllgfcs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2020-01-06 11:47 +0100, Peter Korsgaard spake thusly:
 >> With the kernel support for WireGuard getting mainlined, the upstream repo
 >> has been split in a wireguard-tools repo for the userspace tooling and
 >> wireguard-linux-compat for the kernel side (for 3.10+ legacy kernels).
 >> 
 >> This series changes the wireguard package to use the wireguard-tools
 >> repo and adds a package for wireguard-linux-compat.

 > So, previously, selecting BR2_PACKAGE_WIREGUARD would build both the
 > kernel module and the userland tools, as they were packagesd in a single
 > upstream package.

Yes, if the configuration builds a Linux kernel.


 > Now, they are separated into two different upstream packages, namely
 > wireguard-tools and wireguard-linux-compat.

 > With your patchset, an existing defconfig will now only build the
 > userland tools, even if the user would still need the kernel module for
 > older kernels.

 > So, my proposal would be to have a single patch that introduces the
 > split, with a renaming of the existing wireguard package, and a legacy
 > symbol that selects both the userland tools and the compat module.

I don't think there is any specific reason why it all HAS to be done in
a single commit?


 > This would allow existing configs to stay to iso-functionality. Thanks
 > to the legacy handling, the user will notice and will have to confirm
 > they still need/want the kernel module, and they can disable it if not.

The symbol rename is a bit more noisy, but it indeed is nicer for users
of the legacy kernel module.

Thanks, I've sent a v2 implementing that.
-- 
Bye, Peter Korsgaard
