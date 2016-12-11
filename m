From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Dec 2016 18:05:27 +0100
Subject: [Buildroot] [PATCH] acl: backport upstream patch to fix static
 build
In-Reply-To: <1481470243-8813-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1481470243-8813-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20161211180527.439eca7f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Dec 2016 21:00:43 +0530, Rahul Bedarkar wrote:
> When building tar package with acl in static build configuration, we
> get definition clash error for 'quote' function.
> 
> ../gnu/libgnu.a(quotearg.o): In function 'quote':
> quotearg.c:(.text+0x12fc): multiple definition of 'quote'
> ../sysroot/usr/lib/libacl.a(quote.o):/home/test/autobuild/run/instance-1/output/build/acl-2.2.52/libmisc/quote.c:27: first defined here
> 
> In acl upstream, this is already fixed by renaming quote and unquote
> internal functions. This commit backports upstream patch.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/d64/d64d13745c980d322d3b80c3b324d03eb7f17262
> 
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  ...2-add-__acl_-prefixes-to-internal-symbols.patch | 292 +++++++++++++++++++++
>  1 file changed, 292 insertions(+)
>  create mode 100644 package/acl/0002-add-__acl_-prefixes-to-internal-symbols.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
