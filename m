From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 23 Aug 2013 14:19:47 +0200
Subject: [Buildroot] Problem with Qt when using commit libglib2: Bump
	libglib2 to 2.36.1 ( no touchscreen )
In-Reply-To: <20130823131819.6035af8e@skate>
References: <16F215BDBD9D49C49E858122318082E4@JohanW7>
 <20130823131819.6035af8e@skate>
Message-ID: <803DC9B017324749BED5EF43952941FB@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Thomas

Thanks, will try it and post the result as soon as my current build finishes...
I don't need glib explicit, but it's build since I use libsoup and libsoup has glib as dependency.

Johan


-----Oorspronkelijk bericht-----
Van: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
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
