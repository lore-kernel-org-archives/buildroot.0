From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 17 Sep 2007 22:12:14 +0200
Subject: [Buildroot] r19351 broke make source [was: Re: svn
	commit:trunk/buildroot: target/device target/device/Atmel
	targe etc...]
References: <20070731145959.C5111A4595@busybox.net>
	<20070917092015.GA18644@aon.at> <20070917095034.GB19167@aon.at>
Message-ID: <002c01c7f967$0ec70460$e9c4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Bernhard Fischer" <rep.dot.nop@gmail.com>
To: <buildroot@uclibc.org>
Cc: <ulf@atmel.com>
Sent: Monday, September 17, 2007 11:50 AM
Subject: Re: [Buildroot] r19351 broke make source [was: Re: svn commit:trunk/buildroot: target/device target/device/Atmel targe etc...]


> On Mon, Sep 17, 2007 at 11:20:15AM +0200, Bernhard Fischer wrote:
>>On Tue, Jul 31, 2007 at 07:59:59AM -0700, ulf at uclibc.org wrote:
>>>Author: ulf
>>>Date: 2007-07-31 07:59:58 -0700 (Tue, 31 Jul 2007)
>>>New Revision: 19351
>>>
>>>Log:
>>>Add support for prepatched toolchains
>>
>>This apparently broke 'make source'. Please fix ASAP or revert.
> 

That is good, because the culprit is the creation of BASE_TARGETS 
for the toolchain, which removes the toolchain source from TARGETS 
Thus "make source" fails to work, since there is no dependency on the
toolchain tarballs.

The log shows that this patch was submitted by one aldot at uclibc.org...


> I'll resist to do a funny immediate revert of this bad patch for now,
> although this seems to be a common attitude today..
> 


Best Regards
Ulf Samuelsson
