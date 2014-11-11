From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Nov 2014 18:26:05 +0100
Subject: [Buildroot] [PATCH v2 01/15] package/pkg-autotools.mk:
 Factorize hooks.
In-Reply-To: <54621010.6030000@mind.be>
References: <1415366931-6870-1-git-send-email-johan.oudinet@gmail.com>
 <1415366931-6870-2-git-send-email-johan.oudinet@gmail.com>
 <20141110221323.GF22119@free.fr> <54620920.5050203@mind.be>
 <20141111131704.GG4240@free.fr> <54621010.6030000@mind.be>
Message-ID: <20141111172605.GM4240@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Johan, All,

On 2014-11-11 14:33 +0100, Arnout Vandecappelle spake thusly:
> On 11/11/14 14:17, Yann E. MORIN wrote:
[--SNIP--]
> > Well, both of us are partialy wrong, I think. LIBTOOL_PATCH_HOOK is a
> > post-patch hook, while GETTEXTIZE_HOOK and AUTORECONF_HOOK are pre-configure
> > hooks. So, the order at which they are defined is irrelevant, as it is done
> > right now.
> > 
> > But I agree with Arnout, we need to rework this.
[--SNIP--]
>  All this makes it pretty clear that reworking the call should be done in a
> separate patch :-)

I'm mostly done with just the autotools rework. It's no longer a single
patch, and not even two. It's a 7-patch series, now:

    db9396b pkg-autotools: move common macros
    aaecaca pkg-autotools: re-order cleaning up the host dependencies
    aaf7f5a pkg-autotools: commonalise the libtool patching code
    54e296d pkg-autotools: move the libtool patching call out of the autoreconf hook
    541764e pkg-autotools: remove redundant shell conditional
    120fc9c pkg-autotools: fold the libtool patching code directly into the hook
    77feedc pkg-autotools: only apply libtool patch at the right moment

I'll post those later tonight. I still hope to have time to rework the
pkg-rebar patch today...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
