From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 26 Jul 2018 10:05:34 +0200
Subject: [Buildroot] [PATCH] libostree: override path to gpg-error-config
In-Reply-To: <6af2fcd3-69fc-a228-6bb1-d00cc9e67d1f@mind.be>
References: <20180726074231.19768-1-marcus.folkesson@gmail.com>
 <6af2fcd3-69fc-a228-6bb1-d00cc9e67d1f@mind.be>
Message-ID: <20180726080534.GA29310@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 26, 2018 at 09:56:31AM +0200, Arnout Vandecappelle wrote:
> 
> 
> On 26-07-18 09:42, Marcus Folkesson wrote:
> > libostree has begun to use `gpg-error-config` in their configuration
> > script.
> > Point out gpg-error-config in staging dir to avoid using the one
> > installed on the host system.
> > 
> > Fixes:
> >  http://autobuild.buildroot.net/results/447b96e449e881cf1bd9644cda0f386aa4c75724
> > 
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---
> >  package/libostree/libostree.mk | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
> > index 24eda0d1db..4d0b38fc9e 100644
> > --- a/package/libostree/libostree.mk
> > +++ b/package/libostree/libostree.mk
> > @@ -12,6 +12,7 @@ LIBOSTREE_LICENSE = LGPL-2.0+
> >  LIBOSTREE_LICENSE_FILES = COPYING
> >  LIBOSTREE_DEPENDENCIES = e2fsprogs host-bison host-pkgconf libfuse libglib2 libgpgme xz
> >  LIBOSTREE_INSTALL_STAGING = YES
> > +LIBOSTREE_CONF_ENV = ac_cv_path_GPG_ERROR_CONFIG=$(STAGING_DIR)/usr/bin/gpg-error-config
> 
>  We would normally use GPG_ERROR_CONFIG instead of ac_cv_path_GPG_ERROR_CONFIG.
> Is there any reason why that doesn't work?

No, I just got inspiration from other packages, so really no reason.
GPG_ERROR_CONFIG seems to work as well.

I will change that, thank you.

> 
>  Regards,
>  Arnout
> 
> >  
> >  LIBOSTREE_CONF_OPTS += \
> >  	--with-gpgme-prefix=$(STAGING_DIR)/usr \
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF


Best regards
Marcus Folkesson
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180726/546be156/attachment.asc>
