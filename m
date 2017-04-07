From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Fri, 07 Apr 2017 11:22:01 +0200
Subject: [Buildroot] [Patch v4 1/3] rust-bootstrap: new package
In-Reply-To: <20170407110356.108f4c78@free-electrons.com>
References: <20170402194651.28684-1-eric.le.bihan.dev@free.fr>
 <20170402194651.28684-2-eric.le.bihan.dev@free.fr>
 <1491548614.26127.3.camel@embedded.rocks>
 <20170407102613.7a8c96b3@free-electrons.com>
 <1491555244.1058.1.camel@embedded.rocks>
 <20170407110356.108f4c78@free-electrons.com>
Message-ID: <1491556921.1058.3.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2017-04-07 at 11:03 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 07 Apr 2017 10:54:04 +0200, J?rg Krause wrote:
> 
> > > > Is there any necessity to limit the bootstrap compiler to those host
> > > > archs only?  
> > > 
> > > The bootstrap compiler is provided as a binary only thing,
> > > pre-compiled. So it works only on the architectures it was compiled
> > > for. At least, that's why I remember from previous series on this topic.  
> > 
> > But, if I am running Buildroot on a PowerPC it should be able to fetch
> > and run the binary for PowerPC, right?
> 
> If there's no prebuilt Rust compiler for PowerPC, then no, it will
> simply not be possible.

Fetching and extracting the PowerPC release tarball [1]:

[joerg at nzxt rust-1.16.0-powerpc64-unknown-linux-gnu]$ file
rustc/bin/rustc?
rustc/bin/rustc: ELF 64-bit MSB shared object, 64-bit PowerPC or cisco
7500, version 1 (SYSV), dynamically linked, interpreter
/lib64/ld64.so.1, for GNU/Linux 3.2.0,
BuildID[sha1]=39357ec02406358be73f28d80dabfdd9e9816de9, not stripped,
with debug_info

> We have already lots of things in Buildroot that depend on x86 or
> x86-64. Check all packages/options that use BR2_HOSTARCH.
> 
> So, it's fine for Rust to also require a x86/x86-64 machine, as long as
> the proper BR2_HOSTARCH dependency is present in the Config.in.

As I am running x64 it is fine for me, too. Just wondered why to limit
the hosts archs if there are binaries available.

[1] https://static.rust-lang.org/dist/rust-1.16.0-powerpc64-unknown-lin
ux-gnu.tar.gz

J?rg
