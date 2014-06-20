From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Jun 2014 22:14:11 +0200
Subject: [Buildroot] [PATCH] graph-depends: fix when $(O) is a relative
 path
In-Reply-To: <53A49472.4050109@mind.be>
References: <1403129424-27129-1-git-send-email-arnout@mind.be>
 <20140620200457.GA3543@free.fr> <53A49472.4050109@mind.be>
Message-ID: <20140620201411.GE3543@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-06-20 22:07 +0200, Arnout Vandecappelle spake thusly:
> On 20/06/14 22:04, Yann E. MORIN wrote:
> > Arnout, All,
> > 
> > On 2014-06-19 00:10 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> >> The graph-depends commands cd into the CONFIG_DIR and run the script
> >> from there. However, this means that when $(O) is a relative path, it
> >> will no longer be correct.  Therefore, use $(BASE_DIR) instead of $(O).
> >>
> >> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> > 
> > Tested with this sequence:
> >     cd buildroot
> >     make manual-html
> >     make O=../br.build-1 manual-html
> >     cd ..
> >     make -C buildroot O=../br.build-2 manual-html
> >     make -C buildroot O=$(pwd)/br.build-3
> >     mkdir br.build-4
> >     cd br.build-4
> >     make defconfig   (to create the Makefile wrapper)
> >     make manual-html
> 
>  Call me stupid, but why is it relevant to test this patch with manual-html?

Err... Hmm... Well...

OK, back to the shell I am... ;-)

Sorry, sorry, sorry...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
