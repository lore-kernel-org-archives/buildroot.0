From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 19 Sep 2007 07:00:50 +0200
Subject: [Buildroot] AVR32 libiberty build failure
In-Reply-To: <46F0A447.8000906@tait.co.nz>
References: <46EF36B4.2000703@tait.co.nz>  <20070918112636.GA2231@aon.at>
	<1190125596.4064.52.camel@elrond.sweden.atmel .com>
	<46F0A447.8000906@tait.co.nz>
Message-ID: <1190178050.4516.56.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2007-09-19 klockan 16:23 +1200 skrev Robin Gilks:
> Ulf Samuelsson wrote:
> > tis 2007-09-18 klockan 13:26 +0200 skrev Bernhard Fischer:
> >> On Tue, Sep 18, 2007 at 02:23:48PM +1200, Robin Gilks wrote:
> >>> At least I think thats the problem...
> >>>
> >>> gcc builds OK and at the next step on a default config build for a atngw100 
> >>> it fails.
> > 
> > I think it is better to check against 4.1.2,
> > since there is no later port for AVR32.
> > 
> > The problem occurs in "gcc-*/libstdc++-v3/configure" if 
> > "gcc_no_link" is "yes".
> > 
> > This is set to "yes", if linking fails in "gcc-*/ltconfig".
> > For the AVR32 the linker fails because crt1.o is not found
> > (See log below)
> > 
> > I checked the staging dir, and there is no crt1.o there
> > when gcc-*-final is built
> > 
> > I searched for crt1.* in the gcc source tree,
> > only gcc/config/sh/crt1.asm exists.
> > 
> > IIRC, I have seen similar problems with ARM & C++
> > 
> > I build with c++,locale, gettext and libintl
> > 
> 
> I guess I was being a bit optimistic hoping that the default config for 
> a target would actually work!
> 

There has been some changes, which has killed the AVR32 toolchain
in the main trunk, and I am trying to find out why.
You can try the Buildroot at http://www.atmel.no/buildroot/

> Has anyone tested the 
> buildroot/target/device/Atmel/atngw100/atngw100_defconfig file or am I 
> missing something in what is in svn at present... or am I perhaps going 
> about it the wrong way - I assumed I should copy this to the top level 
> .config and run 'make oldconfig' then 'make'
> 
-- 
Best Regards,
Ulf Samuelsson
