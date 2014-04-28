From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Apr 2014 18:46:09 +0200
Subject: [Buildroot] [V2 2/2] perl-cross: bump to version 0.8.5
In-Reply-To: <1398356762-12486-2-git-send-email-francois.perrad@gadz.org>
References: <1398356762-12486-1-git-send-email-francois.perrad@gadz.org>
 <1398356762-12486-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <535E85D1.8020008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/04/14 18:26, Francois Perrad wrote:
> The perl-cross tarball allows to patch the Perl distribution (in a _POST_EXTRACT_HOOKS).
> The github helper gives a copy of the project which allows to build this tarball.
> So, the github helper can not be used here.

 Commit log should be wrapped at 72 columns. Also, please mention that
you changed the site as well (because berlios closes down).

 However, the only difference I see between using the github helper and
using the release URL is that that the github helper installs three extra
files. I don't see how these three files interfere with building. So
unless there's something I missed, I'd use the github helper.

 Regards,
 Arnout

> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl/perl.mk | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
> index 64ad7d3..d9e506e 100644
> --- a/package/perl/perl.mk
> +++ b/package/perl/perl.mk
> @@ -12,9 +12,10 @@ PERL_LICENSE = Artistic or GPLv1+
>  PERL_LICENSE_FILES = Artistic Copying README
>  PERL_INSTALL_STAGING = YES
>  
> -PERL_CROSS_VERSION = 0.8.3
> -PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).1
> -PERL_CROSS_SITE    = http://download.berlios.de/perlcross
> +PERL_CROSS_VERSION = 0.8.5
> +PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).2
> +# DO NOT refactor with the github helper (the result is not the same)
> +PERL_CROSS_SITE    = http://raw.github.com/arsv/perl-cross/releases
>  PERL_CROSS_SOURCE  = perl-$(PERL_CROSS_BASE_VERSION)-cross-$(PERL_CROSS_VERSION).tar.gz
>  PERL_CROSS_OLD_POD = perl$(subst .,,$(PERL_CROSS_BASE_VERSION))delta.pod
>  PERL_CROSS_NEW_POD = perl$(subst .,,$(PERL_VERSION))delta.pod
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
