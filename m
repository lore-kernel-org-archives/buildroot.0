From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Dec 2018 23:41:51 +0100
Subject: [Buildroot] [PATCH] minnowboard-max: defconfigs: bump kernel to
 4.19.8
In-Reply-To: <20181208215902.GA3383@scaer> (Yann E. MORIN's message of "Sat, 8
 Dec 2018 22:59:02 +0100")
References: <20181208215231.17886-1-peter@korsgaard.com>
 <20181208215902.GA3383@scaer>
Message-ID: <878t0z3akw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2018-12-08 22:52 +0100, Peter Korsgaard spake thusly:
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 > However, I have a very minor comment, see below...

 > [--SNIP--]
 >> diff --git a/configs/minnowboard_max_defconfig b/configs/minnowboard_max_defconfig
 >> index 9495bf3769..523ddffd51 100644
 >> --- a/configs/minnowboard_max_defconfig
 >> +++ b/configs/minnowboard_max_defconfig
 >> @@ -7,8 +7,8 @@ BR2_SYSTEM_DHCP="eth0"
 >> BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard/post-build.sh"
 >> BR2_ROOTFS_POST_IMAGE_SCRIPT="board/minnowboard/post-image.sh"
 >> 
 >> -# Linux headers same as kernel, a 4.14 series
 >> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
 >> +# Linux headers same as kernel, a 4.19 series

 > Do we really need that comment? It is interesting for defconfigs that
 > use a sha1 from a git tree, for which it is impossible to quickly
 > identify the kernel version, but here, the kernel version is
 > human-readable, so we don;t really care about the comment, do we?

I have no problem removing it, I just wanted to keep the diff to a
minimum.

We do have a number of other defconfigs with a similar line,
E.G. sheevaplug_defconfig, openblocks_a6_defconfig, .. - It probably
makes sense to remove them all in one go.

In the mean time I have committed this patch, thanks.

-- 
Bye, Peter Korsgaard
