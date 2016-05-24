From: Christian Stewart <christian@paral.in>
Date: Tue, 24 May 2016 20:12:58 +0000
Subject: [Buildroot] [PATCH v2 6/6] package/go: Set file timestamp
In-Reply-To: <20160524211354.20788c35@free-electrons.com>
References: <cover.1463696454.git.geoff@infradead.org>
 <ec83a5927025fc759d5bfc26ee01aabde3658a7c.1463696454.git.geoff@infradead.org>
 <20160524211354.20788c35@free-electrons.com>
Message-ID: <CA+h8R2piMsRfRF=hmhPczbkn6_8bwCxaTL0QfTCnc9FnYU4v_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Geoff,

Same question. I'm not sure if the timestamps are even considered by the
compiler. If so, do you have a reference to how this works?

Thanks,
Christian

On Tue, May 24, 2016, 12:13 PM Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Thu, 19 May 2016 22:25:02 +0000, Geoff Levand wrote:
> > Set all file timestamps to prevent the go compiler from rebuilding any
> > built in packages when programs are built.
> >
> > Signed-off-by: Geoff Levand <geoff@infradead.org>
> > ---
> >  package/go/go.mk | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/package/go/go.mk b/package/go/go.mk
> > index 8565a86..a2babab 100644
> > --- a/package/go/go.mk
> > +++ b/package/go/go.mk
> > @@ -119,6 +119,10 @@ define HOST_GO_INSTALL_CMDS
> >       # There is a known issue which requires the go sources to be
> installed
> >       # https://golang.org/issue/2775
> >       cp -a $(@D)/src $(HOST_GO_ROOT)/
> > +
> > +     # Set all file timestamps to prevent the go compiler from
> rebuilding any
> > +     # built in packages when programs are built.
> > +     find $(HOST_GO_ROOT) -type f -exec touch -r $(HOST_GO_TMP)/bin/go
> {} \;
> >  endef
>
> That's weird, why is it needed? Why are timestamps wrong in the first
> place?
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160524/dbcac3da/attachment.html>
