From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Thu, 7 Nov 2019 22:47:21 +0100
Subject: [Buildroot] [PATCH 1/1] Include makefiles from GLOBAL_PATCH_DIR
In-Reply-To: <20191107181513.GD3419@scaer>
References: <20191026145151.17749-1-jeremy.rosen@smile.fr>
 <20191106163748.GA3419@scaer>
 <20191106233100.3b66c426@windsurf> <20191107180958.GC3419@scaer>
 <20191107181513.GD3419@scaer>
Message-ID: <CAFvCimVFcWsesG-8w4MDQ=SsuxpEH04UE8xN75bWt0SC67EqSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes I was about to post that

for units that have both a target and a host  mode, the .mk is included
twice.

This is rather easy to fix (probably just  add a flag to avoid double
include) but since the patch is still being discussed on a philosophical
ground, I'll wait before submitting a V2

Le jeu. 7 nov. 2019 ? 19:15, Yann E. MORIN <yann.morin.1998@free.fr> a
?crit :

> All,
>
> On 2019-11-07 19:09 +0100, Yann E. MORIN spake thusly:
> > On 2019-11-06 23:31 +0100, Thomas Petazzoni spake thusly:
> > > On Wed, 6 Nov 2019 17:37:48 +0100
> > > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > [--SNIP--]
> > > > So, I am afraid that these overrides are a poor excuse for not
> wanting to
> > > > do actual VCS work.
> > > Well, you are the one who introduced BR2_EXTERNAL in the first place!
> >
> > Ahem... git show a4239f7fd10 ;-)
> >
> > I did introduce support for multi br2-external, though.
> >
> > Anyway, this patch, as on IRC by J?r?my, has a designe flaw: since the
>
> *as discussed on IRC with ... a design flaw...
>
> > override files are included too early, they hcamge the way pkgdir is
>
> * change
>
> > computed, and this breaks completely.
> >
> > This can be corrected, though, and it might even not be too complex to
> > do.
> >
> > But if we're going to do the override stuff, I think we must think it
> > thouroughly, and not use an half-baked solution.
> >
> > If at all, I'd favour looking at the aternate solution that was floated
> > around during the last devdays: postpone evaluation of the infras to
> > after all the packages hav actually been scanned. This would even allow
> > overriding the type of a package (e.g. autotools-package instead of
> > meson-package, in case the version was changed to use another
> > buildsystem).
>
> ... and thus we could drop the check that a package is not redefined,
> and so a package could be redefined in a br2-external tree, and that
> would not need any new override mechanism at all, presumably.
>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>


-- 
[image: SMILE]  <http://www.smile.eu/>

20 rue des Jardins
92600 Asni?res-sur-Seine
*J?r?my ROSEN*
Architecte technique

[image: email] jeremy.rosen at smile.fr
[image: phone]  +33 6 88 25 87 42
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
<https://www.facebook.com/smileopensource> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>

[image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
<https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191107/804b85af/attachment.html>
