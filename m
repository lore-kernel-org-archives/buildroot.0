From: Geoff Levand <geoff@infradead.org>
Date: Wed, 02 Mar 2016 17:11:32 -0800
Subject: [Buildroot] [PATCH 4/4] Add package flannel
In-Reply-To: <20160302235302.198db5d7@free-electrons.com>
References: <cover.1456946494.git.geoff@infradead.org>
 <1572d192abce3a19798cdfe75f3aef8f9e3e504c.1456946494.git.geoff@infradead.org>
 <20160302235302.198db5d7@free-electrons.com>
Message-ID: <1456967492.13916.111.camel@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2016-03-02 at 23:53 +0100, Thomas Petazzoni wrote:
> The commit title should be:
> 
> 	flannel: new package
> 
> On Wed, 02 Mar 2016 19:23:33 +0000, Geoff Levand wrote:
> 
> > diff --git a/package/flannel/flannel.hash
> > b/package/flannel/flannel.hash
> > new file mode 100644
> > index 0000000..7459298
> > --- /dev/null
> > +++ b/package/flannel/flannel.hash
> > @@ -0,0 +1,3 @@
> > +# Locally computed:
> > +sha256
> > c09a76e80647282687b8db36f28dd3aede650f8f71dad0cf9f453f2ae3a0635d
> > flannel-v0.5.5.tar.gz
> > +
> 
> Unneeded empty new line.

OK.

> 
> > +FLANNEL_VERSION = v0.5.5
> > +FLANNEL_SITE = https://github.com/coreos/flannel.git
> > +FLANNEL_SITE_METHOD = git
> 
> Please use the github helper function.

OK.

> 
> > +
> > +FLANNEL_LICENSE = Apache-2.0
> > +FLANNEL_LICENSE_FILES = LICENSE
> > +
> > +FLANNEL_DEPENDENCIES = host-go
> > +
> > +FLANNEL_MAKE_ENV = \
> > +	GOBIN="$(@D)/bin" \
> > +	GOPATH="$(@D)/gopath" \
> > +	GOARCH=$(GO_GOARCH) \
> > +	CGO_ENABLED=1
> > +
> > +define FLANNEL_CONFIGURE_CMDS
> > +	mkdir -p $(@D)/gopath/src/github.com/coreos
> > +	ln -s $(@D) $(@D)/gopath/src/github.com/coreos/flannel
> 
> This probably warrants a comment above to explain why this is needed.

OK.
