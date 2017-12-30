From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Dec 2017 15:43:15 +0100
Subject: [Buildroot] [PATCH 2/3] package/brltty: use gcc instead of ld
 to link shared objects
In-Reply-To: <87o9mg1e37.fsf@home.blind.guru>
References: <20171230104804.16489-1-mlang@blind.guru>
 <20171230104804.16489-2-mlang@blind.guru>
 <20171230130711.GB2921@scaer> <87o9mg1e37.fsf@home.blind.guru>
Message-ID: <20171230144315.GF2921@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mario, All,

On 2017-12-30 15:32 +0100, Mario Lang spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> writes:
> > Since this is a backport of an upstream commit, we like to have a
> > pointer to the upstream commit:
> >     https://github.com/brltty/brltty/commit/4c8aba42e246b96d10ffcbd57653682375499e46
> OK, sorry.  Was not aware of that.  Can you add this to the commit log,
> or should I resend the patch?
[--SNIP--]
> > Also, since you are patching configure.ac, you must autoreconf:
> >     BRLTTY_AUTORECONF = YES
[--SNIP--]
> We already do the equivalent of autoreconf.  BRLTTY_AUTORECONF = YES
> does not work with BRLTTY, as BRLTTY is a autoconf-only package.  Please
> see the comment added by Thomas in brltty.mk:

Ah, I did not have an up-to-date master branch. I pulled and now I can
see it, indeed.

So, since we already need to autoconf, we can keep your patch as-is.

I guess whoever applies your patch can add the URL to the patch commit
log, yes, so I would say no need to resend.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
