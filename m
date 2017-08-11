From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 11 Aug 2017 20:11:00 +0200
Subject: [Buildroot] [PATCH] toolchain-wrapper: do not use deprecated
 -mfused-madd
In-Reply-To: <7a3aef53-510d-a620-5980-d3c780eb5ddd@mind.be>
References: <20170811052847.GA32348@waldemar-brodkorb.de>
 <20170811080858.336ba4d3@windsurf>
 <7a3aef53-510d-a620-5980-d3c780eb5ddd@mind.be>
Message-ID: <20170811181100.GM28021@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,
Arnout Vandecappelle wrote,

> 
> 
> On 11-08-17 08:08, Thomas Petazzoni wrote:
> > Hello,
> > 
> > On Fri, 11 Aug 2017 07:28:48 +0200, Waldemar Brodkorb wrote:
> >> GCC deprecated -mfused-madd, -ffp-contract=off should
> >> be used for Xburst workaround.
> >> uClibc compilations will fail, because a gcc warning
> >> is emitted while checking for TLS support in the compiler.
> > 
> > In which gcc version was -ffp-contract=off added ? Can we use that
> > unconditionally, or is it only available in recent gcc versions ?
> 
>  And remember that we support GCC down to 4.3 in external toolchains...

The usage for -ffp-contract=off is limited for MIPS32 xburst and
I see only two external toolchains from 2016 for MIPS in
make menuconfig...

best regards
 Waldemar
