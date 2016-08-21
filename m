From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Aug 2016 22:22:05 +0200
Subject: [Buildroot] [PATCH] package/ncurses: fix build on noMMU uclinux
 targets
In-Reply-To: <1471786682-18906-1-git-send-email-yann.morin.1998@free.fr>
References: <1471786682-18906-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160821222205.08c87b53@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 Aug 2016 15:38:02 +0200, Yann E. MORIN wrote:
> The ncurses buildsystem does not recognise 'uclinux' as being a 'linux',
> so it falls back to generic checks, especially when trying to decide
> what macros to define. So it misses defining absolutely required macros
> when doing widechar, which break the bui,d.
> 
> But 'uclinux' is just a 'linux' like any other in this respect.
> 
> We fix both aclocal.m4 and the generated ./configure script because
> ncurses does not autoreconf correctly (see comment in 0001-*.patch).
> 
> Fixes:
>     http://autobuild.buildroot.org/?reason=ncurses-5.9
>     http://autobuild.buildroot.org/results/d5c/d5c787d34acbfc0c0c7bd8cc0e15b5bc2460d88a/
>     http://autobuild.buildroot.org/results/fc4/fc4b41fb955c390913a879e0202760347ce29987/
>     [...too many to list...]
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/ncurses/0003-recognise-uclinux.patch | 30 ++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/ncurses/0003-recognise-uclinux.patch

Oh, and BTW, please submit the patch upstream. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
