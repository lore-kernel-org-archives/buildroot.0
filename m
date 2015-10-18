From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 16:06:12 +0200
Subject: [Buildroot] [PATCH v2 2/2] dvblast: new package
In-Reply-To: <1445171651-28330-2-git-send-email-julian@jusst.de>
References: <1445171651-28330-1-git-send-email-julian@jusst.de>
 <1445171651-28330-2-git-send-email-julian@jusst.de>
Message-ID: <20151018160612.1bb09b23@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Julian Scheel,

On Sun, 18 Oct 2015 14:34:11 +0200, Julian Scheel wrote:
> DVBlast is a simple and powerful MPEG-2/TS demux and streaming application.
> 
> Signed-off-by: Julian Scheel <julian@jusst.de>
> ---
> Changelog v2:
> 
> Address review comments by Yann E. Morin (thanks for review!)
> - Complete license information
> - Remove explicit INSTALL_STAGING=no

You should have also removed INSTALL_TARGET = YES, because that's the
default.

> - Fix install command
> 
> The build cmd is not changed to use TARGET_CONFIGURE_OPTS as it breaks the
> build.

A working solution is to pass TARGET_CONFIGURE_OPTS in the environment
of make instead of as an option. This ensures that the CFLAGS += in the
dvblast Makefile are still taken into account.

So, I've applied you patch, with the following changes:

    [Thomas:
     - add missing hash file.
     - rewrap Config.in help text
     - remove unneeded "DVBLAST_INSTALL_TARGET = YES", since this is the
       default behavior
     - pass TARGET_MAKE_ENV in the environment when calling make.
     - use TARGET_CONFIGURE_OPTS instead of just CC/LD.]

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
