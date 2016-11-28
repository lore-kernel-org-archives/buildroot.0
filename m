From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Nov 2016 21:17:05 +0100
Subject: [Buildroot] [PATCH v1] postgresql: fix
 pgac_cv_snprintf_long_long_int_modifier
In-Reply-To: <20161128192901.www7lldws5fvneki@tarshish>
References: <1480359231-29949-1-git-send-email-ps.report@gmx.net>
 <20161128192901.www7lldws5fvneki@tarshish>
Message-ID: <20161128211705.62dee464@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Nov 2016 21:29:01 +0200, Baruch Siach wrote:
> Hi Peter,
> 
> On Mon, Nov 28, 2016 at 07:53:51PM +0100, Peter Seiderer wrote:
> > Supplementary change the pgac_cv_snprintf_long_long_int_modifier from
> > complete format '%lld' to modifier 'll' version only (forgotten in commit
> > 02c43157ab09f6fe4078fd1145fc9d403d66c089 ([1])).  
> 
> The original commit that introduced pgac_cv_snprintf_long_long_int_format 
> caching (3d3f70b5677, postgresql: avoid AC_TRY_RUN when testing snprintf()) 
> did so because of AC_TRY_RUN calls. These were removed in upstream commit 
> a2edb023d [1]. It is most likely safe to remove these cached values now.
> 
> [1] https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=a2edb023d08778c3346bbbf4ca82ef7f6e9283eb

I don't see anything in this commit that removes the AC_TRY_RUN()
checks. It replaces the AC_TRY_RUN() checks by AC_RUN_IFELSE(), which
is doing exactly the same: a runtime test. What makes you think this
commit solves the problem?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
