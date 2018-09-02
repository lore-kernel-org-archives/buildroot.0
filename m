From: Mirza Krak <mirza.krak@northern.tech>
Date: Sun, 2 Sep 2018 22:00:17 +0200
Subject: [Buildroot] [[PATCH v2 0/2] mender-artifact support
In-Reply-To: <20180902152532.6ae013a8@windsurf>
References: <20180827113728.20856-1-mirza.krak@northern.tech>
 <20180902152532.6ae013a8@windsurf>
Message-ID: <CADHdJwDwnZQTiEqfNDzBrjCxH8nr54TBBbCbJAxcm6OA+iodGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 2, 2018 at 3:25 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Mirza,
>
> On Mon, 27 Aug 2018 13:37:26 +0200, Mirza Krak wrote:
>
> > Mirza Krak (2):
> >   package/pkg-golang: add support for building host packages
> >   package/mender-artifact: initial support
>
> Thanks for this patch series. It looks mostly good from a review
> perspective, except one aspect on PATCH 2/2, to which I'll reply
> separately.
>
> However, the host-mender-artifact package doesn't build here. With the
> following deconfig:
>
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2018.05.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> # BR2_TARGET_ROOTFS_TAR is not set
> BR2_PACKAGE_HOST_MENDER_ARTIFACT=y
>
> I get the following error:
>
> >>> host-mender-artifact 2.2.0 Building
> cd /home/thomas/projets/buildroot/output/build/host-mender-artifact-2.2.0/_gopath/src///; PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/sbin:/usr/local/bin:/usr/bin:/bin:/home/thomas/.rvm/bin:/usr/local/sbin:/usr/sbin:/home/thomas/.rvm/bin:/home/thomas/sys/bin:/home/thomas/.gem/ruby/2.1.0/bin:/home/thomas/.rvm/bin" GOBIN= CGO_ENABLED=1 GOPATH="/home/thomas/projets/buildroot/output/build/host-mender-artifact-2.2.0/_gopath"  /home/thomas/projets/buildroot/output/host/bin/go build -v -ldflags "" -tags "" -o /home/thomas/projets/buildroot/output/build/host-mender-artifact-2.2.0/bin/host-mender-artifact ./.
> can't load package: package .: no Go files in /home/thomas/projets/buildroot/output/build/host-mender-artifact-2.2.0/_gopath/src
> make[1]: *** [package/pkg-generic.mk:232: /home/thomas/projets/buildroot/output/build/host-mender-artifact-2.2.0/.stamp_built] Error 1
> make: *** [Makefile:79: _all] Error 2
>
> Could you have a look into this ?

This looks like this patch [1] is missing. Or at least it was a
similar error that I got before that was fixed.

[1]. https://git.buildroot.net/buildroot/commit/?id=4eccbe3ef975fa7dcc8984fa9a19c778752d70af

-- 
Mirza Krak | Embedded Solutions Architect | https://mender.io

 Northern.tech AS | @northerntechHQ
