From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 17 Sep 2007 13:01:36 +0200
Subject: [Buildroot] r19351 broke make source [was: Re: svn
	commit:	trunk/buildroot: target/device target/device/Atmel
	targe etc...]
In-Reply-To: <1190031709.8052.11.camel@elrond.sweden.atmel.com>
References: <20070731145959.C5111A4595@busybox.net>
	<20070917092015.GA18644@aon.at>
	<1190031709.8052.11.camel@elrond.sweden.atmel.com>
Message-ID: <20070917110136.GA22104@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 17, 2007 at 02:21:49PM +0200, Ulf Samuelsson wrote:
>m?n 2007-09-17 klockan 11:20 +0200 skrev Bernhard Fischer:
>> On Tue, Jul 31, 2007 at 07:59:59AM -0700, ulf at uclibc.org wrote:
>> >Author: ulf
>> >Date: 2007-07-31 07:59:58 -0700 (Tue, 31 Jul 2007)
>> >New Revision: 19351
>> >
>> >Log:
>> >Add support for prepatched toolchains
>> 
>> This apparently broke 'make source'. Please fix ASAP or revert.
>> >
>
>Please supply the error message.

make source does not download the binutils tarball. After
$ rm -rf dl
$ make source
, unplug the serial cable of your modem and execute
$ make

This fails since binutils...tar.bz2 was not downloaded.

PS: If you don't have a modem, setting BR2_WGET="/bin/false " after
"make source" should have about the same effect.
