From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Nov 2015 10:48:58 +0100
Subject: [Buildroot] [PATCH] package/gauche: remove unnecessary files
 for target, fix a typo
In-Reply-To: <201511100922.tAA9Ml77000486@ms-omx02.plus.so-net.ne.jp>
References: <201511100922.tAA9Ml77000486@ms-omx02.plus.so-net.ne.jp>
Message-ID: <20151110104858.6c49b759@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hiroshi,

On Tue, 10 Nov 2015 18:22:47 +0900, Hiroshi Kawashima wrote:
> Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>

Thanks for this patch. Also, I think you should have a look at the
autobuilder failures for gauche, it fails to build in a number of
situations. See:

   http://autobuild.buildroot.org/?reason=gauche-0.9.4

Some cases are due to unsupported architecture (example: xtensa), some
cases are due to the external libatomic_ops being built before gauche,
and therefore used by gauche instead of its internal copy, causing some
build failures, etc.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
