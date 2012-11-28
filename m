From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Nov 2012 23:09:55 +0100
Subject: [Buildroot] [git commit branch/next] package: add gd package
In-Reply-To: <20121128011244.B677B8F461@busybox.osuosl.org>
References: <20121128011244.B677B8F461@busybox.osuosl.org>
Message-ID: <50B68BB3.9090503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/11/12 20:21, Peter Korsgaard wrote:
[snip]
> +# configure.ac has newer timestamp than aclocal.m4 / configure, so we need
> +# to autoreconf to regenerate them (or set configure.ac timestamp to older
> +# than them) to make the Makefile happy.
> +# configure.ac refers to AM_ICONV which we only have if gettext is enabled,
> +# so add a dummy definition elsewise
> +define GD_FIXUP_ICONV
> +	echo 'm4_ifndef([AM_ICONV],[m4_define([AM_ICONV],[:])])' \
> +		>>  $(@D)/acinclude.m4
> +endef
> +
> +GD_PRE_CONFIGURE_HOOKS += GD_FIXUP_ICONV

  Is there any reason why this is a pre-configure hook instead of a
post-patch hook?

  The reason I ask is because I am thinking about putting the _patched_
source in the tarballs created by legal-info.  That would imply doing
a <pkg>-dirclean followed by a <pkg>-patch, but if there is any patching
that is done in one of the later steps, it will be missed.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
