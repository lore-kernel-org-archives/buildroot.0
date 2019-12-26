From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 26 Dec 2019 16:34:19 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/ecryptfs-utils: fix parallel build
In-Reply-To: <20191226161008.7ee0166a@windsurf>
References: <20191226150330.3414899-1-fontaine.fabrice@gmail.com>
 <20191226161008.7ee0166a@windsurf>
Message-ID: <CAPi7W80FCGUXuLX-Ciye2honL8TeE4KHT3Ljkhc=1XkFLQHKeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le jeu. 26 d?c. 2019 ? 16:10, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello Fabrice,
>
> Thanks for the new iteration!
>
> On Thu, 26 Dec 2019 16:03:30 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > diff --git a/package/ecryptfs-utils/0004-drop-AM_GLIB_GNU_GETTEXT.patch b/package/ecryptfs-utils/0004-drop-AM_GLIB_GNU_GETTEXT.patch
> > new file mode 100644
> > index 0000000000..0c8d0ec36e
> > --- /dev/null
> > +++ b/package/ecryptfs-utils/0004-drop-AM_GLIB_GNU_GETTEXT.patch
> > @@ -0,0 +1,23 @@
> > +drop AM_GLIB_GNU_GETTEXT
> > +
> > +This will fix the following failure when running autoreconf:
> > +
> > +configure.ac:372: warning: macro 'AM_GLIB_GNU_GETTEXT' not found in library
> > +configure.ac:372: error: possibly undefined macro: AM_GLIB_GNU_GETTEXT
> > +      If this token and others are legitimate, please use m4_pattern_allow.
> > +      See the Autoconf documentation.
> > +
> > +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +
> > +diff -Nuar ecryptfs-utils-111-orig/configure.ac ecryptfs-utils-111/configure.ac
> > +--- ecryptfs-utils-111-orig/configure.ac     2019-12-26 15:14:16.652146065 +0100
> > ++++ ecryptfs-utils-111/configure.ac  2019-12-26 15:54:49.212246135 +0100
> > +@@ -369,8 +369,6 @@
> > + AC_DEFINE_UNQUOTED(GETTEXT_PACKAGE,"$GETTEXT_PACKAGE",
> > +                    [the gettext translation domain])
> > +
> > +-AM_GLIB_GNU_GETTEXT
>
> Are you sure it is useless? Just dropping a line of code that is
> "annoying" because it causes a build failure is quite weird.
>
> What makes you think it is useless? This m4 macro is most likely
> provided by some other package.
Yes, it is provided by libglib2 but we definitely does not want to depend on it.
I saw that this issue was already raised by avahi in 2014:
http://lists.busybox.net/pipermail/buildroot/2014-November/111185.html.
After reading the 4 proposals from this thread, I decided to go to the
third one as the package already has a dependency on host-intltool.
But frankly, upstream seems pretty much dead (no updates since June
2017) so my preferred option would be to just disable parallel build.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
