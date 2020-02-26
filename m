From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 22:26:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/connman: bump to 1.38
In-Reply-To: <20200219231616.19489-1-petr.vorel@gmail.com>
References: <20200219231616.19489-1-petr.vorel@gmail.com>
Message-ID: <20200226222626.2e7ca69f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Petr,

On Thu, 20 Feb 2020 00:16:16 +0100
Petr Vorel <petr.vorel@gmail.com> wrote:

> This release requires libmnl (WireGuard dependency).
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

My reading of configure.ac is that it doesn't require libmnl. It only
needs it if WireGuard support is enabled:

found_libmnl="no"
if (test "${firewall_type}" = "nftables" -o \
                "${enable_wireguard}" != "no"); then
        PKG_CHECK_MODULES(LIBMNL, [libmnl >= 1.0.0], [found_libmnl="yes"],
                AC_MSG_ERROR([libmnl >= 1.0.0 not found]))
        AC_SUBST(LIBMNL_CFLAGS)
        AC_SUBST(LIBMNL_LIBS)
fi
AM_CONDITIONAL(LIBMNL, test "${found_libmnl}" != "no")

The connman package probably needs to be extended to support either
iptables or nftables as firewall types, and other options to
enable/disable wireguard support.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
