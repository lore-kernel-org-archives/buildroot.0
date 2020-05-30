From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 May 2020 23:08:31 +0200
Subject: [Buildroot] [PATCH] suport/download: fix git wrapper with
 submodules on older git versions
In-Reply-To: <20200529234149.7437a5b4@windsurf.home>
References: <20200524114718.21707-1-yann.morin.1998@free.fr>
 <20200529234149.7437a5b4@windsurf.home>
Message-ID: <20200530210831.GU8737@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-05-29 23:41 +0200, Thomas Petazzoni spake thusly:
> On Sun, 24 May 2020 13:47:18 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > +    # Older versions of git will store the absolute path of the git tree
> > +    # in the .git of submodules, while newer versions just use relative
> > +    # paths. Detect and fix the older variants to use relative paths, so
> > +    # that the archives are reproducible across a wider range of git
> > +    # versions. However, we can't do that if git is too old and uses
> > +    # full repositories for submodules.
> 
> If I understand correctly, there are three "eras":
> 
>  - Really old Git versions, where full repositories are used for
>    submodules, where we can't do anything.
> 
>  - Old Git versions, that stored absolute paths.
> 
>  - Recent Git versions, that store relative paths.

Spot-on.

> Would it be possible to identify which versions we're talking about
> here? I'm sure you've done that research, and I think it makes sense to
> capture that, as we will certainly wonder what we mean by "older
> versions", "old version", "new version.
> 
> What is new, old, or older today, will feel quite different 5 years
> from now.

Sorry, you presumed too much: I haven't dug the nitty-gritty details on
when git transitioned from one area to another...

I just stumbled on this issue while working on the conversion of the
archives generated from a git tree, which got me scratch my head for
quite some time... I should have noted the conditions back then, true,
but I forgot...

Regards,
Yann E. MORIN.

> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
