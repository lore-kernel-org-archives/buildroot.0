From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jan 2015 16:36:37 +0100
Subject: [Buildroot] [PATCH] mjpegtools: new package
In-Reply-To: <54B954C0.4010503@ou.edu>
References: <54B954C0.4010503@ou.edu>
Message-ID: <20150118153637.GL4275@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steve, All,

On 2015-01-16 12:13 -0600, Steve Kenton spake thusly:
> The mjpegtools programs are a set of tools
> that can do recording of videos and playback,
> simple cut-and-paste editing and the MPEG
> compression of audio and video under Linux.
> 
> http://mjpeg.sourceforge.net
> 
> Signed-off-by Stephen M. Kenton <skenton@ou.edu>
> ---
> Build tested with both uClibc and glibc against last nights snapshot
> 
> Every buildroot patch I generate turns out to be a learning experience
> So, let's see what I don't know this time ...

We were all learners at tsome point! ;-)

> Finding the higher level dependencies is still beyond me,

We basically have a set of toolchains for various presets, like with or
without threads, with or withour locales, with glibc or uclibc, on
different architectures, and we have some autobuilders that constantly
build random package selections with a randomly choosen toolchain:

    http://autobuild.buildroot.org/
    http://autobuild.buildroot.org/toolchains/

It is interesting to test with at least uClibc and glibc (like you did),
but also with a very "light" toolchain that has no fancy stuff: no
threads, no IPv6, no locales... such as this one:
    http://autobuild.buildroot.org/toolchains/configs/br-arm-basic.config

Use it as thus:

    wget -O defconfig http://autobuild.buildroot.org/toolchains/configs/br-arm-basic.config
    make BR2_DEFCONFIG=$(pwd)/defconfig defconfig
    make menuconfig    (select whatever package you want to test)
    make

It helps find the obvious basic requirements.

Then, for the not-so-obvious requirements, we have the autobuilders to
do all the testing. ;-)

> so I think
> I'll concentrate on learning to use git as a next step. Thanks for
> all the help getting these packages in shape.

Cheers! Thanks for the submissions! :-)

> Obviously I'm working
> on multi-media stuff. If there is a wish list for other related
> packages let me know and I'll try and work them up for submission.

Well, you can have a look at the Patchwork, there are quite a few
multi-media related patches pending:

    http://patchwork.ozlabs.org/project/buildroot/list/

[--SNIP--]

I did not find anything highly suspicious in that patch. Good. :-)

However, we now like to store hashes for the tarballs we download, so we
can test for integrity :

    http://buildroot.net/downloads/manual/manual.html#adding-packages-hash

Sourceforget provides SHA1 hashes when you click on the (i) button next
to the file you want to download.

Care to respin with that file added, please?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
