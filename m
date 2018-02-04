From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Feb 2018 23:43:01 +0100
Subject: [Buildroot] [RFC v1] libv4l: fix qv4l2 libatomic related
 compile failure
In-Reply-To: <20180203232127.22765-1-ps.report@gmx.net>
References: <20180203232127.22765-1-ps.report@gmx.net>
Message-ID: <20180204234301.39188706@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Feb 2018 00:21:27 +0100, Peter Seiderer wrote:
> Fixes [1]:
> 
>   sparc-buildroot-linux-uclibc/bin/ld: qv4l2-qv4l2.o: undefined reference to symbol '__atomic_fetch_add_4@@LIBATOMIC_1.0'
> 
> [1] http://autobuild.buildroot.net/results/baa2595e1acdf4e795fbb940ca57fd136c827da3

Did you analyze what part of the code is using atomic intrinsics? I
don't see any use of atomic instrisics in qv4l2 itself (but perhaps I
missed them), so they must be somewhere else.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
