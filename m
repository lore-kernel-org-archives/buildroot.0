From: Crane, Matthew <mcrane03@harris.com>
Date: Mon, 20 Aug 2007 10:15:17 -0400
Subject: [Buildroot] Overriding DL_DIR in the environment
In-Reply-To: <01d001c7e117$81522450$dcc4af0a@atmel.com>
References: <1187370334.31026.4.camel@elrond.sweden.atmel.com><0708171957370.14301@somehost>
	<E496871456016F4CA8959BE4105D2A890E8C30@troe2k1.cs.myharris.net>
	<01d001c7e117$81522450$dcc4af0a@atmel.com>
Message-ID: <E496871456016F4CA8959BE4105D2A890E8C36@troe2k1.cs.myharris.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


<<<<<<
So far everyone has explained that a common location can be *achieved*
but that does not mean that it is superior to doing it with the help of
the  environment.

I am convinced that it is better to do it using the environment.

My question is really is if anyone can show any drawback in having this
functionality in buildroot.

(Even if it is there, you don't have to use it)

Best Regards
Ulf Samuelsson
>>>>>>


Hi, 

How is the dl dir different from many other settings that could aslo be
left in the environment?  

If you have your setting in the environment can it not be picked up as
the default value for that config text entry?  I think too that
quantifying the keystrokes is a superficial measure of the utility of
using environment variables, it is complexity that should be reduced and
maintainability that ought to be considered.

Matt


-----Original Message-----
From: Ulf Samuelsson [mailto:ulf at atmel.com] 
Sent: Friday, August 17, 2007 4:43 PM
To: Crane, Matthew; buildroot at uclibc.org
Subject: Re: [Buildroot] Overriding DL_DIR in the environment

> -----Original Message-----
> From: buildroot-bounces at uclibc.org
[mailto:buildroot-bounces at uclibc.org]
> On Behalf Of Cristian Ionescu-Idbohrn
> Sent: Friday, August 17, 2007 1:59 PM
> To: buildroot at uclibc.org
> Subject: Re: [Buildroot] Overriding DL_DIR in the environment
> 
> On Fri, 17 Aug 2007, Ulf Samuelsson wrote:
> 
>> I keep a central download location for all tarballs,
>> and find it a pain to always have to edit the DL_DIR
>> variable during "make menuconfig".
>>
>> It would be nice to be able to override the ".config"
>> value of DL_DIR in the shell environment.
>>
>> Here is a simple patch which will,
>> if you define
>>
>> $ export BUILDROOT_DL_DIR /usr/local/install/downloads
>>
>> in your ".bashrc", override the DL_DIR in the ".config".
> 
> Wouldn't a symlink (that's what I use) sort that out?
> 


> 
