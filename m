From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Mar 2015 15:21:21 +0100
Subject: [Buildroot] [RFC v3 00/30] Add per-package staging feature
In-Reply-To: <CAHkwnC94xHciiK2n8X0Gr7=PVTs_LWoqQ-bG1bg20jO1ygd0Gw@mail.gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
 <20150303142901.5998a72c@free-electrons.com>
 <CAHkwnC94xHciiK2n8X0Gr7=PVTs_LWoqQ-bG1bg20jO1ygd0Gw@mail.gmail.com>
Message-ID: <20150303152121.408c2733@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Tue, 3 Mar 2015 15:03:46 +0100, Fabio Porcedda wrote:

> > Could you give some hints about the performance impact of those copies
> > of the staging directory? Does it continue to make the top-level
> > parallel build thing useful?
> 
> IMHO the per-package staging feature is useful even without taking in
> consideration the top-level parallel build, the unspecified optional
> dependency issue are not common, they can generate build faulres or
> just binary with unexpected behavior.

Yes, correct, this is indeed another benefit of this approach.

> > Preferably something with a fairly deep dependency tree, i.e lots of
> > small packages that depend on each other. A X.org stack + gtk2 would be
> > a good example.
> 
> The most complete selection of package that i've tested is the
> defconfig + allyespacakgeconfig (693 targets), i've tried to enable a
> wider range of packages, defconfig + glibc + allyespackageconfig but
> even without using the pps they fail to build.
> So i will provide build times of the configuration defconfig +
> allyespackageconfig.

Ok.

> If you provide a defconfig on the release 2015.02, i can try to build that.

Something like:

BR2_arm=y
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_LIBGTK3=y

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
