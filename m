From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Mar 2015 17:36:58 +0100
Subject: [Buildroot] [PATCH v2 2/2] wine: Add gettext dependency check
 for host-wine
In-Reply-To: <54FB2609.6020305@dawncrow.de>
References: <54FB2609.6020305@dawncrow.de>
Message-ID: <20150307173658.7947562a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Hentschel,

On Sat, 07 Mar 2015 17:23:37 +0100, Andr? Hentschel wrote:

> +ifeq ($(BR2_PACKAGE_GETTEXT),y)

This indicates that gettext is going to be built for the target.

> +HOST_WINE_CONF_OPTS += --with-gettext --with-gettextpo

This changes the configuration of a host package.

Conclusion: this doesn't make sense, unless a better explanation is
provided to explain why such a weird thing is needed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
