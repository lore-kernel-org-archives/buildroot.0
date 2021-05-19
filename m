From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 14:00:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/python3-six: add python3 variant
In-Reply-To: <1621370634009.93154@lab126.com>
References: <1620853148995.76548@lab126.com> <20210518150056.GQ2506@scaer>
 <1621370634009.93154@lab126.com>
Message-ID: <20210519120015.GU2268078@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chan, All,

On 2021-05-18 20:43 +0000, Chan, Donald spake thusly:
> On 2021-05-12 20:59 +0000, Chan, Donald via buildroot spake thusly:
> >> Signed-off-by: Donald Chan <hoiho@lab126.com>
> >Why do you need a python3-specific version of six?
> This was for the host side Python packages

Your patch was adding both the target and the host variants, though.

> - I see the same patterns
> for other python packages like
> - python3-requests/python3-requests.mk
> - python3-mako/python3-mako.mk

Ah, but those were added because we have a need for them: in some
situations, we need to have both the python2 and python3 modules for
those installed at the same time.

For example:
    $ git grep -E 'host-python3?-mako'
    package/gnuradio/gnuradio.mk:# host-python-mako and host-python-six are needed for volk to compile
    package/gnuradio/gnuradio.mk:	host-python-mako \
    package/jailhouse/jailhouse.mk:	host-python-mako \
    package/mesa3d/mesa3d.mk:	host-python3-mako \
    package/piglit/piglit.mk:	host-python-mako \
    package/sdbusplus/sdbusplus.mk:	host-python-mako \
    package/uhd/uhd.mk:	host-python-mako

So, as you can see, we have packages that need the python2 host mako,
and others (one, really) that needs the python3 host mako. The situation
is similar for the other python3-specific packages.

> Let me me know if this makes sense.

Yeah, I see the reasoning, but we are only adding the python3-specific
variant when there is an actual need for it.

If you can provide such an example that a specific host-python3-six
is needed, do not hesitate to resend your patch with such an explanation
in your commit log.

Thanks again for your contribution!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
