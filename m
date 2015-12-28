From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 17:53:45 +0100
Subject: [Buildroot] [PATCHv3] package/connman: cleanup backtrace patch
In-Reply-To: <1450962009-12924-1-git-send-email-yann.morin.1998@free.fr>
References: <1450962009-12924-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20151228175345.364a9594@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 24 Dec 2015 14:00:09 +0100, Yann E. MORIN wrote:
> connman uses execinfo.h to dump a backtrace in case of failure.
> execinfo.h is optional in uClibc, so we had a patch that conditonally
> disabled backtraces for uClibc when it was missing execinfo.h
> 
> However, musl is also entirely lacking execinfo.h.
> 
> Add a proper patch that checks for execinfo.h at ./configure time. This
> will no longer make any assumption on the C library that is being used.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/f6e/f6ee8ab3a6300f1f527f9e92b8c2ec81e63afb27/
>     http://autobuild.buildroot.org/results/96b/96b78bb644ed4ef3493782521b17e3b2113a405f/
>     ...
> 
> Note that there might be other issues with musl; this patch only fixes
> the execinfo.h one.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Baruch Siach <baruch@tkos.co.il>
> 
> ---
> Patch sent upstream:
>     https://lists.01.org/pipermail/connman/2015-December/000188.html

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
