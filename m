From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Oct 2018 08:15:37 +0100
Subject: [Buildroot] [PATCH 1/1] lcdproc: use ac_cv_mtab_file
In-Reply-To: <20181027210114.8662-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 27 Oct 2018 23:01:14 +0200")
References: <20181027210114.8662-1-fontaine.fabrice@gmail.com>
Message-ID: <87zhuyzgme.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Set ac_cv_mtab_file to /etc/mtab otherwise build will fail if no mtab,
 > mnttab or fstab is found in /etc (on host)

 > Fixes:
 >  - http://autobuild.buildroot.org/results/efaf2833d674c7e366c59f367f0b83c7f88546bb

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I'm not sure if there are really any realistic cases where people are
building without /etc/mtab, but Ok.

Committed, thanks.

> ---
 >  package/lcdproc/lcdproc.mk | 4 +++-
 >  1 file changed, 3 insertions(+), 1 deletion(-)

 > diff --git a/package/lcdproc/lcdproc.mk b/package/lcdproc/lcdproc.mk
 > index e5b6172b15..96e59da409 100644
 > --- a/package/lcdproc/lcdproc.mk
 > +++ b/package/lcdproc/lcdproc.mk
 > @@ -18,7 +18,9 @@ endif
 
 >  LCDPROC_DEPENDENCIES = freetype ncurses zlib
 
 > -LCDPROC_CONF_ENV += ac_cv_path_FT2_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
 > +LCDPROC_CONF_ENV += \
 > +	ac_cv_mtab_file=/etc/mtab \
 > +	ac_cv_path_FT2_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
 
 >  ifeq ($(BR2_PACKAGE_LIBPNG),y)
 >  LCDPROC_DEPENDENCIES += libpng
 > -- 
 > 2.17.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
