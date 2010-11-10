From: Konrad Eisele <konrad@gaisler.com>
Date: Wed, 10 Nov 2010 09:55:05 +0100
Subject: [Buildroot] ping: Sparc Leon patches
In-Reply-To: <4CD97A19.4020900@zacarias.com.ar>
References: <4CD80E7E.9020708@gaisler.com> <4CD97A19.4020900@zacarias.com.ar>
Message-ID: <4CDA5DE9.4030007@gaisler.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo Zacarias wrote:
> On 11/08/10 11:51, Konrad Eisele wrote:
> 
>> patches follow
> 
> Tested and added to my repo so it probably will be in for 2010.11 as
> discussed with Thomas on IRC.
> One problem i've found is that when i build for a v7 target (doesn't
> matter if it's leon or generic) libgomp in gcc seems to fail badly, is
> it known?

Hi, Uclibc disables shared libraries for V7 by default . Its on my todo list
to remove this constrains. It shouldnt matter weather V7 or V8
when creating shared librares.
For v7 targets I in the meantme use:
BR2_EXTRA_GCC_CONFIG_OPTIONS="--disable-libgomp"


> And do you have patches for other versions of gcc like 4.3.x or 4.5.x to
> include in the future?

Yes. I'll send the gcc patches to the gcc-patch list also. I
just got permssion by the fsf.
I'll also put it on my todo list to add  4.3.x and further patches.

-- Thanks Konrad

ps. I appended the 4 patches again. The [4/4] patch that adds
long double gcc intrinscs support (from glibc) to uclibc didnt
come through. Maybe because it is too big?...
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-config-Add-sparc-leon-processors.-Readd-V7-8-part-of.patch
Type: text/x-patch
Size: 2708 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101110/6a66c6e8/attachment-0004.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0002-toolchain-Add-support-for-with-cpu.patch
Type: text/x-patch
Size: 2638 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101110/6a66c6e8/attachment-0005.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0003-gcc-patch-Add-patch-for-4.4.5-to-support-Sparc-leon-.patch
Type: text/x-patch
Size: 9367 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101110/6a66c6e8/attachment-0006.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0004-uclibc-patch-add-sparc-long-double-gcc-intrinsics-to.patch
Type: text/x-patch
Size: 267209 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101110/6a66c6e8/attachment-0007.bin>
