From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Oct 2013 00:49:22 +0200
Subject: [Buildroot] [PATCH v8 RESEND 6/8] uclibc: add support for
 top-level parallel make
In-Reply-To: <1382088860-30524-7-git-send-email-fabio.porcedda@gmail.com>
References: <1382088860-30524-1-git-send-email-fabio.porcedda@gmail.com>
 <1382088860-30524-7-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <52685272.5070507@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/10/13 11:34, Fabio Porcedda wrote:
> To be able to use top-level parallel make we must not depend in a rule
> on the order of evaluation of the prerequisites, so instead of relyng on
> the left to right ordering of evaluation of the prerequisites add an
> explicit rule to describe the dependencies.
>
> The uclibc-install-target depends on uclibc-install-staging so add a
> rule for it.
>
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>   package/uclibc/uclibc.mk | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index dea36e7..c8eeb3d 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -559,3 +559,5 @@ uclibc-menuconfig: dirs uclibc-patch
>   	rm -f $(UCLIBC_DIR)/.stamp_{configured,built,target_installed,staging_installed}
>
>   $(eval $(generic-package))
> +
> +$(UCLIBC_TARGET_INSTALL_TARGET): $(UCLIBC_TARGET_INSTALL_STAGING)
>

  Same nitpick :-)

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
