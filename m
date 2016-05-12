From: Geoff Levand <geoff@infradead.org>
Date: Thu, 12 May 2016 09:53:32 -0700
Subject: [Buildroot] [PATCH 3/9] package/go-bootstrap: Set CC to host CC
In-Reply-To: <20160512152854.56c727f2@free-electrons.com>
References: <cover.1463010771.git.geoff@infradead.org>
 <14cc3c8334b20ed8b9f5510556a4b83dc4f85e55.1463010771.git.geoff@infradead.org>
 <20160512152854.56c727f2@free-electrons.com>
Message-ID: <1463072012.23824.3.camel@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2016-05-12 at 15:28 +0200, Thomas Petazzoni wrote:
> On Thu, 12 May 2016 00:08:46 +0000, Geoff Levand wrote:
> 
> > diff --git a/package/go-bootstrap/go-bootstrap.mk b/package/go
> > -bootstrap/go-bootstrap.mk
> > index 1ced355..5dc839a 100644
> > --- a/package/go-bootstrap/go-bootstrap.mk
> > +++ b/package/go-bootstrap/go-bootstrap.mk
> > @@ -20,6 +20,7 @@ HOST_GO_BOOTSTRAP_MAKE_ENV = \
> >  	GOROOT_FINAL="$(HOST_GO_BOOTSTRAP_ROOT)" \
> >  	GOROOT="$(@D)" \
> >  	GOBIN="$(@D)/bin" \
> > +	CC=$(HOSTCC_NOCCACHE) \
> 
> Why do you use HOSTCC_NOCCACHE instead of just HOSTCC ? Is the usage
> of
> ccache a problem?
> 

Yes, it is generally known that the go build system is not compatible
with the use of ccache.

  https://github.com/golang/go/issues/11685

-Geoff
