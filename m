From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 2 Nov 2020 14:41:43 -0600
Subject: [Buildroot] [2020.02.x] package/busybox: fix build with glibc
 2.31
In-Reply-To: <874km7bm62.fsf@dell.be.48ers.dk>
References: <CANQCQpZvbwcpdhXsE90HUS10fmZrOtbeGAA82rMUWmUZnd0LGg@mail.gmail.com>
 <874km7bm62.fsf@dell.be.48ers.dk>
Message-ID: <CANQCQpYPbsgGhjB2WAnc2BOKThXVG6co8eVEGnQ3fDigLnoehg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Mon, Nov 2, 2020 at 1:21 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:
>
>  > Peter,
>  > Would you mind picking over the following commit to add busybox glibc
>  > 2.31 support to the 2020.02LTS?
>
>  > commit 13f2d688a24f47446af236829bd6ca194d5aea5b
>  > Author: Carlos Santos <unixmania@gmail.com>
>  > Date:   Sun Mar 22 14:13:01 2020 -0300
>  > package/busybox: fix build with glibc 2.31
>
>  > The known [1,2] issue was found when using a newer external toolchain
>  > with the following configuration and the 2020.02.7 tag.
>  > BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--stable-2020.08-1.tar.bz2"
>  > BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
>  > BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
>
> But that is a general issue with using "too new" external toolchains
> with older Buildroot versions. Is there any specific reason for wanting
> to use that toolchain and not E.G. something built from 2020.02.x?
>

Fair.  Our goal was to have a pre-built toolchain for ppc440 with GCC9
(probably the last ppc support), CVE updates and the latest stable
bootlin release is now built with libfortran enabled.  Fixing up LTS,
saves us from having to create a toolchain only defconfig tweaked with
these changes using LTS and managing that in addition to our regular
defconfig.

I think we're OK carrying these bumps or specific patches internally
but thought I'd see if others had interest.

-Matt
