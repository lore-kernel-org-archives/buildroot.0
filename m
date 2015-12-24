From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 15:03:42 +0100
Subject: [Buildroot] [PATCH v3 06/13] package/dhcp: systemd: allow
 missing environment file
In-Reply-To: <1445734779-7212-6-git-send-email-benoit.thebaudeau.dev@gmail.com>
References: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <1445734779-7212-6-git-send-email-benoit.thebaudeau.dev@gmail.com>
Message-ID: <20151224150342.39de68cd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Sun, 25 Oct 2015 02:59:32 +0200, Beno?t Th?baudeau wrote:

> diff --git a/package/dhcp/dhcpd.service b/package/dhcp/dhcpd.service
> index ad1300c..98cc54b 100644
> --- a/package/dhcp/dhcpd.service
> +++ b/package/dhcp/dhcpd.service
> @@ -7,7 +7,7 @@ Type=forking
>  PIDFile=/run/dhcpd.pid
>  ExecStart=/usr/sbin/dhcpd -q -pf /run/dhcpd.pid $OPTIONS $INTERFACES
>  KillSignal=SIGINT
> -EnvironmentFile=/etc/default/dhcpd
> +EnvironmentFile=-/etc/default/dhcpd
>  
>  [Install]
>  WantedBy=multi-user.target

A similar change had already been done in commit
21aa707a126155533748998f4fae328b1c63d1d6.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
