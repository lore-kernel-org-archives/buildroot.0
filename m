From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Feb 2014 18:30:36 +0100
Subject: [Buildroot] [pkg-perl infra V9 6/6] perl: remove
	PERL_INSTALL_TARGET_GOALS
In-Reply-To: <1392192871-426-7-git-send-email-francois.perrad@gadz.org>
References: <1392192871-426-1-git-send-email-francois.perrad@gadz.org>
 <1392192871-426-7-git-send-email-francois.perrad@gadz.org>
Message-ID: <52FBAFBC.60306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/02/14 09:14, Francois Perrad wrote:
> useless since previous commit (removal of BR2_HAVE_DOCUMENTATION)
> see http://git.buildroot.net/buildroot/diff/package/perl/perl.mk?id=7164a32632d14cb83698ddec45e84ad2f3252e9e
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

 Note that this patch can go in immediately, perhaps even for 2014.02.

 Regards,
 Arnout

> ---
>  package/perl/perl.mk |    4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
> index 5ede81b..51aeb14 100644
> --- a/package/perl/perl.mk
> +++ b/package/perl/perl.mk
> @@ -90,10 +90,8 @@ define PERL_INSTALL_STAGING_CMDS
>  	$(MAKE1) -C $(@D) DESTDIR="$(STAGING_DIR)" install.perl
>  endef
>  
> -PERL_INSTALL_TARGET_GOALS = install.perl
> -
>  define PERL_INSTALL_TARGET_CMDS
> -	$(MAKE1) -C $(@D) DESTDIR="$(TARGET_DIR)" $(PERL_INSTALL_TARGET_GOALS)
> +	$(MAKE1) -C $(@D) DESTDIR="$(TARGET_DIR)" install.perl
>  endef
>  
>  $(eval $(generic-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
