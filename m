From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 May 2019 11:08:53 +0200
Subject: [Buildroot] [PATCH v1 1/5] board/armadeus: replace utf-8
 graphic sympols by ascii characters
In-Reply-To: <20190518233634.432e4b00@windsurf>
References: <20190508172822.7929-1-ps.report@gmx.net>
 <20190518233634.432e4b00@windsurf>
Message-ID: <20190519090853.GA4569@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Thomas, Peter, All,

On 2019-05-18 23:36 +0200, Thomas Petazzoni spake thusly:
> On Wed,  8 May 2019 19:28:18 +0200
> Peter Seiderer <ps.report@gmx.net> wrote:
> 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  board/armadeus/readme.txt | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> Series applied to master. Thanks!

Sorry, but I still fail to see why we want to remove non-ascii chars,
especially in docs and the likes. The commit logs for these patches fail
to explain the problem they fix, if there is even a problem.

This whole "no UTF-8 chars patches" are totally nonsense nowadays. If
your system still can't display them properly, upgrade and get a decent
font.

Now, if I need to add a comment like:

    # As explained by Fr?d?ric in [0], blurb da dee woops blabla...

then, check-package whines. While "Fr?d?ric" can be easily asciified to
Frederic, this is not nice and there are a lot of names that can't be
easily asciified, like ??? or anyone whose language is not using a
latin script.

I agree that the unicode NO-BREAK-SPACE (U+00A0, UTF-8 C2A0) is nasty,
and should be replaced, but otherwise it feels like we're going
something like 30 years back in time...

BTW, a good editor can be made to report such "trolling" chars. For
example, there is a plugin for vim that can highlight such chars, like
NO-BREAK-SPACE "?" (U+00A0) which is highlighted red for me here:
    https://github.com/vim-utils/vim-troll-stopper
And for emacs (untested, I don't use emacs):
    https://www.emacswiki.org/emacs/highlight-chars.el

Regards,
Yann E. MORIN.

PS. Yes, I was the first one to report and fix U+00A0 (C2 A0) in
    5d436ac5a6 and 911ac036e0, but those were fixing real problems.
YEM.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
