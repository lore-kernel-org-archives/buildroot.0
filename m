From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Oct 2013 00:48:56 +0200
Subject: [Buildroot] [PATCH v8 RESEND 5/8] glibc: add support for
 top-level parallel make
In-Reply-To: <1382088860-30524-6-git-send-email-fabio.porcedda@gmail.com>
References: <1382088860-30524-1-git-send-email-fabio.porcedda@gmail.com>
 <1382088860-30524-6-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <52685258.1030807@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/10/13 11:34, Fabio Porcedda wrote:
> To be able to use top-level parallel make we must not depend in a rule
> on the order of evaluation of the prerequisites, so instead of relyng on
> the left to right ordering of evaluation of the prerequisites add
> an explicit rule to describe the dependencies.
>
> The glibc-install-target depends on glibc-install-staging so add a rule
> for it.
>
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>   package/glibc/glibc.mk | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index e89c12a..838fb8c 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -130,3 +130,5 @@ define GLIBC_INSTALL_TARGET_CMDS
>   endef
>
>   $(eval $(autotools-package))
> +
> +$(GLIBC_TARGET_INSTALL_TARGET): $(GLIBC_TARGET_INSTALL_STAGING)
>

  Nitpick: I would have added a comment why this is needed.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
