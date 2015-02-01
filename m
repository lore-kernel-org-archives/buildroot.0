From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Feb 2015 22:25:42 +0100
Subject: [Buildroot] [PATCH] pkg-autotools: fix patching libtool for
 version 2.4
In-Reply-To: <1422315024-14602-1-git-send-email-yann.morin.1998@free.fr>
References: <1422315024-14602-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150201222542.72d67ff4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 27 Jan 2015 00:30:24 +0100, Yann E. MORIN wrote:
> If the libtool used by the package is 2.4 (i.e. with no patchlevel), we
> end up with a confusing message:
> 
>     /bin/sh: line 0: test: -gt: unary operator expected
> 
> That's because patchlevel is empty, and thus there is nothing to comapre
> to 2, and test complains.
> 
> Fake a patchlevel of 0 (which is really what a missing patchlevel means
> anyway) in that case.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> ---
>  package/pkg-autotools.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
