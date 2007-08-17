From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 17 Aug 2007 15:23:06 +0200
Subject: [Buildroot] svn commit: trunk/buildroot:
	package/lzmatarget/linux toolchain/kern etc...
References: <20070816181741.AD51FA5E18@busybox.net>
	<20070817112226.GD29258@zelow.no>
Message-ID: <016201c7e0d8$5415c8a0$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Thomas Lundquist" <lists@zelow.no>
To: <buildroot@uclibc.org>
Sent: Friday, August 17, 2007 1:22 PM
Subject: Re: [Buildroot] svn commit: trunk/buildroot: package/lzmatarget/linux toolchain/kern etc...


> On Thu, Aug 16, 2007 at 11:17:41AM -0700, ulf at uclibc.org wrote:
>> 
>> Log:
>> Ensure lzma is built *before* linux, allow system installation in /usr/local/bin
> 
> I don't agree with this one. I want host tools put in
> STAGING_DIR/bin or usr/bin, not outside the toolchain/buildroot.
> 

It *will* always be put in "STAGING_DIR/usr/bin".
The new configuration item allows you to put it in /usr/local/bin as well, an extra feature.
STAGING_DIR/usr/bin/lzma will still be available.

Buildroot won't find "STAGING_DIR/usr/bin/lzma" so you have to do
PATH:=$(STAGING_DIR)/usr/bin:$(PATH) outside buildroot.

This is not obvious, so the linux compile will fail for all newbies.

> It's alot cleaner and feels right.
> 

Except that it will break the build.

> And it's not given that the user are allowed to put the binary there
> anyway.

It is noted in the configuration that you need 'sudo' access.
If you don't you have to setup the PATH.

A long term solution would be for the persons needing lzma
to fix it so that it is used from STAGING_DIR.

Maybe the Linux compile should do:

make LZMA=$(STAGING_DIR)/usr/bin/lzma -C $(LINUX26_DIR)


> 
> 
> Thomas.




Best Regards
Ulf Samuelsson
