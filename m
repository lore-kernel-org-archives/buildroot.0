From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 22:41:25 +0200
Subject: [Buildroot] [PATCH] cppcms: fix build with ICU
In-Reply-To: <20170722202426.29171-1-thomas.petazzoni@free-electrons.com>
References: <20170722202426.29171-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170722224125.7480ab1c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Jul 2017 22:24:26 +0200, Thomas Petazzoni wrote:
> Since the bump of ICU to 59.1, it needs C++11. cppcms has been updated
> with the appropriate dependency on gcc >= 4.8, but it also needs
> -std=c++11. Therefore, this patch complements the CXXFLAGS passed to
> cppcms by adding what icu-config reports, in a manner similar to what
> was done to fix the same issue in the PHP package in commit
> 214a76d045f906c1a8d687b7c7e7bc85c5b09906 ("package/php: fix icu
> support").
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/f05d9999f1f3248b6a50f14de476108028ed047e/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/cppcms/cppcms.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
