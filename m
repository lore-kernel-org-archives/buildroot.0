From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 22:40:20 +0200
Subject: [Buildroot] [PATCH 1/3] gdb: get rid of host-texinfo dependency
In-Reply-To: <1475870958-14790-1-git-send-email-patrickdepinguin@gmail.com>
References: <1475870958-14790-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20161007224020.251bd375@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  7 Oct 2016 22:09:16 +0200, Thomas De Schampheleire wrote:
> +# Disable building documentation
> +GDB_MAKE_OPTS += MAKEINFO=true
> +GDB_INSTALL_OPTS += MAKEINFO=true

Setting GDB_INSTALL_OPTS doesn't do anything. There is no such variable
offered by the package infra: for target packages, you have
GDB_INSTALL_TARGET_OPTS and GDB_INSTALL_STAGING_OPTS.

So if it works without this, maybe it means that it is useless?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
