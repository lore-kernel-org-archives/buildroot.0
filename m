From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 2 Jul 2015 23:47:40 +0200
Subject: [Buildroot] [PATCH] valgrind: install to staging
In-Reply-To: <1435852333-19317-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1435852333-19317-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <5595B17C.2070704@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/02/15 17:52, Vicente Olivert Riera wrote:
> This is necessary for some packages depending on valgrind, such as
> libdrm which will fail with an error like this one:
> 
> checking for VALGRIND... no
> checking whether to enable Valgrind support... configure: error:
> Valgrind support required but not present
> package/pkg-generic.mk:146: recipe for target
> '/br/output/build/libdrm-2.4.62/.stamp_configured' failed
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/valgrind/valgrind.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
> index cfce8da..f8f205e 100644
> --- a/package/valgrind/valgrind.mk
> +++ b/package/valgrind/valgrind.mk
> @@ -11,6 +11,7 @@ VALGRIND_LICENSE = GPLv2 GFDLv1.2
>  VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
>  VALGRIND_CONF_OPTS = --disable-tls
>  VALGRIND_AUTORECONF = YES
> +VALGRIND_INSTALL_STAGING = YES

 I wonder, are there going to be a lot of packages that will autodetect valgrind
presence and will now start linking with it?


 Regards,
 Arnout

>  
>  # On ARM, Valgrind only supports ARMv7, and uses the arch part of the
>  # host tuple to determine whether it's being built for ARMv7 or
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
