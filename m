From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Mar 2021 23:30:40 +0100
Subject: [Buildroot] [PATCH 00/12 v8] Introduce libudev (branch
 yem/libudev-4)
In-Reply-To: <99d32ded-9102-c9a7-4f15-38d1bd0a0537@t-online.de>
References: <cover.1468274498.git.yann.morin.1998@free.fr>
 <99d32ded-9102-c9a7-4f15-38d1bd0a0537@t-online.de>
Message-ID: <20210308223040.GF2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

(sorry for the duplicate, but your mails are not real Cc...)

On 2021-03-08 22:59 +0100, Bernd Kuhls spake thusly:
> years later there is a new solution for this problem: libudev-zero
> 
> Here is a hackish patch for buildroot which I am using with Kodi 19/gbm/
> OpenGLES/no_X11 to provide udev support for libinput:
> 
> https://github.com/bkuhls/buildroot/commit/
> ba49d2a8f9bb9879373d17711b82adfe867f4bdc
> 
> What about adding libudev-zero to buildroot?

Well, eudev now has had the ability to only build the library for a while
already:

    https://github.com/gentoo/eudev/commit/18565392cfecb5be6f3261ae0f82827c9ecfa08b

One issue I see with libudev-zero, is that is installs a drop-in
replacement for libudev, so it will conflict with eudev and systemd.

Also, packages that only need libudev would still need a generic
abstraction in the form of a virtual package that abstract libudev.

So, I would prefer we first stick with just eudev like my latest branch:
    https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/libudev-6

Then, of course, we could add libudev-zero as a fourth provider for
libudev, why not...

Sorry I haven't taken the time to properly rebase and resend this v6 of
my branch yet... :-( I can try to have a look, but feel free to grab my
patches and massage them as needed. Most patches need better commit
log...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
