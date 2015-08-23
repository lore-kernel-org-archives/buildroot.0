From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Aug 2015 11:47:50 +0200
Subject: [Buildroot] [PATCH] package: add comment about ipkg/opkg/rpm
In-Reply-To: <55D8FA56.5020009@mind.be>
References: <1440085901-24479-1-git-send-email-yann.morin.1998@free.fr>
 <55D8FA56.5020009@mind.be>
Message-ID: <20150823094750.GC3729@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-08-23 00:40 +0200, Arnout Vandecappelle spake thusly:
> On 08/20/2015 05:51 PM, Yann E. MORIN wrote:
> > Too often the question is raised, that ipkg, opkg and rpm do not work,
> > and users complain they can not install packages.
> > 
> > Even though we do have a clear and clearly explained section in our
> > manual, people do not read it (when will users read manuals? sigh...).
> > 
> > So, add a big fat comment about ipkg/opkg/rpm, that Buildroot does not
> > generate binary packages and does not provide any package database for
> > any of those package manager.
> 
>  Great plan!
> 
>  And guess what: not a single spelling mistake! Congrats, Yann!

Well, it's usually not spelling mistakes, but keyboard-dislexia. ;-]

[--SNIP--]
> > diff --git a/package/Config.in b/package/Config.in
> > index 47d14d7..c32c989 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -1371,6 +1371,19 @@ endif
> >  endmenu
> >  
> >  menu "Package managers"
> > +comment "------------------------------------------------------------------------"
> > +comment "Please note:                                                            "
> > +comment "- Buildroot does *not* generate binary packages,                        "
> > +comment "- Buildroot does *not* install any package database.                    "
> > +# First space is U+00A0 (NO-BREAK SPACE), otherwise kconfig eats
> > +# up all spaces:
> > +comment "                                                                        "
> 
>  Nice trick, however:
> - it requires a UTF-8 terminal;
> - it breaks completely in nconfig;
> - in menuconfig, the final *** gets shifted by one space when I tried.

OK. Bad idea...

>  So I'd stick to the *

Ack.

> > +comment "It is up to you to provide those by yourself if you want                "
> > +comment "to use any of those package managers.                                   "
> > +comment "                                                                        "
> > +comment "See the manual:                                                         "
> > +comment "http://buildroot.org/downloads/manual/manual.html#faq-no-binary-packages"
> > +comment "------------------------------------------------------------------------"
> 
>  Don't know how important this is, but on a 80-character display it gets chopped
> off after the faq-no-. But I guess there's not much we can do about it.
> Except perhaps: http://nightly.buildroot.org/manual.html#faq-no-binary-packages
> - still doesn't fit but at least we get to the binary-pa :-)

What about;

    comment "-----------------------------------------------------"
    comment "Please note:                                         "
    comment "- Buildroot does *not* generate binary packages,     "
    comment "- Buildroot does *not* install any package database. "
    comment "*                                                    "
    comment "It is up to you to provide those by yourself if you  "
    comment "want to use any of those package managers.           "
    comment "*                                                    "
    comment "See the manual:                                      "
    comment "http://buildroot.org/downloads/manual/manaul.html#faq"
    comment "-no-binary-packages                                  "
    comment "-----------------------------------------------------"

This does fit on a 80-char wide terminal, and we get the complete URL on
two lines.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
