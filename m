From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Nov 2017 17:41:05 +0100
Subject: [Buildroot] [PATCH] suport/download: force svn to be
 non-interactive
In-Reply-To: <20171105164001.GN2996@scaer>
References: <20171103212216.11772-1-yann.morin.1998@free.fr>
 <42ed0ef2-e62a-4c19-fd81-83b6a591fd32@dawncrow.de>
 <689f024f-c9e6-31c2-945f-ce06885a2804@mind.be>
 <20171105164001.GN2996@scaer>
Message-ID: <20171105164105.GO2996@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-11-05 17:40 +0100, Yann E. MORIN spake thusly:
> All,
> 
> On 2017-11-05 17:34 +0100, Arnout Vandecappelle spake thusly:
> > On 05-11-17 16:14, Andr? Hentschel wrote:
> > > Am 03.11.2017 um 22:22 schrieb Yann E. MORIN:
> > >> Fixes:
> > >>     http://autobuild.buildroot.org/results/2af/2af7412846c576089f8596857ab8c81ac31c1bed/
> > >>
> > >> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > >> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > >> Cc: Andr? Hentschel <nerv@dawncrow.de>
> > >> ---
> > >>  support/download/svn | 2 +-
> > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/support/download/svn b/support/download/svn
> > >> index 77abf3d02d..9f27d71f86 100755
> > >> --- a/support/download/svn
> > >> +++ b/support/download/svn
> > >> @@ -33,6 +33,6 @@ _svn() {
> > >>      eval ${SVN} "${@}"
> > >>  }
> > >>  
> > >> -_svn export ${verbose} "${@}" "'${repo}@${rev}'" "'${basename}'"
> > >> +_svn --non-interactive export ${verbose} "${@}" "'${repo}@${rev}'" "'${basename}'"
> > >>  
> > >>  tar czf "${output}" "${basename}"
> > >>
> > > 
> > > 
> > > Reviewed-by: Andr? Hentschel <nerv@dawncrow.de>
> > 
> >  Thanks! Sorry that Thomas, Yann and I gave you the same message three times.
> > Race conditions, difficult to avoid :-)
> 
> lock(buildroot.mailing_list)
> 
> Yeah I found it pretty funny in retrospect. A bit like the other
> discussion about BR2_REPRODUCIBLE where I basically repeated Thomas and
> Peter's words, when I should have just read the entire thread before
> replying.

Aha! got y'all stuck!

unlock(buildroot.mailing_list)

There, fixed. ;]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
