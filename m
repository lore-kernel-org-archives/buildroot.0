From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Sep 2015 23:35:13 +0200
Subject: [Buildroot] [PATCHv2] package/kodi: needs .py modules
In-Reply-To: <20150913232942.736dea75@free-electrons.com>
References: <1442178783-27567-1-git-send-email-yann.morin.1998@free.fr>
 <20150913232942.736dea75@free-electrons.com>
Message-ID: <20150913213513.GA21306@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-09-13 23:29 +0200, Thomas Petazzoni spake thusly:
> On Sun, 13 Sep 2015 23:13:03 +0200, Yann E. MORIN wrote:
> > Kodi segfaults as soon as it tries to load a python module:
> > 
> >     Could not find platform independent libraries <prefix>
> >     Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
> >     ImportError: No module named site
> >     Segmentation fault
> > 
> > Turns out that keeping .py modules (with or without .pyc) fixes the
> > issue.
> > 
> > Currently, Kodi selects python, but since the format of modules is a
> > choice, we can not select it.
> > 
> > Fix that by inverting the dependency on python from Kodi:
> >   - turn it into a depends rather than a select,
> >   - add the dependency to ! pyc-only
> >   - update the comment accordingly.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Do we actually understand why it doesn't work? There is really no
> reason for .py files to be necessary.

Well, what do I know about python? ;-)

I never said I understood the issue. Just that having only .pyc modules
make Kodi segfault, while having .py makes it work... :-(

All I got was the trace above. There was nothing (of interest) in Kodi's
own log file.

> Does it happen with Python 2 or
> Python 3?

Kodi uses python 2, that's what I have in my config.

> Apparently, Kodi selects Python 2, so there really shouldn't
> be any problem with having just .pyc files (Python 3 can be more
> tricky in that respect.
> 
> > changes v1 -> v2:
> >   - fix spurious 'i' (vim insert)
> 
> But it wasn't enough it seems :)
> 
> > -comment "kodi needs a toolchain w/ C++, threads, wchar, dynamic library"
> > +comment "kodi needs python and .py modiules, and a toolchain w/ C++, threads, wchar, dynamic library"
> 
>                                       ^^^^^^^^

Meh.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
