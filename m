From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 6 Nov 2018 22:10:08 +0100
Subject: [Buildroot] Out of tree Linux kernel builds?
In-Reply-To: <20181106084534.08bc72ca@windsurf>
References: <02530ea6-3942-3fe1-91b8-9040e3838972@gmail.com>
 <20181106084534.08bc72ca@windsurf>
Message-ID: <20181106211008.GE24754@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Florian, All,

On 2018-11-06 08:45 +0100, Thomas Petazzoni spake thusly:
> On Mon, 5 Nov 2018 16:08:05 -0800, Florian Fainelli wrote:
> > AFAIR a while back you mentioned that you were looking into adding
> > support for out of tree Linux builds. Do you have working patches for
> > that, or you would rather have someone take a stab at doing it?
> 
> In fact we are not planning on supporting out of tree kernel builds,
> but rather to support out of tree build for all packages in a generic
> way, which would include the 'linux' package of course.
> 
> I did some work in this area many years ago, Yann picked up some of the
> work, see the current status at
> https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/oot.
> 
> I see he has other "oot" branches, such as
> https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/oot-build-dir,
> https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/oot-libtool
> and
> https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/oot-same-source.
> I'm not sure how they relate to each other (I haven't looked at the
> patches).

The branch are organised as such (+n patches on top of the parent
branch):

    master
        yem/oot-same-source (+5)
            yem/oot-libtool (+3)
                yem/oot-build-dir (+3)
                    yem/oot (+15)

Which means that yem/oot would bring all of the others.

The idea being to split the big series that originated with Thomas, into
more manageable chunks. Then rebase on master and adapt to the new state
of the tree.

Needless to say that it is not a trivial task! ;-) I even probably took
the not-so-trivial ones first. :-/  But basically, I think some branches
can be swapped without too much trouble.

I've put that in limbo for a moment, but I'm planning to work on it back
soon (winter means I no longer need to go outside take care of the
garden as much as I need to in summer. Wee! ;-] ).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
