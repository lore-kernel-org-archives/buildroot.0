From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 21 Jun 2007 13:21:52 +0200
Subject: [Buildroot] [PATCH] gzip cpio
In-Reply-To: <1182422403.7911.2.camel@venture.bit63.org>
References: <1182422403.7911.2.camel@venture.bit63.org>
Message-ID: <20070621112152.GA21096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 21, 2007 at 06:40:03AM -0400, Clark Rawlins wrote:
>This patch is useful to me.  It permits gzipping the cpio archive after
>creation.  This is my first attempt so if there are better, or more
>correct ways to accomplish this I am interested in improving my changes.

Problem is that somebody will show up sooner or later who wants to use
another compressor (we've seen this with ext2 rootfs).
Let me suggest you look at target/ext2/ext2root.mk
and do the same COMPRESSOR fiddling (with cpio and any other target
format).

thanks,
