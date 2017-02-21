From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Feb 2017 11:21:46 +0100
Subject: [Buildroot] [git commit] gcc: add patches for or1k specific gcc
 version
In-Reply-To: <20170220231337.7B5C38215E@busybox.osuosl.org>
References: <20170220231337.7B5C38215E@busybox.osuosl.org>
Message-ID: <20170221112146.0388f489@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Feb 2017 23:43:22 +0100, Peter Korsgaard wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=e7c7a8bf5481e898e7591442b0d924c2952797ef
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> This commit adds a number of patches from package/gcc/5.4.0 to
> package/gcc/musl-5.4.0, so that they apply to the or1k specific gcc
> version. All patches from package/gcc/5.4.0 that are not architecture
> specific and not related to the musl C library have been added to
> package/gcc/musl-5.4.0/.
> 
> Note that doing a symbolic link does not work, as some patches from
> package/gcc/5.4.0 do not apply as-is to the or1k gcc version.
> 
> The most important patch is 850-libstdcxx-uclibc-c99.patch, which fixes
> a number of build issues.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/eebf4ce5ecb896e54912cfa21268e81ff5fb6593/
>   (alljoyn)
> 
>   http://autobuild.buildroot.net/results/8dbf406898a59e36ac6a1e16f543b6260da775c8/
>   (jsoncpp)
> 
>   http://autobuild.buildroot.net/results/206fbd5473c8c6840489990cb2552566c62ef3c8/
>   (dawgic)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

I have rebuilt and deployed the pre-built OpenRISC toolchain, with this
patch applied. So now all those C++ related issues on or1k should
disappear.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
