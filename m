From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2012 13:32:47 +0200
Subject: [Buildroot] [PATCH 02/36] package/sdl: add symlink to sdl-config
In-Reply-To: <20120813125710.13d0fc69@skate>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
 <1344815664-28138-2-git-send-email-yann.morin.1998@free.fr>
 <20120813125710.13d0fc69@skate>
Message-ID: <201208131332.47716.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Monday 13 August 2012 12:57:10 Thomas Petazzoni wrote:
> Le Mon, 13 Aug 2012 01:53:50 +0200,
> "Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :
> 
> > SDL installs a script-based sdl-config in the sysroot, but some
> > packages (eg. QEMU) needs it to be either:
> >   - prefixed with the cross-prefix
> >   - in the PATH
> > 
> > So, as sdl-config is a script, and although it is installed in
> > the sysroot, it can be run on the host.
> 
> Well, that's typically not how we handle this problem. In general, we
> pass the complete location of the <foo>-config script to
> the ./configure script of the package that needs it.

Yep, I knew this one would raise eyebrows. ;-)

> I would prefer if
> we could use this solution everywhere instead of having a different
> solution in different places for the same problem.

But still, is it the right solution to use the sdl-config, although it is
installed in staging?

> Do you know if it
> would be possible with Qemu?

Ah, looking further, there's SDL_CONFIG we can set (I missed it...)
Will fix.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
