From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Mar 2015 19:31:16 +0100
Subject: [Buildroot] [PATCH 1/5] kconfig-package: add support for config
 fragments
In-Reply-To: <495352807.1720289.1427098157544.JavaMail.root@openwide.fr>
References: <550D86D4.7060808@mind.be>
 <495352807.1720289.1427098157544.JavaMail.root@openwide.fr>
Message-ID: <20150323183116.GA4214@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?my, All,

On 2015-03-23 09:09 +0100, Jeremy Rosen spake thusly:
> ----- Mail original -----
> > On 21/03/15 00:11, Yann E. MORIN wrote:
> > > Floris, All,
> > > 
> [...]
> > > use a shell construct here, like:
> > > 
> > >     $$(if $$($(2)_KCONFIG_FRAGMENT_FILES), \
> > >         echo "Unable to perform $(1)-update-config when fragment
> > >         files are set"; exit 1)
> > 
> >  Or perhaps it's better to simply disable the update targets when
> >  fragments are set:
> > 
> > # Cannot update (def)config with fragments
> > ifneq ($$($(2)_KCONFIG_FRAGMENT_FILES),)
> > $(1)-update-config: ...
> > ...
> > endif
> > 
> > [snip]
> 
> I'm not sure... we are in a case where the user knows that the target
> is supposed to exist. an unknown target message would be more
> confusing than the OP's proposed error message. I would not be 
> suprised if someone reported the missing target as a bug here...

Agred, But I guess that what Arnout suggested would be something like:

    $(1)-update-config:
    ifneq ($$($(2)_KCONFIG_FRAGMENT_FILES),)
        ...
    else
        echo ERROR.
    enfi

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
