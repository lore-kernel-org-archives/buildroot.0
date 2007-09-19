From: Robin Gilks <robin.gilks@tait.co.nz>
Date: Wed, 19 Sep 2007 16:23:35 +1200
Subject: [Buildroot] AVR32 libiberty build failure
In-Reply-To: <1190125596.4064.52.camel@elrond.sweden.atmel.com>
References: <46EF36B4.2000703@tait.co.nz> 
	<20070918112636.GA2231@aon.at><1190125596.4064.52.camel@elrond.sweden.atmel
	.com>
Message-ID: <46F0A447.8000906@tait.co.nz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson wrote:
> tis 2007-09-18 klockan 13:26 +0200 skrev Bernhard Fischer:
>> On Tue, Sep 18, 2007 at 02:23:48PM +1200, Robin Gilks wrote:
>>> At least I think thats the problem...
>>>
>>> gcc builds OK and at the next step on a default config build for a atngw100 
>>> it fails.
> 
> I think it is better to check against 4.1.2,
> since there is no later port for AVR32.
> 
> The problem occurs in "gcc-*/libstdc++-v3/configure" if 
> "gcc_no_link" is "yes".
> 
> This is set to "yes", if linking fails in "gcc-*/ltconfig".
> For the AVR32 the linker fails because crt1.o is not found
> (See log below)
> 
> I checked the staging dir, and there is no crt1.o there
> when gcc-*-final is built
> 
> I searched for crt1.* in the gcc source tree,
> only gcc/config/sh/crt1.asm exists.
> 
> IIRC, I have seen similar problems with ARM & C++
> 
> I build with c++,locale, gettext and libintl
> 

I guess I was being a bit optimistic hoping that the default config for 
a target would actually work!

Has anyone tested the 
buildroot/target/device/Atmel/atngw100/atngw100_defconfig file or am I 
missing something in what is in svn at present... or am I perhaps going 
about it the wrong way - I assumed I should copy this to the top level 
.config and run 'make oldconfig' then 'make'

-- 
Robin

=======================================================================
This email, including any attachments, is only for the intended
addressee.  It is subject to copyright, is confidential and may be
the subject of legal or other privilege, none of which is waived or
lost by reason of this transmission.
If the receiver is not the intended addressee, please accept our
apologies, notify us by return, delete all copies and perform no
other act on the email.
Unfortunately, we cannot warrant that the email has not been
 altered or corrupted during transmission.
=======================================================================
