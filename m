From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Mar 2013 09:35:56 +0100
Subject: [Buildroot] [PATCH v4 05/21] qt5base: add glib support
In-Reply-To: <871ubbt7l8.fsf@dell.be.48ers.dk>
References: <1363721394-14973-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1363721394-14973-6-git-send-email-thomas.petazzoni@free-electrons.com>
 <871ubbt7l8.fsf@dell.be.48ers.dk>
Message-ID: <20130320093556.197f9966@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 19 Mar 2013 22:14:59 +0100, Peter Korsgaard wrote:

>  Thomas> @@ -95,6 +94,9 @@ QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_PNG),libpng)
>  Thomas>  QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DBUS),-dbus,-no-dbus)
>  Thomas>  QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_DBUS),dbus)
>  
>  Thomas> +QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_LIBGLIB2),-glib,-no-glib)
>  Thomas> +QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_LIBGLIB2),libglib2)
> 
> You're adding a mix of:
> 
>  - Explicit suboptions which selects the needed libraries
>    (fontconfig/jpeg/png/dbus)
>  - Automatic enabling/disabling support if package is enabled
> 
> Is there any specific reason for this?

For the specific cases you're pointing at (glib and dbus), I modeled
things to be similar to what we have for Qt4.

Also it kind of makes sense because adding DBus support creates an
additional Qt5DBus.so library, while the libglib2 support doesn't.

But admittedly, the boundary between automatic enabling/disabling
support and explicit suboptions is a bit fuzzy. It's sometimes a bit
strange to have a suboption for something very small, and automatic
enabling/disabling for something rather "big". I don't really have a
good idea on how to clearly draw the line between the two solutions.
One radical solution is: whenever it can be automatic, it should be.
Don't know if it's reasonable, though. I'm open to suggestions on this,
and we should probably update the documentation with details on this
topic.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
