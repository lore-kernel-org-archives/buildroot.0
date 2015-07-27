From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 23:46:23 +0200
Subject: [Buildroot] [PATCH 2/2] rpcbind: add systemd support
In-Reply-To: <1437339759-21456-2-git-send-email-aurelien@chabot.fr>
References: <1437339759-21456-1-git-send-email-aurelien@chabot.fr>
 <1437339759-21456-2-git-send-email-aurelien@chabot.fr>
Message-ID: <20150727234623.0b523f36@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Aur?lien Chabot,

On Sun, 19 Jul 2015 23:02:39 +0200, Aur?lien Chabot wrote:
> Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>
> ---
>  package/rpcbind/rpcbind.mk      | 18 +++++++++++++++++-
>  package/rpcbind/rpcbind.service | 10 ++++++++++
>  package/rpcbind/rpcbind.socket  |  8 ++++++++
>  3 files changed, 35 insertions(+), 1 deletion(-)
>  create mode 100644 package/rpcbind/rpcbind.service
>  create mode 100644 package/rpcbind/rpcbind.socket

I've applied after:

    [Thomas:
     - fix indentation
     - indicate source of systemd files.]

The indentation was wrong on:

+ifeq ($(BR2_INIT_SYSTEMD),y)
+	RPCBIND_CONF_OPTS += --with-systemdsystemunitdir=/usr/lib/systemd/system
+else
+	RPCBIND_CONF_OPTS += --with-systemdsystemunitdir=no
+endif

The RPCBIND_CONF_OPTS lines should not be indented. That's just a pure
Buildroot convention, of course.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
