From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jan 2018 23:41:09 +0100
Subject: [Buildroot] [RFCv3 00/15] Per-package host/target directory
 support
In-Reply-To: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
References: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20180108234109.77518fb7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Arnout,

I'd like to apply some of the patches in this series in the current
cycle. See below.

On Fri,  1 Dec 2017 21:53:37 +0100, Thomas Petazzoni wrote:

> Thomas Petazzoni (15):
>   pkgconf: use relative path to STAGING_DIR instead of absolute path
>   toolchain: post-pone evaluation of TOOLCHAIN_EXTERNAL_BIN

These two are already applied.

>   Makefile, skeleton: move the host skeleton logic to host-skeleton
>     package
>   pkg-cmake: install CMake files as part of a package

I'd like to apply those two.

>   pkg-generic: add .stamp_installed step

This one should instead be just before "core: change host RPATH
handling", it is not needed before.

>   package/pkg-generic: add the concept of extract dependency
>   package/pkg-generic: handle host-tar as an extract dependency
>   package/pkg-generic: handle host-xz as an extract dependency
>   package/pkg-generic: handle host-lzip as an extract dependency
>   package/pkg-generic: handle host-ccache as a regular dependency
>   package/pkg-generic: handle host-fakedate as a regular dependency
>   core: kill DEPENDENCIES_HOST_PREREQ

And I'd like to apply all those ones, i.e the extract dependency idea
and killing DEPENDENCIES_HOST_PREREQ.

Are you OK with that ? If so, I'll respin just those ones after taking
Yann's feedback into account.

So if you have anything against the approach used in those patches,
please speak up ! :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
