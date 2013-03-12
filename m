From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Mar 2013 13:42:07 +0100
Subject: [Buildroot] qt4 and qt5 side-by-side
In-Reply-To: <513ED236.20305@mind.be>
References: <513ED236.20305@mind.be>
Message-ID: <20130312134207.456afc31@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 12 Mar 2013 07:59:02 +0100, Arnout Vandecappelle wrote:
>   Qt4 and Qt5 are currently not mutually exclusive. As I just found out, 
> they really are...
> 
>   Qt4 installs qt.conf in $(HOST_DIR)/usr/bin; if you use this with qt5's 
> qmake, qmake will spit out bogus configuration options. As soon as you 
> commit one of the other qt5 packages, you'll start to get autobuilder 
> failures (which are pretty hard to debug as I can testify :-).
> 
>   For the time being, I propose to add a 'depends on !BR2_PACKAGE_QT' to
> BR2_PACKAGE_QT5. Ideally, QT should become a virtual package with choices 
> between qt4 and qt5.

Fine with me. I don't think it's a reasonable use case to support both
qt4 and qt5 in the same system in Buildroot, so I fully support the
idea of adding the depends on !BR2_PACKAGE_QT.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
