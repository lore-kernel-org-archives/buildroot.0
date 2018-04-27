From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 27 Apr 2018 22:02:45 +0200
Subject: [Buildroot] [PATCH RFC] legal-info: add option to store
 manifest in rootfs
In-Reply-To: <fcf05ec0-3482-d265-c186-64492601e8a6@lucaceresoli.net>
References: <20180426193252.19616-1-yann.morin.1998@free.fr>
 <20180427154650.3710e52e@windsurf>
 <fcf05ec0-3482-d265-c186-64492601e8a6@lucaceresoli.net>
Message-ID: <20180427200245.GA14947@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2018-04-27 18:33 +0200, Luca Ceresoli spake thusly:
> On 27/04/2018 15:46, Thomas Petazzoni wrote:
> > On Thu, 26 Apr 2018 21:32:52 +0200, Yann E. MORIN wrote:
> >> Some users want to be able to easily ship the manifest of the legal-info
> >> directly in the target filesystem.
> >>
> >> Those users currently hack their ways around, usign a post-build script
> >> that calls back to generate legal-info; this is a bit hackish...
> >>
> >> Add an option to that effect.
> >>
> >> Reported-by: Florian Fainelli <f.fainelli@gmail.com>
> >> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >> Cc: Florian Fainelli <f.fainelli@gmail.com>
> >> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> >> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > 
> > I'd like to challenge the usefulness of having the manifest on the
> > target. What is the actual use case ?
> > 
> > Indeed, for license compliance of copyleft license (i.e at least GPL,
> > LGPL), having the name of the software package, its version and its
> > license is not sufficient, you also need to provide the full
> > corresponding source code.
> 
> I think this is partially wrong. I also think the patch is partially
> wrong.

I sent the patch as RFC. ;-)

> And I even think the entire world is partially wrong, but that's
> another story. :)

Someone needs to take their pills... ;-)

> GPL asks (in certain cases) to display the copyright notice and the
> license (or a link to it) (more or less) (and remember IANAL:). Android
> phones are a good esample of it: in the last item of the last menu entry
> of some obscure app there is an insanely long cat of license texts. One
> might want to do a similar thing on a device with a suitable GUI. I
> think this is a reasonable way to be compliant, although there are other
> ways.

Yes, but on some devices, it may be very inconvenient to read the whole
stuff, and thus just the manifest plus an URL for the rest is probably
OK (not the letter of the licenses, but the spirit) And if that is the
only deviation from proper compliance and all the rest i OK, there is in
practive no issue.

> Hence this patch makes sense to me, but it is insufficient. It should
> also store the license text in the rootfs, in order for a GUI
> application to be able to load that text and visualize it.

For example, my TV set has a similarly long list of legalese, and I
once tried to browse it to the end. I bailed out after 5 minutes of
scrolling... It was basically taking ~1s to scroll every single line...
Having just the list (aka the manifest) plus the URL would be more
usable! ;-)

So I think that what Florian needs is acceptable.

But! IANAL.

Regards,
Yann E. MORIN.

> Providing the full corresponding source code is a different topic IMO.
> It is allowed by the GPL that the device does not contain it, and there
> are obvious techincal motivations not to do so. But the license (that
> one must make available) states one has the right of asking and
> receiving the code. Continuing with the above example, the Android
> phones do not contain the full source code.
> 
> > So what is the need for having just the manifest ? Obviously the
> > complexity of the patch is low, but it's yet another Config.in option,
> > so I'd like to be sure there is a real, useful use case for it.
> 
> As I said the patch (with additions) would make sense. I'm not saying it
> should be applied, but we should provide users with an alternative. Uhm,
> maybe one can do 'make legal-info; cp <legal-stuff> ${ROOTFS}/usr/share'
> in a post-build script?
> 
> -- 
> Luca

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
