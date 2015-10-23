From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 23 Oct 2015 17:23:20 +0200
Subject: [Buildroot] [PATCH 20/21 v2] docs/manual: document the
 br2-external	ID
In-Reply-To: <172158512.1903398.1445586003422.JavaMail.zimbra@openwide.fr>
References: <cover.1445545973.git.yann.morin.1998@free.fr>
 <7fc654ad197b16c299c07a5d3507a009a3345349.1445545973.git.yann.morin.1998@free.fr>
 <172158512.1903398.1445586003422.JavaMail.zimbra@openwide.fr>
Message-ID: <20151023152320.GA3674@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jeremy, All,

On 2015-10-23 09:40 +0200, Jeremy Rosen spake thusly:
> > -+BR2_EXTERNAL+ allows three different things:
> > +A +BR2_EXTERNAL+ tree must contain at least those three files:
> > +
> > ++external.id+::
> > +   That file should contain the ID for the +BR2_EXTERNAL+ tree.
> > +   That ID is used to construct the +BR2_EXTERNAL_$(ID)+ variable,
> > +   available in +Config.in+ and +external.mk+ (see below), so that ID
> > +   must be a valid make and Kconfig variable. Buildroot sets
> > +   +BR2_EXTERNAL_$(ID)+ to the path of the +BR2_EXTERNAL+ tree.
> > ++
> > +Examples:
> > ++
> > +  ** +FOO+ -> +BR2_EXTERNAL_FOO+
> > +  ** +BAR_42+ -> +BR2_EXTERNAL_BAR_42+
> > +  ** ...
> > +
> 
> those are example of valid ID, but what is the exact syntax of the file ? 
> is it a single line with just the ID ? this is not ver clear here....

Good point. Indeed, the format of the file is to contain just the ID,
like so:

    $ cat external.id
    BAR_42

I'll update the description to make it obvious. Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
