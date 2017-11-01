From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Nov 2017 10:47:00 +0100
Subject: [Buildroot] [PATCH] openssh: fix getpagesize() related static
 linking issue
In-Reply-To: <20171030224555.3220-1-peter@korsgaard.com>
References: <20171030224555.3220-1-peter@korsgaard.com>
Message-ID: <20171101104700.036fad1f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 Oct 2017 23:45:55 +0100, Peter Korsgaard wrote:
> Fixes:
> http://autobuild.buildroot.net/results/8cc/8cc30818a400c7a392a3de787cabc9cd8425495f/
> 
> The configure script checks for getpagesize() and sets HAVE_GETPAGESIZE in
> config.h, but bsd-getpagesize.c forgot to include includes.h (which
> indirectly includes config.h) so the checks always fails, causing linker
> issues when linking statically on systems with getpagesize().
> 
> Fix it by including includes.h.
> 
> Patch submitted upstream:
> https://lists.mindrot.org/pipermail/openssh-unix-dev/2017-October/036413.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...pat-bsd-getpagesize.c-include-includes.h-.patch | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/openssh/0005-openbsd-compat-bsd-getpagesize.c-include-includes.h-.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
