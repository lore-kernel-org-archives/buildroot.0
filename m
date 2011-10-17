From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Oct 2011 22:40:00 +0200
Subject: [Buildroot] [PATCH 4/9] New package: Google Breakpad library
In-Reply-To: <1318603921-22899-5-git-send-email-will_wagner@carallon.com>
References: <1318603921-22899-1-git-send-email-will_wagner@carallon.com>
 <1318603921-22899-5-git-send-email-will_wagner@carallon.com>
Message-ID: <20111017224000.33a17f76@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Fri, 14 Oct 2011 15:51:56 +0100,
Will Wagner <will_wagner@carallon.com> a ?crit :

> The breakpad library is a crash reporting framework
> 
> See http://code.google.com/p/google-breakpad/ for more details
> 
> Signed-off-by: Will Wagner <will_wagner@carallon.com>
> ---
>  package/Config.in                                  |    1 +
>  package/breakpad/Config.in                         |    7 ++++
>  .../breakpad-782_crash_generation_server.patch     |   12 +++++++
>  .../breakpad-782_linux_client_cleanup.patch        |   33 ++++++++++++++++++++
>  package/breakpad/breakpad-782_linux_exit.patch     |   22 +++++++++++++

As Arnout said, all patches require a proper description +
Signed-off-by line. See for example
package/libgtk2/host-libgtk2-2.20.1-reduce-dependencies.patch.

> +#############################################################
> +#
> +# breakpad
> +#
> +#############################################################
> +
> +BREAKPAD_SITE:=http://google-breakpad.googlecode.com/svn/trunk/
> +BREAKPAD_SITE_METHOD:=svn
> +BREAKPAD_VERSION:=842
> +BREAKPAD_DEPENDENCIES:=libcurl

= instead of :=, spaces before and after =.

> +BREAKPAD_LIBTOOL_PATCH = NO

Does it really break something?

> +BREAKPAD_INSTALL_STAGING = YES
> +BREAKPAD_INSTALL_TARGET = NO

This is a strange combination. A comment would be good to explain why a
library does not need to be installed on the target.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
