From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Apr 2014 21:28:45 +0200
Subject: [Buildroot] [PATCH 2/4] evemu: fix host-python/host-python3
	dependency
In-Reply-To: <1398711632-5831-3-git-send-email-ps.report@gmx.net>
References: <1398711632-5831-1-git-send-email-ps.report@gmx.net>
 <1398711632-5831-3-git-send-email-ps.report@gmx.net>
Message-ID: <535EABED.3080604@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/04/14 21:00, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  package/evemu/evemu.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
> index 385a982..07ad6f6 100644
> --- a/package/evemu/evemu.mk
> +++ b/package/evemu/evemu.mk
> @@ -24,8 +24,8 @@ EVEMU_CONF_OPT += --disable-tests
>  # Uses PKG_CHECK_MODULES() in configure.ac
>  EVEMU_DEPENDENCIES = host-pkgconf libevdev
>  
> -# Needs Python to generate a wrapper
> -EVEMU_DEPENDENCIES += host-python
> +# Needs Python for header file generation
> +EVEMU_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
>  
>  # package source code coming from git, so it doesn't have generated
>  # configure and Makefile.in
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
