From: Trent Piepho <tpiepho@impinj.com>
Date: Mon, 21 May 2018 21:34:41 +0000
Subject: [Buildroot] [PATCH] util-linux: Bump to version 2.32
In-Reply-To: <20180521191623.7049-1-tpiepho@impinj.com>
References: <20180521191623.7049-1-tpiepho@impinj.com>
Message-ID: <1526938480.31570.89.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nevermind, I see I missed this change already being on buildroot/next.

If anyone wonders why mke2fs blocks for 2 seconds getting a filesystem
UUID on recent kernels on low boot entropy systems, it's because of the
problem described here.

On Mon, 2018-05-21 at 12:16 -0700, Trent Piepho wrote:
> This version of util-linux includes a work-around for a kernel 4.16.4,
> 4.17 change in the way getrandom() works.  In early boot, getrandom()
> can now block for a very long time if there is insufficient entropy,
> which can happen on embedded systems or qemu where there are few entropy
> sources.  Users of libuuid from util-linux can be affected by this.
> 
