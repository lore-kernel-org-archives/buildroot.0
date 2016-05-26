From: Geoff Levand <geoff@infradead.org>
Date: Thu, 26 May 2016 12:51:49 -0700
Subject: [Buildroot] [PATCH v3 1/3] runc: new package
In-Reply-To: <20160526211207.06e27be6@free-electrons.com>
References: <1464219082-3818-1-git-send-email-christian@paral.in>
 <1464219082-3818-2-git-send-email-christian@paral.in>
 <20160526211207.06e27be6@free-electrons.com>
Message-ID: <1464292309.2374.38.camel@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, 2016-05-26 at 21:12 +0200, Thomas Petazzoni wrote:
> On Wed, 25 May 2016 16:31:20 -0700, Christian Stewart wrote:
> +define RUNC_CONFIGURE_CMDS
> > +> > 	> > # Put sources at prescribed GOPATH location.
> > +> > 	> > export $(RUNC_MAKE_ENV) && \
> 
> What is the export doing here?
> 
> > +> > 	> > 	> > mkdir -p $$GOPATH/src/github.com/opencontainers && \
> > +> > 	> > 	> > ln -s $(@D) $$GOPATH/src/github.com/opencontainers/runc
> 
> There is no need for a && between those lines.
> 
> And why is this needed at all? What is this "prescribed GOPATH" thing ?

Go expects the developer to have a 'workspace' with a
prescribed directory layout.  Many projects archive their
sources with a truncated path, so when they are extracted
to a directory (@D in buildroot's case) things need to be
fix enough for the go compiler to work.  This is a common
situation, and these fixups are often seen in project
build scripts.

See https://golang.org/doc/code.html#Workspaces

-Geoff
