From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 21:13:20 +0200
Subject: [Buildroot] [PATCH v5 1/3] busybox: Install scripts only when
 needed
In-Reply-To: <1436726698-17776-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1436726698-17776-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150712211320.718ae3e3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 12 Jul 2015 20:44:56 +0200, Maxime Hadjinlian wrote:
> Init scripts are only usefull with init system that supports them, it
> means that we don't want init scripts files unless Busybox or SysV has
> been chosen as the init.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Completely unneeded: those macros are already called by
BUSYBOX_INSTALL_INIT_SYSV, which guarantees it is only executed when
Busybox init or SystemV init are used.

I'll mark the patch as Rejected in patchwork.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
