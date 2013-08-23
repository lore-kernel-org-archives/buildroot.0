From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 23 Aug 2013 17:46:12 +0200
Subject: [Buildroot] Problem with Qt when using commit libglib2: Bump
	libglib2 to 2.36.1 ( no touchscreen )
In-Reply-To: <20130823131819.6035af8e@skate>
References: <16F215BDBD9D49C49E858122318082E4@JohanW7>
 <20130823131819.6035af8e@skate>
Message-ID: <15B69DCB75BB4B719CD6459453D68CDF@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi

Using the latest glib version does not solve it.(did not expect it would.)
I guess the solution to solve this is does not seem to be trivial.
(libglib2 is an annoying one,since many other packages depend on it.)

So this leaves me with 2 options: revert libglib2 and libsoup or live without phonon.

Regards ,Johan


-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Thomas Petazzoni
Verzonden: vrijdag 23 augustus 2013 13:18
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] Problem with Qt when using commit libglib2: Bump libglib2 to 2.36.1 ( no touchscreen )

Dear Sagaert Johan,

On Fri, 23 Aug 2013 10:28:46 +0200, Sagaert Johan wrote:

> For some unknown reason, this commit (1232fe4d22e15a31385c69f02570f036b738b6b2) seems to break Qt484 at runtime.
> Qt just does not react any longer to the touchscreen.There are no warnings.
> Everything else is the same, i see no obvious relation between this commit and the trouble i have.
> Just have no clue what the binding is between libglib2 and Qt ?

Qt has a glib integration. If you're not using it, you could disable it by replacing:

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
Kernel, drivers, real-time and embedded Linux development, consulting, training and support.
http://free-electrons.com
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
