From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 23 Jul 2007 16:53:19 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
In-Reply-To: <20070723150038.2E3F2A605F@busybox.net>
References: <20070723150038.2E3F2A605F@busybox.net>
Message-ID: <20070723145318.GD9324@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 23, 2007 at 08:00:38AM -0700, ulf at uclibc.org wrote:
>Author: ulf
>Date: 2007-07-23 08:00:37 -0700 (Mon, 23 Jul 2007)
>New Revision: 19234
>
>Log:
>Make AVAHI depend on libdaemon

I think that a user will most likely not know that avahi depends on
libdaemon, so selecting libdaemon if avahi is selected sounds more
user-friendly to me. But then i don't use it, so feel free to ignore
this comment.

>
>Modified:
>   trunk/buildroot/package/avahi/Config.in
>
>
>Changeset:
>Modified: trunk/buildroot/package/avahi/Config.in
>===================================================================
>--- trunk/buildroot/package/avahi/Config.in	2007-07-23 14:43:40 UTC (rev 19233)
>+++ trunk/buildroot/package/avahi/Config.in	2007-07-23 15:00:37 UTC (rev 19234)
>@@ -1,5 +1,6 @@
> config BR2_PACKAGE_AVAHI
> 	bool "avahi"
>+	depends on BR2_PACKAGE_LIBDAEMON
> 	default n
> 	help
> 	  Avahi is a system which facilitates service
>
>_______________________________________________
>buildroot mailing list
>buildroot at uclibc.org
>http://busybox.net/mailman/listinfo/buildroot
>
