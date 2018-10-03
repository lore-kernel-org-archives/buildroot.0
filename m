From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 3 Oct 2018 14:41:45 +0300
Subject: [Buildroot] Custom C Libraries for RISC-V 32-bit Support
In-Reply-To: <a20fc000-76ef-da38-b7d7-2fb185fe88d5@embecosm.com>
References: <37c3dc75-0145-ce92-05c0-6c9559b86022@embecosm.com>
 <20181003104024.ijzjzu6t4sp7cee3@sapphire.tkos.co.il>
 <a20fc000-76ef-da38-b7d7-2fb185fe88d5@embecosm.com>
Message-ID: <20181003114145.bla23tjlwaqc5glu@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mark,

On Wed, Oct 03, 2018 at 11:53:54AM +0100, Mark Corbin wrote:
> On 03/10/18 11:40, Baruch Siach wrote:
> > On Wed, Oct 03, 2018 at 11:26:53AM +0100, Mark Corbin wrote:
> >> I've been asked by a few people about adding RISC-V 32-bit support to
> >> Buildroot.
> >>
> >> This would require the ability to select custom git repositories for C
> >> libraries. There is a glibc repository based on v2.26 that works for
> >> riscv32 and there is also a musl repository for riscv32/riscv64 that I'd
> >> like to test.
> >>
> >> I'm happy to add support for custom C libraries, but was wondering what
> >> everybody's thoughts were on this?
> > We already support a custom version of glibc for the ARC architecture. See 
> > package/glibc/glibc.mk. Is there a plan to push upstream musl/glibc support 
> > for RISC-V 32-bit?
> It looks like the musl patches have been submitted for review[1]. I'm
> not sure about the status of glibc 32-bit support.
> 
> I could add custom library support as per the ARC architecture, or I
> could add a generic way to specify a git repository like the kernel, or
> I could try to produce some patch sets against the latest C library
> versions. I'm open to suggestions.

The kernel way is definitely not the way to go. The kernel and U-Boot are 
special because people tend to use per target source trees. I think that 
something like what ARC is doing would be easier. A patch set might be 
problematic because we'll need to forward port the patches whenever we bump 
glibc version. But I guess Buildroot maintainers would like to see a clear 
upstream path before committing to accept a riscv32 specific glibc version.

> [1] https://www.openwall.com/lists/musl/2018/09/28/1

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
