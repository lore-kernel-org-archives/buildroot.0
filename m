From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 19 Mar 2015 08:56:54 +0200
Subject: [Buildroot] [PATCH] package/perf: fix build failures with high
 'make -j' values
In-Reply-To: <1426715244-25068-1-git-send-email-steven@uplinklabs.net>
References: <1426715244-25068-1-git-send-email-steven@uplinklabs.net>
Message-ID: <20150319065654.GV2415@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Steven,

On Wed, Mar 18, 2015 at 02:47:24PM -0700, Steven Noonan wrote:
> The 'perf' Makefile is flaky on some kernel versions. It will still parallelize
> the build even with 'make -j1' because it explicitly invokes a sub-make with
> the correct flags. But the top-level make is not smart enough to handle large
> '-j' values.
> 
> Signed-off-by: Steven Noonan <steven@uplinklabs.net>
> ---
>  package/perf/perf.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/perf/perf.mk b/package/perf/perf.mk
> index 1fcc258..f6591a6 100644
> --- a/package/perf/perf.mk
> +++ b/package/perf/perf.mk
> @@ -22,6 +22,8 @@ PERF_MAKE_FLAGS = \
>  	WERROR=0 \
>  	ASCIIDOC=
>  
> +PERF_MAKE_FLAGS += -j1

Please use $(MAKE1).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
