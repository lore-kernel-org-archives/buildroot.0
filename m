From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 12 Jul 2007 16:42:44 +0200
Subject: [Buildroot] svn commit: trunk/buildroot: package
	package/busybox project target/ etc...
In-Reply-To: <20070712131106.1E690A4757@busybox.net>
References: <20070712131106.1E690A4757@busybox.net>
Message-ID: <20070712144244.GB21387@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 12, 2007 at 06:11:06AM -0700, ulf at uclibc.org wrote:
>Author: ulf
>Date: 2007-07-12 06:11:03 -0700 (Thu, 12 Jul 2007)
>New Revision: 19070

>Modified: trunk/buildroot/Makefile
>===================================================================
>--- trunk/buildroot/Makefile	2007-07-12 00:59:00 UTC (rev 19069)
>+++ trunk/buildroot/Makefile	2007-07-12 13:11:03 UTC (rev 19070)
>@@ -155,6 +155,12 @@
> else
> TARGETS:=uclibc
> endif
>+
>+PROJECT:=$(strip $(subst ",, $(BR2_PROJECT)))
>+HOSTNAME:=$(strip $(subst ",, $(BR2_HOSTNAME)))
>+BANNER:=$(strip $(subst ",, $(BR2_BANNER)))

This breaks vi's syntax highlighing, please fix
Also, you're aware that HOSTNAME previously was set to the hostname of
the build host and you just broke this, aren't you?

>Added: trunk/buildroot/project/Config.in
>===================================================================
>--- trunk/buildroot/project/Config.in	                        (rev 0)
>+++ trunk/buildroot/project/Config.in	2007-07-12 13:11:03 UTC (rev 19070)
>@@ -0,0 +1,26 @@
>+menu "Project Options"
>+
>+config BR2_PROJECT
>+	string "Project name"
>+	default "uclibc"
>+	help
>+	  The project name is used to define subdirectories
>+	  * where the Board Support Packages are built
>+	    (Linux,Root fs Bootmonitor,Utilities etc.)

whitespace dammaged CSVs

Please add inline documentation to PROJECT_BUILD_DIR and BUILD_DIR
