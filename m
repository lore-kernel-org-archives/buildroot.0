From: Markos Chandras <markos.chandras@gmail.com>
Date: Fri, 23 Aug 2013 15:24:33 +0100
Subject: [Buildroot] [PATCH] openssl: don't build tests
In-Reply-To: <1377266544-28293-1-git-send-email-gustavo@zacarias.com.ar>
References: <1377266544-28293-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CAG2jQ8gbgzri3kdSsR4EkNFXdbfUHgakNnQSXT32u_z7hTVGrg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23 August 2013 15:02, Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:
> These require shared libraries and we save a tiny amount of build time.
> Fixes:
> http://autobuild.buildroot.net/results/88e/88e5e07e94e49879907186ff35ce66944f867ec2/
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/openssl/openssl.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
> index a0e103b..4b8b0a4 100644
> --- a/package/openssl/openssl.mk
> +++ b/package/openssl/openssl.mk
> @@ -85,6 +85,7 @@ define OPENSSL_CONFIGURE_CMDS
>         )
>         $(SED) "s:-march=[-a-z0-9] ::" -e "s:-mcpu=[-a-z0-9] ::g" $(@D)/Makefile
>         $(SED) "s:-O[0-9]:$(OPENSSL_CFLAGS):" $(@D)/Makefile
> +       $(SED) "s: build_tests::" $(@D)/Makefile
>  endef
>
>  define HOST_OPENSSL_BUILD_CMDS
> --
> 1.8.1.5
>

Looks good to me.

Reviewed-by/Tested-by: Markos Chandras <markos.chandras@imgtec.com>

-- 
Regards,
Markos Chandras
