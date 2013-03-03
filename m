From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 03 Mar 2013 17:51:26 +0100
Subject: [Buildroot] [PATCH] stress: honor the BR2_PREFER_STATIC_LIB
	preference
In-Reply-To: <1362206128-27771-1-git-send-email-roylee17@gmail.com>
References: <1362206128-27771-1-git-send-email-roylee17@gmail.com>
Message-ID: <51337F8E.9070803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/03/13 07:35, Tzu-Jung Lee wrote:
> From: roylee17 <roylee17@gmail.com>
>
> Change-Id: I13f849e76557fac81b488ab26b4ac8b999888bc1
> ---
>   package/stress/stress.mk | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/package/stress/stress.mk b/package/stress/stress.mk
> index 3a047b5..af79bf2 100644
> --- a/package/stress/stress.mk
> +++ b/package/stress/stress.mk
> @@ -10,4 +10,7 @@ STRESS_VERSION = 1.0.4
>   STRESS_SITE    = http://weather.ou.edu/~apw/projects/stress
>   STRESS_AUTORECONF = YES
>
> +STRESS_CONF_OPT = \
> +	$(if $(BR2_PREFER_STATIC_LIB),--enable-static,--disable-static)

  This is already part of the standard SHARED_STATIC_LIBS_OPTS, which is 
part of the argument list of configure. The difference being that in the 
shared case, --enable-static is still passed (to allow building static 
libraries, in case some client prefers to link statically after all).

  Any reason why this doesn't work for stress?

  Regards,
  Arnout

> +
>   $(eval $(autotools-package))


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
