From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2016 17:55:09 +0100
Subject: [Buildroot] [PATCH 1/1] gstreamer1: use a relative symlink to
	gstconfig.h
In-Reply-To: <1453987198-26052-1-git-send-email-phil@zankapfel.net> (Phil
 Eichinger's message of "Thu, 28 Jan 2016 14:19:58 +0100")
References: <1453987198-26052-1-git-send-email-phil@zankapfel.net>
Message-ID: <871t91prte.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Phil" == Phil Eichinger <phil.eichinger@gmail.com> writes:

 > Signed-off-by: Phil Eichinger <phil@zankapfel.net>

Why? Does that fix anything or is it just "prettier"? I get it that we
would need it for a relocatable host dir, but we're not there yet.

A bit more detailed commit message would be good.

> ---
 >  package/gstreamer1/gstreamer1/gstreamer1.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
 > index 4548773..0eb46e8 100644
 > --- a/package/gstreamer1/gstreamer1/gstreamer1.mk
 > +++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
 > @@ -41,7 +41,7 @@ GSTREAMER1_DEPENDENCIES = libglib2 host-pkgconf host-bison host-flex
 >  # updated to look in the correct location.
 >  # Add a symlink to the legacy location
 >  define GSTREAMER1_LEGACY_CGSTCONFIG_H
 > -	ln -sf $(STAGING_DIR)/usr/lib/gstreamer-1.0/include/gst/gstconfig.h \
 > +	ln -srf $(STAGING_DIR)/usr/lib/gstreamer-1.0/include/gst/gstconfig.h \
 >  	       $(STAGING_DIR)/usr/include/gstreamer-1.0/gst/gstconfig.h
 >  endef
 >  GSTREAMER1_POST_INSTALL_STAGING_HOOKS += GSTREAMER1_LEGACY_CGSTCONFIG_H
 > -- 
 > 2.1.4

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
