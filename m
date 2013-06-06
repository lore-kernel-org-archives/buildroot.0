From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 6 Jun 2013 23:44:16 +0200
Subject: [Buildroot] [PATCH 5/6] package/rpi-firmware: add options to
 select what firmware to install
In-Reply-To: <201306040855.56614.yann.morin.1998@free.fr>
References: <cover.1370289131.git.yann.morin.1998@free.fr>
 <30f6d94a556efedb7d999a778bb6e32071efdda0.1370289131.git.yann.morin.1998@free.fr>
 <8761xugz2g.fsf@dell.be.48ers.dk>
 <201306040855.56614.yann.morin.1998@free.fr>
Message-ID: <20130606214416.GB3461@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2013-06-04 08:55 +0200, Yann E. MORIN spake thusly:
> On Tuesday 04 June 2013 08:38:47 Peter Korsgaard wrote:
> > >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> > 
> >  Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >  Yann> Add two options to rpi-firmware:
> >  Yann>   - the first option to select the firmware being booted, amongst:
> >  Yann>     - the default one
> >  Yann>     - the cut-down one, for emergency
> >  Yann>   - the second to also install all firmwares
> >
[--SNIP--]
> > Do we really need this? Can't people just delete the files they don't
> > want in a post build script like for everything else?
> 
> Yes, it is possible. But since a single firmware will ever be booted,
> there is no reason to install all of them in the first place.
> 
> This last option is here for people that want to switch firmware at
> /runtime/ (ie. with just a mv from within the target).
> 
> Of course, I'm fine with this not going in (but I'd be sad, as I'd
> have to tweak my post-image scripts. ;-) ).

Should I drop this for good, or is there still the slightest chance this
can go in? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
