From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Nov 2019 09:46:44 +0100
Subject: [Buildroot] [PATCH v2 2/3] board/beelink_gs1: enable mdev and
 dhcp on eth0
In-Reply-To: <20191027192131.6813-2-peron.clem@gmail.com> (=?utf-8?Q?=22Cl?=
 =?utf-8?Q?=C3=A9ment_P=C3=A9ron=22's?=
 message of "Sun, 27 Oct 2019 20:21:30 +0100")
References: <20191027192131.6813-1-peron.clem@gmail.com>
 <20191027192131.6813-2-peron.clem@gmail.com>
Message-ID: <87tv6tveyz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Cl?ment" == Cl?ment P?ron <peron.clem@gmail.com> writes:

 > Signed-off-by: Cl?ment P?ron <peron.clem@gmail.com>
 > ---
 >  configs/beelink_gs1_defconfig | 3 +++
 >  1 file changed, 3 insertions(+)

 > diff --git a/configs/beelink_gs1_defconfig b/configs/beelink_gs1_defconfig
 > index b3004ffe7a..b5b4238791 100644
 > --- a/configs/beelink_gs1_defconfig
 > +++ b/configs/beelink_gs1_defconfig
 > @@ -2,6 +2,9 @@
 >  BR2_aarch64=y
 >  BR2_ARM_FPU_VFPV4=y
 >  BR2_TARGET_GENERIC_ISSUE="Welcome to Beelink GS1"
 > +# MDEV is required to autoload the ethernet driver module
 > +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y

If this is just about the network driver, then a simpler solution is to
just use a linux kernel config fragment to build the STMMAC_ETH driver +
allwinner support into the kernel instead of as a module. That way
things like root on NFS would also automatically work.

But Ok, that can be done later. Committed to next, thanks.

-- 
Bye, Peter Korsgaard
