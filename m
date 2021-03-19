From: Markus Mayer <mmayer@broadcom.com>
Date: Fri, 19 Mar 2021 11:24:17 -0700
Subject: [Buildroot] [PATCH 2/2] support/download: print command used
 for download
In-Reply-To: <20210319061948.GM3443324@scaer>
References: <20210115150047.6895-1-patrickdepinguin@gmail.com>
 <20210115150047.6895-2-patrickdepinguin@gmail.com>
 <20210316222938.GI3443324@scaer> <20210318210133.GK3443324@scaer>
 <CAAXf6LUom6Q6wvzDvxr4RDdzMoBY5kcmq4TbWiy=xWq1JibBaw@mail.gmail.com>
 <20210319061948.GM3443324@scaer>
Message-ID: <CAGt4E5vmZqP4RtcxLptbu3Vd5Z04CCqumJYv+-SVQwQPxrwRjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 18 Mar 2021 at 23:20, Yann E. MORIN <yann.morin.1998@free.fr> wrote:

> > > Note that this breaks the git downloads, as reported by Matthias:
> > >     https://bugs.busybox.net/show_bug.cgi?id=13631

FWIW, we've been bitten by this, too. Not our main branch, mind you.
But on the "let's build the latest upstream branch and see if there
are any surprises coming down the pipe" branch. And it sure found a
little surprise for us.

Nightly builds suddenly started failing on March 17, with complaints
about repeated instances of a "corrupted git cache" (of course, it was
drawing the wrong conclusion when the git wrapper failed; there was no
corrupted cache, but the date was of an incorrect format thanks to the
printf).

It took me some time to figure out what had suddenly happened.
Searching the mailing list didn't help, because I didn't know what to
look for. Of course, once I knew, I quickly found this thread.

> Now the quesiton: do we want to apply this to all helpers, so that they
> are homogeneous, or do we do that only for git and svn?
>
> My gut feeling is that we should do it for all, because it is relatively
> trivial to do, and then we have all backends using the same constructs,
> so they are easier to reason about.

My vote would be to keep them homogeneous, too. It'll also provide a
facility that can be used in the future if anybody needs to add a
feature to the other downloaders that would otherwise cause similar
problems there.

Thanks for looking into this so quickly.

Regards,
-Markus
