From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Nov 2013 18:11:21 +0100
Subject: [Buildroot] [PATCH] poco: fix sh4a fenv build failure
In-Reply-To: <5d2e8438f0988fd083d58c8ecebce26a47eb26e4.1385398048.git.baruch@tkos.co.il>
References: <5d2e8438f0988fd083d58c8ecebce26a47eb26e4.1385398048.git.baruch@tkos.co.il>
Message-ID: <20131125181121.06f6a801@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Mon, 25 Nov 2013 18:47:28 +0200, Baruch Siach wrote:
> Disable FP environment on sh4a. Fixes
> http://autobuild.buildroot.net/results/8dc9bca5969d455cc30206fc1ae6e1d3ba6eb6ca/.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/poco/poco.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/poco/poco.mk b/package/poco/poco.mk
> index a18f209..3516c04 100644
> --- a/package/poco/poco.mk
> +++ b/package/poco/poco.mk
> @@ -34,6 +34,11 @@ ifeq ($(LIBC),uclibc)
>  POCO_CONF_OPT += --no-fpenvironment --no-wstring
>  endif
>  
> +# sh4a is missing FE_DOWNWARD and FE_UPWARD in its fenv.h
> +ifeq ($(BR2_sh4a),y)
> +POCO_CONF_OPT += --no-fpenvironment
> +endif

Just curious, is this (the fact that SH4 fenv.h lacks some definitions)
something specific to uClibc, or something that is also true for
glibc/eglibc?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
