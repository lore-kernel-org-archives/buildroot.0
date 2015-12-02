From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 2 Dec 2015 10:34:58 +0000
Subject: [Buildroot] [PATCH] util-linux: fix static builds with uClibc
In-Reply-To: <1448573664-5556-1-git-send-email-abrodkin@synopsys.com>
References: <1448573664-5556-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <1449052498.5991.2.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, 2015-11-27 at 00:34 +0300, Alexey Brodkin wrote:
> What happens util-linux on configuration step tries to build
> and example that uses timer_create() function. That function
> exists in librt and configuration utility correctly adds this
> lib (-lrt).
> 
> But timer_create() uses pthreads internally and so for successful
> linkage "-lpthread" is required as well (in addition to "-lrt").
> 
> 0005-build-sys-use-REALTIME_LIBS.patch is a back-port of upstream
> commit
> https://github.com/karelzak/util-linux/commit/b97edfe731fdf3d3e92e40494b22658207ab6d3c
> that won't apply cleanly on v2.27.1
> 
> 0006-buildsys-fix-static-configuration-and-building.patch was just
> sent upstream, see https://github.com/karelzak/util-linux/pull/234
> 
> Both patches must be removed on util-linux version bump.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Just a polite reminder.

This patch fixes http://autobuild.buildroot.net/results/d0c/d0cf4832d76e76a01e7db620014bcbbd5d46118f/

-Alexey
