From: Steve Calfee <stevecalfee@gmail.com>
Date: Wed, 13 Jan 2016 07:25:14 -0800
Subject: [Buildroot] [USER] buildroot install external toolchains
In-Reply-To: <20160112074938.GB1937@tarshish>
References: <CAJJ6jxvGYN8Pd-8GwzVHSZWKc2CpsNE47Xb23EF-m0_ZFVS7Ew@mail.gmail.com>
 <20160112074938.GB1937@tarshish>
Message-ID: <CAJJ6jxtn_2Uigby3hMW9Q3orCAFyYRjoQ9sdos9t-s=NNvrd=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Hi Baruch,

On Mon, Jan 11, 2016 at 11:49 PM, Baruch Siach <baruch@tkos.co.il> wrote:
>
> Hi Steve,
>
> On Mon, Jan 11, 2016 at 08:55:34PM -0800, Steve Calfee wrote:
> > I am trying to use docker to cross build buildroot. I don't want to build
> > the toolchain so I tried to use a pre-built toolchain as the autobuilders
> > do. I got a list of toolchains from
> > https://sourceware.org/ml/crossgcc/2015-05/msg00014.html written by Thomas
> > P.
> >
> > So I extracted one into the filesystem and tried to use it, but something
> > is wrong.
> >
> > From bash I tried:
> > /br/armv7-ctng-linux-gnueabihf/bin/armv7-ctng-linux-gnueabihf-gcc --version
> > bash: /br/armv7-ctng-linux-gnueabihf/bin/armv7-ctng-linux-gnueabihf-gcc: No
> > such file or directory
>
> The 'No such file or directory' error might indicate missing libraries. This
> toolchain is built to run on 32bit x86 systems. Make sure you have 32bit
> versions of libc and libstdc++ packages installed on your system.
>
>


Thanks, I did not know they were 32 bit apps. So I installed those
libraries and the toolchains now work in a docker container.

I am still struggling with getting persistent storage working - Stuff
like customization, builds and downloads should be persistent. However
when done it will make it much easier to setup a build system.

Regards, Steve
