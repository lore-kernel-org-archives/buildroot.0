From: Martin Hicks <mort@bork.org>
Date: Mon, 4 Apr 2011 10:02:44 -0400
Subject: [Buildroot] working with u-boot
In-Reply-To: <BANLkTi=5sFsogvPiXWNvZaCO=JcyiZ0Wqg@mail.gmail.com>
References: <BANLkTi=5sFsogvPiXWNvZaCO=JcyiZ0Wqg@mail.gmail.com>
Message-ID: <BANLkTimbaWZKMSmubqQ+Q-uFU4JXK6UFsA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Apr 3, 2011 at 12:34 PM, Charles Krinke
<charles.krinke@gmail.com> wrote:
> I am editing and recompiling u-boot a bit from within buildroot and
> currently am doing this to get a "clean"
>
> $buildroot?? cd output/build/u-boot
> $u-boot?? rm -rf .o
> $u-boot?? cd ../../../
> $buildroot rm output/build/u-boot/.configured
> $ make
>
> And this gets me a fresh compile of u-boot.
>
> Is there a better way to do this?

I do:

rm -f output/build/u-boot*/u-boot*

Which deletes all the binaries.  If you investigate the dependencies
in boot/u-boot/u-boot.mk you'll see that it depends on those.

mh

-- 
Martin Hicks P.Eng. ?? ? | ? ? ? ? mort at bork.org
Bork Consulting Inc. ? ? | ? +1 (613) 266-2296
