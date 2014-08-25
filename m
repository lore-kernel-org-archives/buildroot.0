From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Aug 2014 23:10:51 +0200
Subject: [Buildroot] [PATCH] package/infra: fix downloading versions
 with a slash
In-Reply-To: <1408468875-6811-1-git-send-email-yann.morin.1998@free.fr>
References: <1408468875-6811-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140825231051.53a3c18c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 19 Aug 2014 19:21:15 +0200, Yann E. MORIN wrote:
> Since cset 54456cc (infra: consistently use double dollar signs...), it
> is no longer possible to download versions with a slash in it, because
> the _DL_VERSION variable is second-expanded, but the _VERSION variable
> is immediately-expanded to have '/' substitued with '_'.
> 
> So, _DL_VERSION is only expanded at the time it is evaluated, and by
> that time, we've lost the slashes in _VERSION.
> 
> Make the _DL_VERSION variables immediately-evaluated.
> 
> Fixes:
>     https://bugs.busybox.net/show_bug.cgi?id=7328
> 
> Reported-by:  Vincent Stehl? <vincent.stehle@freescale.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc:  Vincent Stehl? <vincent.stehle@freescale.com>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
