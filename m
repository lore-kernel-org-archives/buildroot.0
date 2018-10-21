From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 09:00:07 +0200
Subject: [Buildroot] [PATCH 1/1] gvfs: enable keyring
In-Reply-To: <20181020200032.11152-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 20 Oct 2018 22:00:32 +0200")
References: <20181020200032.11152-1-fontaine.fabrice@gmail.com>
Message-ID: <87efcj943s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Enable keyring if libsecret is available
 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/gvfs/gvfs.mk | 9 +++++++--
 >  1 file changed, 7 insertions(+), 2 deletions(-)

 > diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
 > index 0fdb9e1267..45f01fc564 100644
 > --- a/package/gvfs/gvfs.mk
 > +++ b/package/gvfs/gvfs.mk
 > @@ -23,7 +23,6 @@ GVFS_CONF_OPTS = \
 >  	--disable-gdu \
 >  	--disable-goa \
 >  	--disable-google \
 > -	--disable-keyring \
 >  	--disable-libmtp \
 >  	--disable-udisks2
 
 > @@ -119,8 +118,14 @@ else
 >  GVFS_CONF_OPTS += --disable-nfs
 >  endif
 
 > +ifeq ($(BR2_PACKAGE_LIBSECRET),y)
 > +GVFS_DEPENDENCIES += libsecret
 > +GVFS_CONF_OPTS += --enable-keyring
 > +else
 > +GVFS_CONF_OPTS += --disable-keyring
 > +endif
 > +
 >  ifeq ($(BR2_PACKAGE_LIBSOUP)$(BR2_PACKAGE_LIBXML2),yy)
 > -GVFS_DEPENDENCIES += libsoup libxml2

Why are you removing this line?

-- 
Bye, Peter Korsgaard
