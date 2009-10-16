From: W.P. <laurentp@wp.pl>
Date: Fri, 16 Oct 2009 19:37:52 +0200
Subject: [Buildroot] setting up buildroot for using OLD gcc / binutils
In-Reply-To: <4AD63754.5020502@arcor.de>
References: <4AD389B2.20400@wp.pl>	<87my3w4bw6.fsf@macbook.be.48ers.dk>	<4AD3918B.5000908@wp.pl>	<20091012203645.GX2266@mx.loc>	<4AD3B2BE.2010809@wp.pl>	<20091013111009.GB23718@mx.loc>	<4AD4C1BB.5000304@wp.pl>	<877huz2m5l.fsf@macbook.be.48ers.dk>	<4AD4C7B6.3000202@wp.pl>	<4AD4D7D6.6020305@wp.pl>
	<4AD4E640.2030103@arcor.de> <4AD4FB90.2060202@wp.pl>
	<4AD63754.5020502@arcor.de>
Message-ID: <4AD8AF70.9050506@wp.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

U?ytkownik Sebastian napisa?:
> Hello,
>
>>> You can always use an older version of buildroot.
>>> [...]
>>>
>> Sorry, don't understand. I need to make cross-compile environement with
>> following "parameters":
>>
>> gcc: 3.4.4
>> binutils 2.15.94
>> kernel 2.6.12.6-venus
>> uClibc 0.9.28
>> busybox 1.1.3
>>
>> and i am trying to do this with buildroot. could you help?
>
> Do the following:
>
> $ git clone git://git.buildroot.net/buildroot
> $ cd buildroot/
> $ git reset --hard gcc3_legacy
> $ make menuconfig
>
> Make sure to activate
> "Build options" --> "Show packages that are deprecated or obsolete"
>
> Now you have a version which allows you to use:
>
> gcc 3.4.4
> binutils 2.15 or 2.15.94.0.2.2
> kernel 2.6.12
> uClibc 0.9.28
> busybox 1.1.3
>
> You probably can't get closer to your wished versions (easily).
>
> I don't know what your "-venus" kernel means, but if you want to build
> a kernel module without the _exact_ sources you will probably be out
> of luck.
>
> Make sure you tell us if it works! :-)
>
> I do not know how to operate git, and I could not find any reference
> to the old SVN repository (if it still exists...), so you may be
> better off asking someone else.
>
> I hope I could help,

Great thanks, at least things started to build.

But I got uClibc bigger than on real system. This may be because of
options selected by default. (at least what is WRONG in uClibc.config is
TARGET_ARCH=none, KERNEL_SOURCE=/usr/src/linux,
KERNEL_HEADERS=/usr/src/linux/include -> this points to my i386 kernel
files).

So my question for now is how do I selectively "make clean uClibc"? As I
want to "play" with uClibc options.

And second one: how to prevent "make clean" from erasing downloads?

W.P.
