From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 8 Jan 2019 16:24:24 +0100
Subject: [Buildroot] [PATCH 16/19] core: check unique files in the
 corresponding finalize step
In-Reply-To: <543d715864419720bee6d5d858cf4c2debd773f0.1546898693.git.yann.morin.1998@free.fr>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
 <543d715864419720bee6d5d858cf4c2debd773f0.1546898693.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LVA1XOgkSGw6S=1d7+9Lxt4H-x3cJnRPn0nizu4WfQ1cw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El lun., 7 ene. 2019 a las 23:07, Yann E. MORIN
(<yann.morin.1998@free.fr>) escribi?:
>
> Currently, the check for uniq files is done all in one location, during
> target-finalize. This is historical, back from when we had a single
> finalize step.
>
> But we now have one for each of target, staging, and host.
>
> So, mnove the check to the corresponding finalize steps.
>
> This will help, later, if/when we introduce actions specific to each
> step, that would have an impact on the result of check-uniq-files.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  Makefile | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 9f4d037cca..dcc738a1b6 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -708,19 +708,22 @@ $(TARGETS_ROOTFS): target-finalize
>  # Avoid the rootfs name leaking down the dependency chain
>  target-finalize: ROOTFS=
>
> +.PHONY: staging-finalize

This should be host-finalize.

/Thomas
