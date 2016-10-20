From: Stefan Nickl <stefan.nickl@gmail.com>
Date: Thu, 20 Oct 2016 23:24:25 +0200
Subject: [Buildroot] [PATCH] pppd: Provide error() implementation in
	pppoe-discovery
In-Reply-To: <7e6742e0-fcd9-8ee3-e77d-358e345bd595@mind.be>
References: <1476555914-22201-1-git-send-email-Stefan.Nickl@gmail.com>
 <20161015223315.47f04e55@free-electrons.com>
 <CAFOMc=SKjm5J-hn=+qexzeRqqNWJEXKWUUQnckX3ei8c6BMTkA@mail.gmail.com>
 <7e6742e0-fcd9-8ee3-e77d-358e345bd595@mind.be>
Message-ID: <CAFOMc=RqfAsKHB9QXwhVepW-YKeYh2znH06MQixZg6E=yDLwag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 16, 2016 at 11:14 PM, Arnout Vandecappelle <arnout@mind.be>
wrote:

>  Are the patches[1] that you submitted to fix musl builds still valid?
>
>
>  Regards,
>  Arnout
>
> [1] http://patchwork.ozlabs.org/patch/664683/
>
>
Hi Arnout and Thomas,

sort of, but:
1) One of those patches changes stuff in the area where the current uclibc
breakage happens, but I don't know how it interacts with that. I also just
sent out a new patch for that one.
2) The series didn't include one final patch for actually allowing musl in
Config.in. I also added some stuff to expose more options from the ppp
Makefile, so that patch probably needs breaking up before it makes sense to
submit (but see alternate proposal below).
3) The patch that started this thread is a "nicer" version for one in the
series.

The thing is that pppd seems mostly unmaintained now, it contains lots of
non-linux platform code and drags stuff along that is no longer relevant,
especially for embedded people (IPX, anyone?).

So I'm trying for a stripped-down fork of pppd at
https://github.com/snickl/lppp/tree/lpppd

The idea would be to only have the most urgent/minimal fixes for classic
pppd and do musl-ification among other things in lpppd.

However at least in the beginning I'd like to drop the rp-pppoe plugin from
lpppd, which is quite a troublemaker.

Any thoughts?

-- 
Stefan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161020/24d947a1/attachment.html>
