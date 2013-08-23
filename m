From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Aug 2013 13:18:19 +0200
Subject: [Buildroot] Problem with Qt when using commit libglib2: Bump
 libglib2 to 2.36.1 ( no touchscreen )
In-Reply-To: <16F215BDBD9D49C49E858122318082E4@JohanW7>
References: <16F215BDBD9D49C49E858122318082E4@JohanW7>
Message-ID: <20130823131819.6035af8e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Fri, 23 Aug 2013 10:28:46 +0200, Sagaert Johan wrote:

> For some unknown reason, this commit (1232fe4d22e15a31385c69f02570f036b738b6b2) seems to break Qt484 at runtime.
> Qt just does not react any longer to the touchscreen.There are no warnings.
> Everything else is the same, i see no obvious relation between this commit and the trouble i have.
> Just have no clue what the binding is between libglib2 and Qt ?

Qt has a glib integration. If you're not using it, you could disable it
by replacing:

ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
QT_CONFIGURE_OPTS += -glib
QT_DEPENDENCIES += libglib2
else
QT_CONFIGURE_OPTS += -no-glib
endif

by just:

QT_CONFIGURE_OPTS += -no-glib

This would at least help us confirm that the problem is indeed here.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
