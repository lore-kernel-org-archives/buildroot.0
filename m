From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Feb 2015 15:01:25 +0100
Subject: [Buildroot] [PATCH 10/11 v5] package/freerdp: install server
 key and certificate
In-Reply-To: <20150222144502.0c6b4ddf@free-electrons.com>
References: <cover.1424558036.git.yann.morin.1998@free.fr>
 <4bfcb4d735dcded5ba4328260a13970af1023c0b.1424558036.git.yann.morin.1998@free.fr>
 <20150222124741.2743fb7c@free-electrons.com>
 <20150222131623.GB4016@free.fr>
 <20150222144502.0c6b4ddf@free-electrons.com>
Message-ID: <20150222140125.GC4016@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-02-22 14:45 +0100, Thomas Petazzoni spake thusly:
> On Sun, 22 Feb 2015 14:16:23 +0100, Yann E. MORIN wrote:
> 
> > Yup, I forgot it.
> > 
> > But now I wonder what those should be: 0644 or 0600 ?
> 
> I was also unsure, and that's why I decided to not add the '-m' myself,
> and open up the discussion. Is it problematic if a non-root user has
> access to this key and certificate?

Well, I don't think so. am not 100% sure about this either.

However, know that those key and cert are already highly public: they
*are* in the FreeRDP repository (i.e. they are not generated at build
time).

So, there is no real security concern about that pair, and I would be
tempted to leave them at 0644.

However, I believe the user should be responsible about providing their
own set of key+cert (and thus set the appropriate permissions on them).

I said in the help text of Weston:

    By default, Buildroot installs such files in /etc/freerdp/server/
    so you may want to change them in a post-build script or a rootfs
    overlay.

So, thanks to your comment, I noticed a few issues, now:

  - the key+cert are only installed when FreeRDP server is installed,
    so we're missing them when onlt the lib is installed. Damn smartin
    who made me change to that situation! :-]

  - the comment about the keys should be moved to the FreeRDP option.

I'll provide follow-up patches soon.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
