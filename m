From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 17 Aug 2007 22:42:35 +0200
Subject: [Buildroot] Overriding DL_DIR in the environment
References: <1187370334.31026.4.camel@elrond.sweden.atmel.com><0708171957370.14301@somehost>
	<E496871456016F4CA8959BE4105D2A890E8C30@troe2k1.cs.myharris.net>
Message-ID: <01d001c7e117$81522450$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at uclibc.org [mailto:buildroot-bounces at uclibc.org]
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
> I use a link as well, but should the option be added to the menus so
> that it does not need to be specified in the environment?
> 
> Matt
> 

The purpose of this is to reduce typing and also to reduce potential errors.

Replacing "$(BASE_DIR)/dl" with "/usr/local/install/downloads"
will cost me 42 (!) keystrokes    *every* time you create a new buildroot tree

"ln -s /usr/local/install/downloads dl"
will cost me 36 keystrokes        - *every* time you create a new buildroot tree
It will add another directory to the build, so a little unneccessary clutter in the directory.

Setting the environment will cost me a few keystrokes *ONCE*.

If I fail to remember to do that, I will have to abort the build
because I do not want to waif for downloads of packages I already have on my machine.

------------------
After such a patch,  you can still define a common location, either by
* changing DL_DIR from $(BASE_DIR)/dl to your own value in "make menuconfig"
* creating a symlink 
In addition you can define your common location by
export BUILDROOT_DL_DIR <common location>

----
So far everyone has explained that a common location can be *achieved*
but that does not mean that it is superior to doing it with the help of the  environment.

I am convinced that it is better to do it using the environment.

My question is really is if anyone can show any drawback in having this functionality in buildroot.

(Even if it is there, you don't have to use it)

Best Regards
Ulf Samuelsson
