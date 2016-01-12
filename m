From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 12 Jan 2016 09:49:38 +0200
Subject: [Buildroot] [USER] buildroot install external toolchains
In-Reply-To: <CAJJ6jxvGYN8Pd-8GwzVHSZWKc2CpsNE47Xb23EF-m0_ZFVS7Ew@mail.gmail.com>
References: <CAJJ6jxvGYN8Pd-8GwzVHSZWKc2CpsNE47Xb23EF-m0_ZFVS7Ew@mail.gmail.com>
Message-ID: <20160112074938.GB1937@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Steve,

On Mon, Jan 11, 2016 at 08:55:34PM -0800, Steve Calfee wrote:
> I am trying to use docker to cross build buildroot. I don't want to build
> the toolchain so I tried to use a pre-built toolchain as the autobuilders
> do. I got a list of toolchains from
> https://sourceware.org/ml/crossgcc/2015-05/msg00014.html written by Thomas
> P.
> 
> So I extracted one into the filesystem and tried to use it, but something
> is wrong.
> 
> From bash I tried:
> /br/armv7-ctng-linux-gnueabihf/bin/armv7-ctng-linux-gnueabihf-gcc --version
> bash: /br/armv7-ctng-linux-gnueabihf/bin/armv7-ctng-linux-gnueabihf-gcc: No
> such file or directory

The 'No such file or directory' error might indicate missing libraries. This 
toolchain is built to run on 32bit x86 systems. Make sure you have 32bit 
versions of libc and libstdc++ packages installed on your system.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
