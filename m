From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 23:42:35 +0100
Subject: [Buildroot] [PATCH 06/21 v2] docs/manual: do not override
 BR2_EXTERNAL
In-Reply-To: <4ffb76bcc38fd984ddd6b91f6a0228456b418f1d.1445545973.git.yann.morin.1998@free.fr>
References: <cover.1445545973.git.yann.morin.1998@free.fr>
 <4ffb76bcc38fd984ddd6b91f6a0228456b418f1d.1445545973.git.yann.morin.1998@free.fr>
Message-ID: <20151103234235.2c5999af@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 22 Oct 2015 22:34:01 +0200, Yann E. MORIN wrote:
> Currently, we forcibly override BR2_EXTERNAL when building the manual,
> so as to avoid referring to packages therein from the manual.
> 
> However, when generating the lists of packages, we limit ourselves to
> scanning for packages in (Buildroot's) TOPDIR and never search in
> BR2_EXTERNAL. So, we do not really need to override BR2_EXTERNAL when
> generating the manual to achieve the same result.
> 
> Furthermore, we're only looking for packages that are defined in the
> sub-menu "Target packages", and never anywhere else, and especially not
> in the sub-menu "User-provided options".
> 
> Finally, we're soon to completely eliminate use of BR2_EXTERNAL in
> Kconfig altogether, so that would no longer have any impact anyway.
> 
> So, just leave BR2_EXTERNAL alone when generating the manual.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Samuel Martin <s.martin49@gmail.com>
> ---
>  docs/manual/manual.mk | 3 ---
>  1 file changed, 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
