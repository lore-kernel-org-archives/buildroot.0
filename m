From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Nov 2015 22:16:21 +0100
Subject: [Buildroot] [PATCH v2] system: Fix for NFS booting with
 interface config via DHCP
In-Reply-To: <1447107410.4553.76.camel@rtred1test09.kymeta.local>
References: <1446841557.4553.32.camel@rtred1test09.kymeta.local>
 <20151108145723.49e07124@free-electrons.com>
 <1447107410.4553.76.camel@rtred1test09.kymeta.local>
Message-ID: <20151118221621.692b2b7a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Trent Piepho,

On Mon, 9 Nov 2015 22:16:49 +0000, Trent Piepho wrote:
> Configuring the network interface with DHCP via
> /etc/network/interfaces generally does not work when NFS booting.  The
> DHCP configuration will initially bring the interface down and system
> then hangs at that point as the root filesystem is no longer
> accessable.  See bug 4709.
> 
> This adds a script to be run via a pre-up line in
> /etc/network/interfaces.  It checks for a NFS root filesystem and if
> the interface to be configured is used for access to the NFS server.
> If this is the case, then it returns a failure code so that ifup will
> not configure the interface.  This works for DHCP and another config
> methods (static, bootp, etc.).  This system does detect if the
> interface to be configured isn't the one used for NFS and doesn't skip
> it when that is the case.
> 
> NFS filesystems that aren't the root fs aren't considered.
> 
> Signed-off-by: Trent Piepho <tpiepho@kymetacorp.com>
> ---
>  package/skeleton/nfs_check   | 20 ++++++++++++++++++++
>  package/skeleton/skeleton.mk |  3 +++
>  2 files changed, 23 insertions(+)
>  create mode 100755 package/skeleton/nfs_check

Applied to next, thanks! I only had to adjust the bug number, it's
fixing #4790, not #4709.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
