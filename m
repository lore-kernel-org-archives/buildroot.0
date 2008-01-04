From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 4 Jan 2008 21:14:19 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/mpfr
In-Reply-To: <20080104200732.1314212011C@busybox.net>
References: <20080104200732.1314212011C@busybox.net>
Message-ID: <20080104201419.GA25608@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 04, 2008 at 12:07:32PM -0800, prpplague at uclibc.org wrote:
>Author: prpplague
>Date: 2008-01-04 12:07:31 -0800 (Fri, 04 Jan 2008)
>New Revision: 20708
>
>Log:
>change download url to be dynamic basic on version number
>
>Modified:
>   trunk/buildroot/package/mpfr/mpfr.mk
>
>
>Changeset:
>Modified: trunk/buildroot/package/mpfr/mpfr.mk
>===================================================================
>--- trunk/buildroot/package/mpfr/mpfr.mk	2008-01-04 15:28:28 UTC (rev 20707)
>+++ trunk/buildroot/package/mpfr/mpfr.mk	2008-01-04 20:07:31 UTC (rev 20708)
>@@ -8,7 +8,7 @@
> MPFR_PATCH_FILE:=mpfr-$(MPFR_VERSION).patch
> MPFR_SOURCE:=mpfr-$(MPFR_VERSION).tar.bz2
> MPFR_CAT:=$(BZCAT)
>-MPFR_SITE:=http://www.mpfr.org/mpfr-current/
>+MPFR_SITE:=http://www.mpfr.org/mpfr-$(MPFR_VERSION)/

The reasoning behind using -current is that we (or at least i) want to
use the current, stable version and not a stale one. You now lost
automagic notification (via check-source (sp?)) for updates..
