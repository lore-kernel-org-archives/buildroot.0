From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 23:32:50 +0200
Subject: [Buildroot] [PATCH 14/18] package/mplayer: add optional
 libiconv support
In-Reply-To: <20150408213008.GH4197@free.fr>
References: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
 <1427649094-1240-15-git-send-email-bernd.kuhls@t-online.de>
 <20150408213008.GH4197@free.fr>
Message-ID: <20150408233250.1d28f0ad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 8 Apr 2015 23:30:08 +0200, Yann E. MORIN wrote:

> > +ifeq ($(BR2_PACKAGE_LIBICONV),y)
> > +MPLAYER_CONF_OPTS += --enable-iconv
> > +MPLAYER_DEPENDENCIES += libiconv
> > +MPLAYER_EXTRA_LIBS += -liconv
> 
> Even though that's jsut been merged, I think this has the same issue as
> the librtmp: ./configure will find the appropriate CFLAGS/LIBS if not
> explicitly told to use iconv, so I'd just add the dependency (like
> already suggested for librtmp).
> 
> Care to address that ad send a respin, please?

I've addressed that when applying:

+# We intentionally don't pass --enable-libiconv, to let the
+# autodetection find which library to link with.
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+MPLAYER_DEPENDENCIES += libiconv
+else
+MPLAYER_CONF_OPTS += --disable-iconv
+endif

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
