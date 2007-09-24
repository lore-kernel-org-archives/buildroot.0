From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 24 Sep 2007 20:48:30 +0200
Subject: [Buildroot] using PROJECTs with buildroot
In-Reply-To: <1190645009.7015.130.camel@elrond.atmel.sweden>
References: <20070918163008.GA14096@aon.at> <20070918171028.GB14096@aon.at>
	<20070921153339.GG5788@aon.at> <20070924123117.GA1010@aon.at>
	<1190645009.7015.130.camel@elrond.atmel.sweden>
Message-ID: <20070924184830.GI20058@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 24, 2007 at 04:43:29PM +0200, Ulf Samuelsson wrote:
>m?n 2007-09-24 klockan 14:31 +0200 skrev Bernhard Fischer:

>> On Fri, Sep 21, 2007 at 05:33:40PM +0200, Bernhard Fischer wrote:
>> >Hi,
>> >
>> >I'd like to ask how that project thing is supposed to be used and how it
>> >could be fixed (assuming that i'm not doing something wrong, which could
>> >easily be).
>> >
>> >Suppose i want to create two images (or BSP's like some call those).
>> >
>> >To keep things simple, let's assume that i'm using the same version of
>> >binutils and gcc for all.
>> >
>> >
>> >BR2_PROJECT=imageA: kernel 2.6.22.6 with LFS support on
>> >BR2_PROJECT=imageB: kernel 2.6.22.1 without LFS
>> >
>> >0) I 'rm -rf *_i386 binar*'
>> >1) I configure and build imageA. So far so good.
>> >2) I configure and build imageB. The resulting image looks like this:
>> >$ tar -tvf binaries/imageB/rootfs.i386-20070919.tar | grep "2.6.22../$"
>> >drwxr-xr-x root/root         0 2007-09-19 19:05 ./lib/modules/2.6.22.6/
>> >$ egrep "(2_6_22|PROJECT)" .config
>> >BR2_PROJECT="imageB"
>> >BR2_KERNEL_HEADERS_2_6_22_1=y
>> ># BR2_KERNEL_HEADERS_2_6_22 is not set
>> >
>> >Not exactly what i'd have expected.
>> >Perhaps i made a mistake? If so please explain how that would work
>> >properly?
>> >
>
>The project thingy will allow you to share a toolchain
>with one set of kernel headers.
>You can't have two set of kernel headers.

Ah. Can you think of a non-intrusive way to prevent this (or is that in
the docs already? I admit that i didn't look, but this should be
mentioned in a very prominent place).

>Then you need to build a separate toolchain.
>
>It looks to me that the user has changed the kernel headers version
>between imageA and imageB.
>That is illegal, then he needs to rebuild the toolset.

Ok. I was under the impression that the project was ment to build
distinct projects (as in very distinct, not just differing in the
package-selection). Thanks for the explanation.
