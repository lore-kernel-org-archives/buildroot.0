From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Dec 2018 19:47:25 +0100
Subject: [Buildroot] [PATCH v2] package: dropbear: make PATH configurable
In-Reply-To: <CAGt4E5v655G7xF0sXUx7gb9ecfDC6UE+Jbx8jEK1_roKzFNKng@mail.gmail.com>
References: <20180309224149.20225-1-mmayer@broadcom.com>
 <20181216152603.GD2384@scaer>
 <CAGt4E5v655G7xF0sXUx7gb9ecfDC6UE+Jbx8jEK1_roKzFNKng@mail.gmail.com>
Message-ID: <20181216184725.GA2951@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus, All,

On 2018-12-16 09:04 -0800, Markus Mayer spake thusly:
> On Sun, 16 Dec 2018 at 07:26, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2018-03-09 14:41 -0800, Markus Mayer spake thusly:
> > > Make the default PATH dropbear is using configurable.
> > But pushing the thing even further, we think a generic solution is even
> > better:
> >   - in the "System configuration" sub-menu, add a new option that
> >     basically is "Default PATH" and defaults to /bin:/sbin:/usr/bin:/usr/sbin
> 
> Would it make sense to use the order /bin:/usr/bin:/sbin:/usr/sbin?
> Conceptually, that would make it pick up non-admin and non-system
> tools first. In reality, it likely wouldn't make a difference, because
> there won't be programs of the same name in a "bin" path and in an
> "sbin" path. But if there are, for whatever reason, it's nicer if it
> picks the one that will do "less damage" by default, unless explicitly
> told otherwise.
> Anyway, it's just a thought.

Currently, system/skeleton/etc/profile contains /bin:/sbin:/usr/bin:/usr/sbin
so I'd suggest we keep that as the default for this new option.

Whether that value makes sense or not is a different topic. I had a look
at POSIX, and they define a default value, nor suggest one. On my
machine, /etc/environment exports a PATH with:
    /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
while /etc/login.defs sets PATH to:
    /usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

So, I don;t really care, but if it is changed, it should be in its own
patch.

> > Care to have a look?
> I like it. :-)

Cool thanks! Don't forget to Cc me on the resulting series, so I'm sure
not to miss it. (which does not mean you'll get a fast review, mind
you! :-/)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
