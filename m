From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Aug 2018 14:43:12 +0200
Subject: [Buildroot] [PATCH 8/8] package/mender: set version in go linker
In-Reply-To: <CADHdJwBGQKrWPiLOio9oz5k-xrL-+CUNo+WAJf-Q6vUbOdiU7g@mail.gmail.com>
References: <20180814231337.19114-1-mirza.krak@northern.tech>
 <20180814231337.19114-9-mirza.krak@northern.tech>
 <20180815135818.121312d5@windsurf>
 <CADHdJwBGQKrWPiLOio9oz5k-xrL-+CUNo+WAJf-Q6vUbOdiU7g@mail.gmail.com>
Message-ID: <20180815144312.09b9ff96@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Aug 2018 14:32:23 +0200, Mirza Krak wrote:

> I would not know the answer to this as my experience is somewhat
> limited when it comes to golang. But if we take a look at
> docker-containerd.mk, it does this:
> 
>     DOCKER_CONTAINERD_LDFLAGS = \
>                   -X
> github.com/docker/containerd.GitCommit=$(DOCKER_CONTAINERD_VERSION)
> 
> Maybe above an argument against putting it in pkg-golank.mk?

Indeed, every package seems to use its own custom property, so your
patch looks good. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
