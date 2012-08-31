From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 Sep 2012 00:13:21 +0200
Subject: [Buildroot] libffi or the crazy world of toolchain options
In-Reply-To: <504075B0.3060201@mind.be>
References: <1345907166-29628-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <201208310035.37641.yann.morin.1998@free.fr> <504075B0.3060201@mind.be>
Message-ID: <201209010013.21710.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Thomas, All,

On Friday 31 August 2012 10:28:32 Arnout Vandecappelle wrote:
>   Ah yes, forgot to mention that: I don't think it makes sense to split the patch
> into smaller patches per 32 packages.  It's still the complete patch that needs
> to be reviewed.

Well, it's at least easier for me to check that my^Wour script does not
act too sutpid! ;-)

Nothing prevents us from squashing all related cset together before
submission for upstreaming.

>   It _does_ make a lot of sense to split it per pass.

That's for sure, yes.

>   My point is: after this change (the introduction of the _AVAILABLE symbol
> is still brilliant!) the libffi patch would just be roughly 15 lines.  You would have
> to introduce the _AVAILABLE symbol for libffi, and add it to the two packages
> that depend on libffi: libglib2 and python. Since both of them already have an
> _AVAILABLE symbol, the recursion stops there.

OK, I missunderstood your original mail. Ack.

>   The reason is that the tricky packages (libglib2, python, x11r7, efl) already have
> a toolchain dependency, so they will have an _AVAILABLE symbol.

Now I understand that you speak about _after_ the introduction of _AVAILABLE.
Pfeew... Takes time to get into my little head! ;-)

> > Does acl really require LARGEFILE for itself, or because it requires attr
> > which itself requires LARGEFILE?
>   There you can't say off-hand, so either you check it manually or leave the redundant
> dependency.

Better safe than sorry: I'd leave it. Any one adventurous enough could
test later.

> However, in the cases where there is a comment, it can be removed.

Yep.

>   As I said, because there are only 85 of the easy ones, and replacing manually
> is easy, I'd do it manually.

Gah. Any repetitive task of which there are more than a few instances, I
tend to automate. At least, for two reasons:
  - there is a script that gets committed with the change, so we can later
    see what was done, and can reproduce again later should a similar case
    appears again,
  - I really abhor repetitive tasks, and I realy like automating stuff! ;-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
