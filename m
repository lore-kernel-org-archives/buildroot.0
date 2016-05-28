From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 May 2016 10:55:44 +0200
Subject: [Buildroot] [PATCH for-master] package/openpowerlink: avoid
 kernel header issue with musl
In-Reply-To: <1464385726-24744-1-git-send-email-romain.naour@gmail.com>
References: <1464385726-24744-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160528105544.349310e7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 27 May 2016 23:48:46 +0200, Romain Naour wrote:
> The Virtual Ethernet driver doesn't build when the musl libc is used on the
> system. As stated in the musl wiki [1], the userspace and kernel headers are
> mixed leading to a "clash" with the definitions provided by musl.
> 
> Remove netinet/if_ether.h userspace header and replace ETHER_ADDR_LEN by
> ETH_ALEN [2] and ETHERMTU by ETH_DATA_LEN [3] in veth-linuxuser.c.
> 
> Fixes:
> http://autobuild.buildroot.org/results/2ca/2ca04bb046263e479e7597867b56469893d3c11d/
> 
> Upsteam status: pending
> https://github.com/OpenAutomationTechnologies/openPOWERLINK_V2/pull/120
> 
> [Rebase on v2.2.2]
> [1] http://wiki.musl-libc.org/wiki/FAQ#Q:_why_am_i_getting_.22error:_redefinition_of_struct_ethhdr.2Ftcphdr.2Fetc.22_.3F
> [2] https://git.musl-libc.org/cgit/musl/tree/include/net/ethernet.h?h=v1.1.14#n35
> [3] https://git.musl-libc.org/cgit/musl/tree/include/net/ethernet.h?h=v1.1.14#n48
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  ...-veth-avoid-kernel-header-issue-with-musl.patch | 91 ++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 package/openpowerlink/0006-veth-avoid-kernel-header-issue-with-musl.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
