From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Aug 2015 20:53:59 +0200
Subject: [Buildroot] [PATCH] package/canfestival: don't build in parallel
In-Reply-To: <1440279290-18408-1-git-send-email-yann.morin.1998@free.fr>
References: <1440279290-18408-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150825205359.0b1f1fee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 22 Aug 2015 23:34:50 +0200, Yann E. MORIN wrote:
> The Makefiles for canfestival are not correctly written, which leads to
> multiple warnings such as:
> 
>     make[4]: warning: jobserver unavailable: using -j1. Add `+' to parent make rule.
> 
> Since canfestival is relatively small, it builds in less than 6s here
> when not in parallell, while a parallel build takes 5s.
> 
> Just disable parallel build to avoid future surprises.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/canfestival/canfestival.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
