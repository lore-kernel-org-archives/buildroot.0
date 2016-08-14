From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Aug 2016 16:05:51 +0200
Subject: [Buildroot] [PATCH 2/2] package/systemd-bootchart: don't build
 manpages
In-Reply-To: <1471108019-21603-2-git-send-email-yann.morin.1998@free.fr>
References: <1471108019-21603-1-git-send-email-yann.morin.1998@free.fr>
 <1471108019-21603-2-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160814160551.0f3c0490@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 13 Aug 2016 19:06:59 +0200, Yann E. MORIN wrote:
> Building the man pages requires xsltproc, which is not always available
> on the build machine, so the build fails at configure:
>     configure: error: *** xsltproc is required for man pages
> 
> But then, even when xsltproc is present, it can't actually build the man
> pages, because it can't "download external entities":
>     I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
>     warning: failed to load external entity "http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl"
>     compilation error: file ./man/custom-man.xsl line 27 element import
> 
> Add a patch (sent upstream) to allow not building the man pages.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/e2a/e2ae38775b6acff3c3a8ea233ec70dd68b017319/
>     http://autobuild.buildroot.org/results/66d/66d85622db9f7ff5a4e8d6eed3fd3b32959685cf/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Applied to master, thanks!

I was going to suggest that instead of adding a configure option to
decide whether to build man pages or not, you could have decided
depending on the availability of xsltproc. Except that, as you
explained in the commit log, xsltproc might be available, but still
building the man pages might fail.

So, I've applied. Hopefully, upstream will accept this solution.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
