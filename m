From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Jun 2010 16:02:00 +0200
Subject: [Buildroot] [PATCH v3] package: Add support for pidgin/finch
 instant messenger (2.7.1)
In-Reply-To: <201006241347.01454.PeterHuewe@gmx.de>
References: <201005140300.25098.PeterHuewe@gmx.de>
	<20100514110321.370b99b9@surf>
	<201005141412.48421.PeterHuewe@gmx.de>
	<201006241347.01454.PeterHuewe@gmx.de>
Message-ID: <20100624160200.06b35fc9@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Thu, 24 Jun 2010 13:47:01 +0200
Peter Huewe <PeterHuewe@gmx.de> wrote:

> +config BR2_PACKAGE_PIDGIN
> +	bool "pidgin/finch"
> +	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_NCURSES_TARGET_PANEL
> +	help
> +		Pidgin is a multi-protocol Instant Messaging client that allows you to use all of your IM accounts at once.
> +		Finch is the ncurses based version of pidgin.
> +		This builds only the ncurses based client! with support for jabber (works), irc(works) and icq/aim (broken)
> +		http://pidgin.im/

The help message must be :

 * Indented by a tab + 2 spaces
 * Wrapped to fit ~80 columns

> +PIDGIN_DEPENDENCIES = gettext libintl libglib2 ncurses libxml2

This dependency on gettext isn't correct. See
http://buildroot.org/downloads/buildroot.html#gettext-integration for
details.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
