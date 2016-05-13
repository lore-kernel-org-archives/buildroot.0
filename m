From: Geoff Levand <geoff@infradead.org>
Date: Fri, 13 May 2016 11:40:50 -0700
Subject: [Buildroot] [PATCH 2/9] package/go-bootstrap: Set CGO_ENABLED=0
In-Reply-To: <87twi1hofs.fsf@dell.be.48ers.dk>
References: <cover.1463010771.git.geoff@infradead.org>
 <2e8ab7d6d36bdc954535b9637f9ab8e131d64313.1463010771.git.geoff@infradead.org>
 <87y47egohi.fsf@dell.be.48ers.dk> <1463155543.23824.44.camel@infradead.org>
 <87twi1hofs.fsf@dell.be.48ers.dk>
Message-ID: <1463164850.23824.56.camel@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2016-05-13 at 19:12 +0200, Peter Korsgaard wrote:
> > > > >  > This change disables cgo support for the bootstrap compiler.  It is not
>  > needed.  The bootstrap compiler is just used to build the final go
>  > compiler.  We need full cgo support in the final go compiler to support
>  > any go programs that may need cgo support.
> 
>  > I hope this makes more sense.
> 
> Ok, thanks - But why did you then add toolchain to
> HOST_GO_BOOTSTRAP_DEPENDENCIES and not to HOST_GO_DEPENDENCIES with the
> comment that it was about cgo?

Yes, we could do it that way.  I'll update the patch.

-Geoff
