From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Sep 2014 11:18:26 +0200
Subject: [Buildroot] [PATCH v6] bcache-tools: Adding package.
In-Reply-To: <20140907091406.GA4230@free.fr>
References: <1407514262-18602-1-git-send-email-jcd@tribudubois.net>
 <20140906104208.GA3957@free.fr> <540C076B.30901@tribudubois.net>
 <20140907091406.GA4230@free.fr>
Message-ID: <20140907091826.GA31418@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jean-Christophe, All,

On 2014-09-07 11:14 +0200, Yann E. MORIN spake thusly:
> On 2014-09-07 09:21 +0200, Jean-Christophe DUBOIS spake thusly:
> > Le 09/06/2014 12:42 PM, Yann E. MORIN a ?crit :
> [--SNIP--]
> > >>diff --git a/package/bcache-tools/bcache-tools.mk b/package/bcache-tools/bcache-tools.mk
> > >>new file mode 100644
> > >>index 0000000..880bf5e
> > >>--- /dev/null
> > >>+++ b/package/bcache-tools/bcache-tools.mk
> > >>@@ -0,0 +1,31 @@
> > >>+################################################################################
> > >>+#
> > >>+# bcache-tools
> > >>+#
> > >>+################################################################################
> > >>+
> > >>+BCACHE_TOOLS_VERSION = v1.0.7
> > >>+BCACHE_TOOLS_SITE = $(call github,g2p,bcache-tools,$(BCACHE_TOOLS_VERSION))
> > >>+BCACHE_TOOLS_LICENSE = GPLv2
> > >>+BCACHE_TOOLS_LICENSE_FILES = COPYING
> > >>+BCACHE_TOOLS_DEPENDENCIES = host-pkgconf util-linux eudev
> > >... so you do not need to depend on it here, just in the Config.in file.
> > 
> > Well, I need to make sure that "udev" is build before bcache-tools because
> > it tries to put files in the /lib/udev/ directory of the target file system
> > ans this directory doesn't exist before the udev package is built.
> 
> In this case, just add:
> 
>     # bcache-tools forgets to create the required directory... :-/
>     define BCACHE_TOOLS_UDEV_DIR
>         mkdir -p $(TARGET_DIR)/lib/udev/
>     endef
>     BCACHE_TOOLS_PRE_INSTALL_TARGET_HOOKS += BCACHE_TOOLS_UDEV_DIR
> 
> And you're done. ;-)

Of course, since cafeine hasn't yet fully kicked-in in my body, this
can/should be squashed in the existing PRE_INSTALL hook which creates
the man8 directory.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
