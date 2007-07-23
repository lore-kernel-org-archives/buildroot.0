From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 23 Jul 2007 23:13:58 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <20070723190427.1D9BFA6868@busybox.net>
References: <20070723190427.1D9BFA6868@busybox.net>
Message-ID: <20070723211358.GE4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 23, 2007 at 12:04:27PM -0700, ulf at uclibc.org wrote:
>Author: ulf
>Date: 2007-07-23 12:04:27 -0700 (Mon, 23 Jul 2007)
>New Revision: 19238
>
>Log:
>Add configuration option allowing hiding packages needing WCHAR
>
>Modified:
>   trunk/buildroot/Config.in
>
>
>Changeset:
>Modified: trunk/buildroot/Config.in
>===================================================================
>--- trunk/buildroot/Config.in	2007-07-23 18:49:16 UTC (rev 19237)
>+++ trunk/buildroot/Config.in	2007-07-23 19:04:27 UTC (rev 19238)
>@@ -687,6 +687,12 @@
> 	help
> 	  This option hides outdated/obsolete versions of packages.
> 
>+config BR2_USE_WCHAR
>+	bool "Show packages that are require WCHAR support"

"that are require" == -ENOPARSE

bool "wchar support"
	default n if !BR2_LOCALE_OR_HOWEVER_IT_IS_CALLED
	default y if BR2_LOCALE_OR_HOWEVER_IT_IS_CALLED
	help
	  Enable wchar support. If selected, packages which cannot be
	  built without wchar support are hidden.

There are a couple of packages which just need minor fixups to work
properly without wchar support (I think that i added a patch for one
package recently, don't remember which one that was, though).

Also, this one depends on locale support, IIRC (i.e. is selected by
locale).

cheers,
>+	default y
>+	help
>+	  This option hides packages which cannot be built without WCHAR.
>+
> config BR2_PREFER_STATIC_LIB
> 	bool "prefer static libraries"
> 	default n
