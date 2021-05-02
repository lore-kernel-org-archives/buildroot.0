From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 2 May 2021 12:27:46 +0200
Subject: [Buildroot] [PATCH v1 1/3] package/libtomcrypt: add pkgconfig
 support
In-Reply-To: <45c379f0-8ca0-6891-1b1e-b166600da9ca@mind.be>
References: <20210412195527.9282-1-ps.report@gmx.net>
 <20210412221453.5195d4b5@windsurf.home>
 <20210412231516.6cbc09f2@gmx.net>
 <45c379f0-8ca0-6891-1b1e-b166600da9ca@mind.be>
Message-ID: <20210502122746.7988707d@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Sat, 1 May 2021 15:18:42 +0200, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 12/04/2021 23:15, Peter Seiderer wrote:
> > Hello Thomas,
> >
> > On Mon, 12 Apr 2021 22:14:53 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> >
> >> On Mon, 12 Apr 2021 21:55:25 +0200
> >> Peter Seiderer <ps.report@gmx.net> wrote:
> >>
> >>> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> >>
> >> Is there any specific motivation? Does this had a chance of going
> >> upstream ?
> >
> > For an custom project, previously developed on with cmake on ubuntu (which
> > provides the pkgconfig file)....
> >
> > Can try to suggest upstream...
>
>  Adding a .pc file in Buildroot usually doesn't make much sense, because no
> package that depends on it is going to use it. So yes, please organise this
> upstream.

But a buildroot provided library should be usable for buildroot packages AND
out-of-tree/custom packages?

Nevertheless, did take a second look at the libtomcrypt sources, already
providing a libtomcrypt.pc.in template (but only used/installed in case
of 'makefile.shared'/'makefile.unix' and the buildroot compile uses the
default 'makefile' one)...

Regards,
Peter

>
>  Therefore, I've marked this patch as Rejected.
>
>  Regards,
>  Arnout
