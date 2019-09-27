From: Steve Calfee <stevecalfee@gmail.com>
Date: Fri, 27 Sep 2019 07:39:41 -0700
Subject: [Buildroot] Failure upgrading 8/2017 to 8/2019
In-Reply-To: <CAJ4jsacuzsLFcgMJQcLPut-GvT9HA8yepQq8V-sLPv=PhSbPNA@mail.gmail.com>
References: <CAJJ6jxvMGKJoO=L6TSP9dc2Wyvg62GyKobn6nwemvUK-tC5RGw@mail.gmail.com>
 <CAJ4jsacuzsLFcgMJQcLPut-GvT9HA8yepQq8V-sLPv=PhSbPNA@mail.gmail.com>
Message-ID: <CAJJ6jxu=Vm7U7v8MJgcQ_bJk-U6P1p_37Fc0Aq4pKXtb-OXCDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 26, 2019 at 6:36 PM Carlos Santos <unixmania@gmail.com> wrote:
>
> On Wed, Sep 25, 2019 at 11:54 AM Steve Calfee <stevecalfee@gmail.com> wrote:
> >
> > Hi, I decided to upgrade to the latest buildroot 8/2019. My latest
> > pull/build was from 2017.8
> >
> > When I tried to pull into my old tree I got a corrupted git tree - but
> > I keep no custom stuff in the buildroot tree, so I just cloned a new
> > copy from buildroot.org. I checked out tag 2019.08. I do like the
> > external stuff.
> >
> > I use a buildroot constructed toolchain (from maybe 2014), so make
> > clean, make doesn't take soo long. But the build failed, any
> > suggestions on how to get locale to build?
> >
> > Thanks, Steve
> >
<snip>
>
> Did you build the toolchain from source or download it? Could you make
> a copy available somewhere? Please do not attempt to send it by email,
> since it must be around 60MB.
>
> --
> Carlos Santos <unixmania@gmail.com>

Do you think it is a tool chain issue? It looks like I rebuilt 2/2017.
I always build in another tree so "make clean" doesn't delete it. I
point my working buildroot to this built toolchain as an external
toolchain. My build system is a ubuntu 16.04 laptop.

Here is my defconfig for just the toolchain.

BR2_arm=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_GCC_VERSION_4_8_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ENABLE_LOCALE_PURGE=y
BR2_GENERATE_LOCALE="en_US.UTF-8"
BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY=y
BR2_TARGET_OPTIMIZATION="-Os -pipe"
# BR2_TARGET_GENERIC_GETTY is not set
# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
BR2_PACKAGE_LIBPTHREAD_STUBS=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_TARGET_SHEEVAPLUG=y
