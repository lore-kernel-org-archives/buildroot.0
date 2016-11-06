From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Nov 2016 11:41:06 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-11-04
In-Reply-To: <df69f5f2-2881-d4b9-759a-3c2f4bcf7192@mind.be>
References: <20161105073056.4969320D86@mail.free-electrons.com>
 <df36574f-bff9-b295-2a82-825a13894f58@gmail.com>
 <df69f5f2-2881-d4b9-759a-3c2f4bcf7192@mind.be>
Message-ID: <20161106104106.GA3367@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-11-06 02:30 +0100, Arnout Vandecappelle spake thusly:
> On 05-11-16 23:03, Romain Naour wrote:
> > You can reproduce the issue easily by adding LC_ALL=C to TVHEADEND_BUILD_CMDS.
> > Can we force the utf8 encoding ?

Arg, I spent quite a bit of time on that one, but had no idea what was
going on there. Thanks for the hint. :-)

>  Maybe we should export LC_ALL=C.UTF-8 instead of LC_ALL=C ? That might have
> some unexpected side effect, but I don't really expect it.

But we only force LC_ALL for reproducible builds so far.

Alternatively, we could see if the locale is UTF-8; if not, then we
force such a locale.

>  If we want to be on the safe side, we can just do that bit in
> TVHEADEND_BUILD_CMDS to override the global locale.

Yep, that works. I'll send a patch. Thanks for the hints! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
