From: Christian Stewart <christian@paral.in>
Date: Fri, 08 Jul 2016 19:32:41 +0000
Subject: [Buildroot] [PATCH 2/3] package/runc: fix shared only build
 when libseccomp is enabled.
In-Reply-To: <20160708212753.55d3c2ae@free-electrons.com>
References: <1467916777-29220-1-git-send-email-romain.naour@gmail.com>
 <1467916777-29220-2-git-send-email-romain.naour@gmail.com>
 <20160708212753.55d3c2ae@free-electrons.com>
Message-ID: <1468006361981-b8d5773f-c47578b5-9b1f9581@mixmax.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, Jul 8, 2016 at 12:27 PM Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote: > That's interesting, I thought Go was making static linking *mandatory*.
> If that's not the case, then I would indeed prefer if we handled this
> like all other packages: static linking only when BR2_STATIC_LIBS.
> However, this should be done consistently for all packages: flannel and
docker-containerd also pass -extldflags '-static' unconditionally.
> Geoff, Christian, do you see a problem with Romain's proposal?
In my latest revision of docker-engine I removed the -static flag for CGO
because btrfs would not link for the same reason.
I think it's fine to remove the ?-static? extldflag on everything for Go. I have
had no trouble doing so with docker-engine and I don't see why there would be a
problem with the other packages.
We want to statically link the Go code to other go code, yes, but linking the Go
code to C libraries should be fine dynamically.
Best, Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160708/d4aec296/attachment.html>
