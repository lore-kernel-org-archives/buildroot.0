From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Apr 2015 23:00:28 +0200
Subject: [Buildroot] [PATCH v4 1/1] Added linux drivers backports project
In-Reply-To: <553564B4.2060303@mind.be>
References: <1429311670-7831-1-git-send-email-petr.vorel@gmail.com>
 <20150419110326.31c34542@free-electrons.com>
 <5533D5CF.5000305@mind.be> <20150419162839.GI4313@free.fr>
 <20150419190321.19200e70@free-electrons.com>
 <553564B4.2060303@mind.be>
Message-ID: <20150420210027.GB4057@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-04-20 22:42 +0200, Arnout Vandecappelle spake thusly:
> On 19/04/15 19:03, Thomas Petazzoni wrote:
> > Dear Yann E. MORIN,
> > 
> > On Sun, 19 Apr 2015 18:28:39 +0200, Yann E. MORIN wrote:
> > 
> >> Well, I would not be very happy with that, since that would make the
> >> following use-case a real pain:
> >>
> >>     $ make foo_defconfig
> >>     $ make linux-menuconfig
> >>
> >> Currently, all it needs is the linux kernel to be extracted and patched,
> >> and none of its depedencies to be built. Otherwise, it would require the
> >> toolchain to be built, plus a sh.tload of other stuff (lzo, for one, and
> >> all its own dependencies).
> > 
> > We could remove the mandatory host-lzo dependency from the linux
> > package, by adding an option for that. Remember the recent patches also
> > adding host-xz to the dependencies of linux, which I rejected?
> > 
> > This would leave host-kmod as the only dependency of the linux package
> > I believe. But well host-kmod as AUTORECONF = YES, so it pulls a whole
> > bunch of crap.
> 
>  As mentioned before, it pulls in the toolchain as well. That's a lot worse than
> host-lzo and host-xz - even extracting an external toolchain takes longer than
> host-xz (at least for me).
> 
> 
>  However, we can add the dependency specifically for linux-backports. There is
> something to be said for the reasoning that usually/sometimes you don't need the
> dependencies to be present, so doing it per package sounds OK.
> 
>  So in this case, adding
> 
> $(LINUX_BACKPORTS_KCONFIG_FILE): linux
> 
> to linux-backports.mk should be sufficient.

Yes, I have the same reasoning, and I think what you suggest is good
enough to be considered the good solution.

If we end up having more such cases, we can revisit this in the future.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
