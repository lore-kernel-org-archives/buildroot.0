From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 5 Sep 2016 11:15:57 +0200
Subject: [Buildroot] Analysis of build results for 2016-08-08
In-Reply-To: <24787add-75fb-ff38-fc57-3bbf6626322d@mind.be>
References: <20160809063032.89898101A55@stock.ovh.net>
 <20160809141535.4c9b8169@free-electrons.com>
 <17850212-c769-63c4-f05b-79adc47f470c@gmail.com>
 <34622bb9-7ff7-2d15-fa97-e5ed6570034b@gmail.com>
 <2e0ca47d-83cf-4c2d-844b-9560b98733c3@free.fr>
 <81bcbe49-664c-6d7d-f12c-e4b66c53a91a@mind.be>
 <09e2a649-7606-8726-520f-c33934424413@free.fr>
 <24787add-75fb-ff38-fc57-3bbf6626322d@mind.be>
Message-ID: <20160905091557.GA5553@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On 2016-09-05 10:14 +0200, Arnout Vandecappelle spake thusly:
> On 03-09-16 17:05, Julien Boibessot wrote:
> > On 26/08/2016 00:37, Arnout Vandecappelle wrote:
> [snip]
> >>  Looking at the source of edje_cc, it's mkstemp() that fails. Do you have TMPDIR
> >> or XDG_RUNTIME_DIR pointing to some location that is not writable or doesn't exist?
> > 
> > XDG_RUNTIME_DIR is indeed pointing to a directory that is not writable
> > for user launching the build.
> > export XDG_RUNTIME_DIR=/tmp fixes the host-efl build.
> > Where should I set this envt variable ?
> > 
> > (Build is launched through ssh+su on my build server)
> 
>  I guess you should unset XDG_RUNTIME_DIR somewhere in that script :-)

Most probably, use 'su -', instead of just 'su', so that the environment
from the calling user is reset.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
