From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 May 2015 20:42:56 +0200
Subject: [Buildroot] [RFC] package/boost: fix powerpc uClibc build issue
In-Reply-To: <1431709207-25679-1-git-send-email-romain.naour@openwide.fr>
References: <1431709207-25679-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150515204256.7028a9d1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Fri, 15 May 2015 19:00:07 +0200, Romain Naour wrote:
> With powerpc target and uClibc toolchain the spirit library doesn't
> build properly due to an invalid field access.
> 
> The "bits" field is intended only for internal use in
> include/boost/math/special_functions/sign.hpp not from
> include/boost/spirit/home/support/detail/sign.hpp.
> 
> Simply call (boost::math::changesign)(x) from
> include/boost/spirit/home/support/detail/sign.hpp to fixes this.
> 
> Fixes:
> http://autobuild.buildroot.net/results/be1/be1069e8528d299f487f431f7e2d793413ccbab8/
> 
> And many more.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> It's not clear why this issue is only trigged by powerpc
> with uClibc toolchain.
> Also, it's a pity that the spirit library doesn't use directly
> math library instead of using a wrapper.

My opinion is that this patch is too tricky to be committed without
being checked by upstream Boost developers, especially since there is
no explanation as to why the problem occurs only on PowerPC.

I would prefer to disable boost-log on PowerPC/uClibc, as proposed by
the patch I submitted shortly after this one.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
