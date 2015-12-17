From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 22:54:08 +0100
Subject: [Buildroot] [PATCH] util-linux: fix static builds with uClibc
In-Reply-To: <1448573664-5556-1-git-send-email-abrodkin@synopsys.com>
References: <1448573664-5556-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20151217225408.2247b076@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Fri, 27 Nov 2015 00:34:24 +0300, Alexey Brodkin wrote:
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

You got some feedback from upstream on patch 0006, could you take it
into account and resend an updated patch?

They fixed the timer_createx problem spotted by Yann in
https://github.com/karelzak/util-linux/commit/f07a82c9d8141dd295c2453e3c5804f997ed7ce5.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
