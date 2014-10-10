From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 10 Oct 2014 11:36:01 +0100
Subject: [Buildroot] [PATCH 2/2] kmod: needs to autoreconf
In-Reply-To: <1412936897-8478-2-git-send-email-gustavo@zacarias.com.ar>
References: <1412936897-8478-1-git-send-email-gustavo@zacarias.com.ar>
 <1412936897-8478-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <5437B691.1070204@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 10/10/2014 11:28 AM, Gustavo Zacarias wrote:
> Fixes:
> http://autobuild.buildroot.net/results/7a7/7a70b179f17070d0a0883f71c60030dd7d8a9102/
> Didn't see widespread failure because it autoreconfed on its own just
> fine if autotools infra was already present.
> And didn't work before the automake patch with AUTORECONF=YES because of
> an older gtk-doc.m4
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>   package/kmod/kmod.mk | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
> index 1f170dd..99ab387 100644
> --- a/package/kmod/kmod.mk
> +++ b/package/kmod/kmod.mk
> @@ -8,6 +8,8 @@ KMOD_VERSION = 18
>   KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
>   KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
>   KMOD_INSTALL_STAGING = YES
> +# For kmod-0002-add-backup-implementation-of-be32toh.patch
> +KMOD_AUTORECONF = YES
>   KMOD_DEPENDENCIES = host-pkgconf
>   HOST_KMOD_DEPENDENCIES = host-pkgconf
>
>

Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
