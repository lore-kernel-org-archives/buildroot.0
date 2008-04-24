From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 24 Apr 2008 23:23:33 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/ng-spice-rework
In-Reply-To: <20080424165217.4167C3C7E4@busybox.net>
References: <20080424165217.4167C3C7E4@busybox.net>
Message-ID: <20080424212333.GF10167@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 24, 2008 at 09:52:17AM -0700, ninevoltz at uclibc.org wrote:
>Author: ninevoltz
>Date: 2008-04-24 09:52:16 -0700 (Thu, 24 Apr 2008)
>New Revision: 21846
>
>Log:
>make ng-spice use the proper header directory
>
>Modified:
>   trunk/buildroot/package/ng-spice-rework/ng-spice-rework.mk
>
>
>Changeset:
>Modified: trunk/buildroot/package/ng-spice-rework/ng-spice-rework.mk
>===================================================================
>--- trunk/buildroot/package/ng-spice-rework/ng-spice-rework.mk	2008-04-24 16:48:20 UTC (rev 21845)
>+++ trunk/buildroot/package/ng-spice-rework/ng-spice-rework.mk	2008-04-24 16:52:16 UTC (rev 21846)
>@@ -11,6 +11,8 @@
> NG_SPICE_REWORK_INSTALL_TARGET = YES
> NG_SPICE_REWORK_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
> 
>+NG_SPICE_REWORK_CONF_OPT = CFLAGS="-I$(STAGING_DIR)/usr/include"
>+
> NG-SPICE-REWORK_DEPENDENCIES = uclibc 

Back then, every package that was not toolchain-related depended on
uClibc by definition (at least it does in buildroot3), so this is
redundant.
