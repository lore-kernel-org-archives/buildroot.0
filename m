From: Cam Hutchison <camh@xdna.net>
Date: Sat, 13 Apr 2019 07:45:21 +1000
Subject: [Buildroot] [PATCH 1/1] pkg-golang: Allow per package/target
 CGO_ENABLED setting
In-Reply-To: <20190407222812.570c91f7@windsurf>
References: <20180727024720.13370-1-camh@xdna.net>
 <20190407222812.570c91f7@windsurf>
Message-ID: <CABa6e=rhu4hB2w4XK1uC8eZ=jcdVysYHqQ_h3vV76kz9toAY5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 8 Apr 2019 at 06:28, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello Cam,
>
> +Christian and Anisse in Cc.
>
> Sorry for the very slow feedback.
>
> On Fri, 27 Jul 2018 12:47:20 +1000
> Cam Hutchison <camh@xdna.net> wrote:
>
> > Allow the CGO_ENABLED variable to be controlled per package and per
> > build target, instead of having the value determined by whether or not
> > the toolchain has threads.
> >
> > Some build targets may not build with CGO_ENABLED=1, so allowing a per
> > package and build target override will allow those targets to be built
> > with Buildroot.
>
> Could you give some specific examples instead of the fuzzy "Some build
> targets" wording ?
>

Sorry for my lack of detail. Here are my notes that I made at the time:

* kube-apiserver is not linking, emitting the error `direct call too far`.
If I
  override the go.mk to force CGO_ENABLED=0, it works. The kube build script
  builds a bunch of components with CGO_ENABLED=0, but the buildroot golang
  infra does not support setting CGO_ENABLED - it is hard-coded based on
  whether the toolchain has threads (BR2_TOOLCHAIN_HAS_THREADS). I will need
  to somehow override that.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190413/dffbe778/attachment.html>
