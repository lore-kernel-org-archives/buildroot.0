From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 19 May 2019 23:42:34 +0200
Subject: [Buildroot] [PATCH v1 1/5] board/armadeus: replace utf-8
 graphic sympols by ascii characters
In-Reply-To: <20190519090853.GA4569@scaer>
References: <20190508172822.7929-1-ps.report@gmx.net>
 <20190518233634.432e4b00@windsurf> <20190519090853.GA4569@scaer>
Message-ID: <20190519234234.38c84790@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann, and *,

On Sun, 19 May 2019 11:08:53 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Peter, Thomas, Peter, All,
> 
> On 2019-05-18 23:36 +0200, Thomas Petazzoni spake thusly:
> > On Wed,  8 May 2019 19:28:18 +0200
> > Peter Seiderer <ps.report@gmx.net> wrote:
> >   
> > > Signed-off-by: Peter Seiderer <ps.report@gmx.net>--cc "Ricardo Martincoski <ricardo.martincoski@gmail.com>"
> > > ---
> > >  board/armadeus/readme.txt | 10 +++++-----
> > >  1 file changed, 5 insertions(+), 5 deletions(-)  
> > 
> > Series applied to master. Thanks!  
> 
> Sorry, but I still fail to see why we want to remove non-ascii chars,
> especially in docs and the likes. The commit logs for these patches fail
> to explain the problem they fix, if there is even a problem.

Valid point, maybe for the board patches a commit tile a la 'harmonize graphic
symbol usage' would have been better...

> 
> This whole "no UTF-8 chars patches" are totally nonsense nowadays. If
> your system still can't display them properly, upgrade and get a decent
> font.
> 
> Now, if I need to add a comment like:
> 
>     # As explained by Fr?d?ric in [0], blurb da dee woops blabla...
> 
> then, check-package whines. While "Fr?d?ric" can be easily asciified to
> Frederic, this is not nice and there are a lot of names that can't be
> easily asciified, like ??? or anyone whose language is not using a
> latin script.
> 
> I agree that the unicode NO-BREAK-SPACE (U+00A0, UTF-8 C2A0) is nasty,
> and should be replaced, but otherwise it feels like we're going
> something like 30 years back in time...

Yes, Fr?d?ric will surly by honoured to be called by his real name ;-),
but all package patches touched easily replaceable UTF-8 characters
and did not change, by intent, the ones mentioned by Peter Korsgaard
(see [1]) and Arnout Vandecappelle mentioned the From/Sob tags
problem (see [2])...

> 
> BTW, a good editor can be made to report such "trolling" chars. For
> example, there is a plugin for vim that can highlight such chars, like
> NO-BREAK-SPACE "?" (U+00A0) which is highlighted red for me here:
>     https://github.com/vim-utils/vim-troll-stopper
> And for emacs (untested, I don't use emacs):
>     https://www.emacswiki.org/emacs/highlight-chars.el

It is simpler to check for not utf-8 instead of an blacklist of
various characters (no-break-space, multiple quote/hyphen signs, etc.),
maybe the warning can be downgraded to a minor one (plus a hint 'do
not apply to names')...

Regards,
Peter

[1] http://lists.busybox.net/pipermail/buildroot/2019-May/249725.html
[2] http://lists.busybox.net/pipermail/buildroot/2019-May/249716.html

> 
> Regards,
> Yann E. MORIN.
> 
> PS. Yes, I was the first one to report and fix U+00A0 (C2 A0) in
>     5d436ac5a6 and 911ac036e0, but those were fixing real problems.
> YEM.
> 
