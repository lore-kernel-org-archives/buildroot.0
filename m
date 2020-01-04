From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 4 Jan 2020 09:02:34 +0100
Subject: [Buildroot] [PATCH 1/5] utils/scancpan: warn when a module is a
 perl core module
In-Reply-To: <CAAXf6LVoWMk6ESza5jY40a9H_067iw3MJ5ksjwQ4Zbm4KbLJbQ@mail.gmail.com>
References: <20191222162146.1947-1-francois.perrad@gadz.org>
 <20191222163338.GI26395@scaer>
 <CAAXf6LVoWMk6ESza5jY40a9H_067iw3MJ5ksjwQ4Zbm4KbLJbQ@mail.gmail.com>
Message-ID: <20200104080234.GA2312@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Fran?ois, All,

On 2020-01-03 16:56 +0100, Thomas De Schampheleire spake thusly:
> El dom., 22 dic. 2019 a las 17:33, Yann E. MORIN
> (<yann.morin.1998@free.fr>) escribi?:
> > On 2019-12-22 17:21 +0100, Francois Perrad spake thusly:
> > > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> >
> > This change does need to be explained in the commit log:
> >
> >   - Why is it bad that we have a pacakge that is a core module?
> >   - Does it cause any issue? If so, which one?
> >
> > Also, when you do removes package, the least is to add in Cc the people
> > that initially added the package, so they have a chance to chime in and
> > explain why they wanted to add it in the first place, and so they can
> > confirm that the core module does indeed work for them.
> >
> > I'll mark the whole series as Changes Requested in Patchowrk. Please
> > respin with explanations, and Cc original packagers.
> 
> When submitting the package perl-math-bigint I was not aware that it
> was a core package.
> After Fran?ois mentioned it, we checked internally if indeed things
> work fine without the Buildroot package, and it is the case.
> So, there is no need for package/perl-math-bigint.
> 
> There is no actual harm by also having a Buildroot package, except for:
> - unneeded stuff in Buildroot
> - potential to eclipse a newer version of the package when
> package/perl evolves but package/perl-math-bigint does not.
> 
> So from my point of view I would indeed remove the package again.
> I was actually going to send a revert but then I saw this series.

Thanks for the feedback. I had seen the previous forth-n-back about
math-bigint too, so was pretty aware of the situation. Nonetheless, it
should have been explained in the commit log.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
