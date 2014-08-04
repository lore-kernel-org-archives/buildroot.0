From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Aug 2014 23:00:15 +0200
Subject: [Buildroot] [PATCH v2] bcache-tools: Adding package.
In-Reply-To: <53DFE4BC.5020401@tribudubois.net>
References: <1406839219-10929-1-git-send-email-jcd@tribudubois.net>
 <20140803185340.GI4052@free.fr> <53DFE4BC.5020401@tribudubois.net>
Message-ID: <20140804210014.GF3875@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jean-Christophe, All,

On 2014-08-04 21:53 +0200, Jean-Christophe DUBOIS spake thusly:
> Le 08/03/2014 08:53 PM, Yann E. MORIN a ?crit :
> >Jean-Christophe, All,
> >
> >On 2014-07-31 22:40 +0200, Jean-Christophe DUBOIS spake thusly:
> >>+define BCACHE_TOOLS_BUILD_CMDS
> >>+	$(BCACHE_TOOLS_FIX_PKGCONFIG)
> >>+	$(BCACHE_TOOLS_MAKE_ENV) $(MAKE) -C $(@D)
> >This should probably be:
> >     $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
> >
> >TARGET_CONFIGURE_OPTS contains the CC= assignment.
> >
> >Thus, the BCACHE_TOOLS_MAKE_ENV no longer makes sense, so you can remove
> >it.
> 
> When I do as you propose then various compilation variables
> $(TARGET_CONFIGURE_OPTS) are passed as $(MAKE) arguments.
> 
> Therefore these variables cannot be overridden/changed in the Makefile
> (which might the the desired behavior) unless explicitly allowed with the
> "override" directive.
> 
> Unfortunately the bcache-tools Makefile needs (for now) to be able to
> override the CFLAGS variable.
> 
> So I can certainly "patch" the bcache-tools Makefile (in the post extract
> hook for example) to allow "overriding" on the CFLAGS variable.
> 
> Another solution is to pass $(TARGET_CONFIGURE_OPTS) as environment
> variables to $(MAKE) in which case the various variables can still be
> modified by the Makefile.
> 
> Which of these 2 solutions is the preferred solution?

Hmmm. I'd say to pass them in the env (your second solution.) But I
can't vouch for the other developpers. Thomas P.?

Oh, BTW, I forgot one more point in my earlier review: please add the
URL to the homepage for the package:
    http://bcache.evilpiepirate.org/

And as requested by Thomas DS, change the help text to just replicate
the headlines of the homepage:

    help 
      Bcache is a Linux kernel block layer cache. It allows one or more
      fast disk drives such as flash-based solid state drives (SSDs) to
      act as a cache for one or more slower hard disk drives.

      http://bcache.evilpiepirate.org/

> Is there another (more correct?) solution that would allow to change the
> CFLAGS variable contained in $(TARGET_CONFIGURE_OPTS)?

Make it a proper autotools package and submit it upstream?
Just kidding ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
