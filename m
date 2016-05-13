From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 May 2016 19:12:39 +0200
Subject: [Buildroot] [PATCH 2/9] package/go-bootstrap: Set CGO_ENABLED=0
In-Reply-To: <1463155543.23824.44.camel@infradead.org> (Geoff Levand's message
 of "Fri, 13 May 2016 09:05:43 -0700")
References: <cover.1463010771.git.geoff@infradead.org>
 <2e8ab7d6d36bdc954535b9637f9ab8e131d64313.1463010771.git.geoff@infradead.org>
 <87y47egohi.fsf@dell.be.48ers.dk>
 <1463155543.23824.44.camel@infradead.org>
Message-ID: <87twi1hofs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Geoff" == Geoff Levand <geoff@infradead.org> writes:

Hi,

 >> So it sounds like this change disables the cgo tool. How does that
 >> match
 >> with your other change to pull in the toolchain dependencies which
 >> was
 >> "To build programs that need cgo support"?

 > This change disables cgo support for the bootstrap compiler.  It is not
 > needed.  The bootstrap compiler is just used to build the final go
 > compiler.  We need full cgo support in the final go compiler to support
 > any go programs that may need cgo support.

 > I hope this makes more sense.

Ok, thanks - But why did you then add toolchain to
HOST_GO_BOOTSTRAP_DEPENDENCIES and not to HOST_GO_DEPENDENCIES with the
comment that it was about cgo?

-- 
Venlig hilsen,
Peter Korsgaard 
