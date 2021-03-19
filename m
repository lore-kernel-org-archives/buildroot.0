From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Mar 2021 21:42:18 +0100
Subject: [Buildroot] [PATCH 2/2] support/download: print command used
 for download
In-Reply-To: <CAGt4E5vmZqP4RtcxLptbu3Vd5Z04CCqumJYv+-SVQwQPxrwRjA@mail.gmail.com>
References: <20210115150047.6895-1-patrickdepinguin@gmail.com>
 <20210115150047.6895-2-patrickdepinguin@gmail.com>
 <20210316222938.GI3443324@scaer> <20210318210133.GK3443324@scaer>
 <CAAXf6LUom6Q6wvzDvxr4RDdzMoBY5kcmq4TbWiy=xWq1JibBaw@mail.gmail.com>
 <20210319061948.GM3443324@scaer>
 <CAGt4E5vmZqP4RtcxLptbu3Vd5Z04CCqumJYv+-SVQwQPxrwRjA@mail.gmail.com>
Message-ID: <20210319204218.GQ3443324@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus, All,

On 2021-03-19 11:24 -0700, Markus Mayer spake thusly:
> On Thu, 18 Mar 2021 at 23:20, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > > Note that this breaks the git downloads, as reported by Matthias:
> > > >     https://bugs.busybox.net/show_bug.cgi?id=13631
> FWIW, we've been bitten by this, too. Not our main branch, mind you.
> But on the "let's build the latest upstream branch and see if there
> are any surprises coming down the pipe" branch. And it sure found a
> little surprise for us.

Yeah, that was a serious issue, but we're still pretty early in the
development phase, so now is a good time to break things! ;-)

Hopefully that's been settled now, with commit b70ce56651, that's been
just merged. Feedback greatly appreciated if there's still feedback (or
not).

> > Now the quesiton: do we want to apply this to all helpers, so that they
> > are homogeneous, or do we do that only for git and svn?
> >
> > My gut feeling is that we should do it for all, because it is relatively
> > trivial to do, and then we have all backends using the same constructs,
> > so they are easier to reason about.
> 
> My vote would be to keep them homogeneous, too. It'll also provide a
> facility that can be used in the future if anybody needs to add a
> feature to the other downloaders that would otherwise cause similar
> problems there.

Thanks for the vote; that's what we've gone with.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
