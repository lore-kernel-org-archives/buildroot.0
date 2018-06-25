From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jun 2018 21:27:39 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-06-23
In-Reply-To: <20180625210405.3a8d6f8a@gmx.net>
References: <20180624060020.55B692079C@mail.bootlin.com>
 <20180625210405.3a8d6f8a@gmx.net>
Message-ID: <20180625212739.3b60e8f4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Jun 2018 21:04:05 +0200, Peter Seiderer wrote:

> Related to the version bump to 2.46, now the static build is disabled by the tool author,
> make static in the wiringPi directory gives the following output:
> 
> 	$ cd build/wiringpi-2.46/wiringPi && make static
> 
>     wiringPi is no-longer shipped with the ability to statically link it.
> 
>     Many reasons but the biggest issue is people who have statically linked
>     wiringPi into their product - for example a Pi UPS device or a Tetris-like
>     game and not subsequently shipped their modified sources. These people are
>     no better than common thieves with complete disregard to the conditions
>     of the LGPL that wiringPi ships with.
> 
>     Additionally, many think it's a good idea to statically link wiringPi
>     into their favourite language - like Node, and Java and other itsy bitsy
>     little things. These people have a complete and utter disregard to what
>     happens underneath when e.g. the Linux kernel changes on the Pi then
>     wiringPi stops as it depends on some Pi kernel features, then the poor
>     user get in-touch with me and I've had over 10,000 emails so-far and
>     it's now beyond a joke.
> 
>     DO NOT STATICALLY LINK WIRINGPI.
> 
>     Gordon Henderson, March 2018.
> 
> 
> What to do?

Stop packaging the crap that wiringpi is ?

> Honour Gordons request and disable wiringPi in buildroot for static
> builds or patch the wiringPi makefile to re-introduce the static linking?

Our policy has (almost) always been to comply with upstream requests,
so I would disable static linking for this package.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
