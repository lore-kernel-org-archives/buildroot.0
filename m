From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 12 Feb 2015 22:03:30 +0100
Subject: [Buildroot] [PATCH 1/1] Add default configuration for Raspberry
 Pi 2 (ARMv7 & NEON)
In-Reply-To: <CA+-urNQusdwq8S_UeMLttY22+v8mzUrFQy4cYyOtzs3q7TOKRA@mail.gmail.com>
References: <20150211175219.22579465@hebden.net.au>
 <20150212190940.GA4277@free.fr>
 <CA+-urNQusdwq8S_UeMLttY22+v8mzUrFQy4cYyOtzs3q7TOKRA@mail.gmail.com>
Message-ID: <20150212210330.GC4277@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Frank, All,

On 2015-02-12 15:51 -0500, Frank Hunleth spake thusly:
> >> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rpi-3.18.y-rebase"
> >
> > We can not use a branch name here. We want either a tag or a sha1.
> > Currently, this is 0be82f722c097340632a59b879fbfee9c6148f53.
> 
> Regarding the Raspberry Pi kernel version, what's the difference
> between using the tip of the rpi-3.18.y branch and the tip of the
> rpi-3.18.y-rebase branch? The kernel source code looks the same
> between branches except for some trailing whitespace in files. Is the
> rpi-3.18.y branch safe from rebases?

No, the rpi-3.18.y is *not* safe from rebase; in fact, it is "constantly"
rebased. That's a shame. :-(

As for the rpi-3.18.y-rebase branch, I have absolutely no idea what it
is meant for:
  - is it a temporary branch that got pushed (it did not exist until a
    few days ago)?
  - is it the branch that will be rebased, leaving rpi-3.18.y alone?
  - something else?

So, I would prefer we stick to using the rpi-3.18.y (or even the
rpi-3.19.y) branch, since we pretty much know how they handle it.

/me should probably go and bug the RPi guys to put some tags on their
    branches from time to time...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
