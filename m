From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 16 Oct 2012 21:24:22 +0200
Subject: [Buildroot] [git commit] package: add gnupg
In-Reply-To: <507DB21F.1090506@mind.be>
References: <20121015082204.6813A99871@busybox.osuosl.org>
 <87ipaatf0w.fsf@macbook.be.48ers.dk> <507DB21F.1090506@mind.be>
Message-ID: <201210162124.23004.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Peter, Arnout, All,

On Tuesday 16 October 2012 Arnout Vandecappelle wrote:
> On 16/10/12 21:04, Peter Korsgaard wrote:
> >>>>>> "Thomas" == Thomas Petazzoni<thomas.petazzoni@free-electrons.com>  writes:
> >
> >   >>  3 files changed, 84 insertions(+), 0 deletions(-)
> >
> >   Thomas>  This is causing the following build breakage on various platforms:
> >
> >   Thomas>    http://autobuild.buildroot.org/results/07f97705dda6dfbeab8ce95d6cef5b016329c9ce/build-end.log
> >
> > Yes - I noticed as well, just haven't found time to look closely at it
> > yet. The mpi stuff has cpu specific backends, so that's probably where
> > it goes wrong.
> 
>   I think this is the reason why gnupg wasn't included before.  My colleague
> Stijn submitted a patch series for a more recent version of gnupg a while ago,
> and that also faced a portability problem (in the 'portable threads library :-)
> Thomas suggested to wait for npth-based gnupg 2.1, but that one hasn't been
> released yet.

Hmm. Better I put this on the list than on the IRC chan:

From:
    http://lists.gnupg.org/pipermail/gnupg-users/2004-May.txt
(search for message-id: 40ABA383.5060209 at sbcglobal.net)

Sounds like a workaround/solution is to run ./configure --disable-asm

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
