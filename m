From: Geoff Levand <geoff@infradead.org>
Date: Tue, 10 May 2016 10:37:31 -0700
Subject: [Buildroot] [PATCH 1/1] package/go: bump version to 1.6.2
In-Reply-To: <20160508145944.09f42d02@free-electrons.com>
References: <1462551812-8952-1-git-send-email-christian@paral.in>
 <20160507144313.4e7112af@free-electrons.com>
 <20160507184514.GA2419@tarshish>
 <20160507214016.5592aea2@free-electrons.com>
 <CABa6e=og-BDA_VY=wJ17uc9=-S0D34SEstRv1W_FyFVUU=ehcw@mail.gmail.com>
 <20160508143956.4b5a4db0@free-electrons.com>
 <CABa6e=oxJ48BAe9c9itArAB-7CLHw71gKjNiMO0s0jigqH2DvA@mail.gmail.com>
 <20160508145944.09f42d02@free-electrons.com>
Message-ID: <1462901851.27026.34.camel@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2016-05-08 at 14:59 +0200, Thomas Petazzoni wrote:
> Geoff, if that's OK for you, could you send a proper patch that does
> this?
> 
> diff --git a/package/go-bootstrap/go-bootstrap.mk b/package/go-bootstrap/go-bootstrap.mk
> index e404cb6..2b46694 100644
> --- a/package/go-bootstrap/go-bootstrap.mk
> +++ b/package/go-bootstrap/go-bootstrap.mk
> @@ -17,7 +17,8 @@ HOST_GO_BOOTSTRAP_MAKE_ENV = \
>         GOOS=linux \
>         GOROOT_FINAL="$(HOST_GO_BOOTSTRAP_ROOT)" \
>         GOROOT="$(@D)" \
> -       GOBIN="$(@D)/bin"
> +       GOBIN="$(@D)/bin" \
> +       CGO_ENABLED=0

We do not need cgo support in the bootstrap compiler, so this
should be the correct fix.  I'll test and send out a patch.

-Geoff
