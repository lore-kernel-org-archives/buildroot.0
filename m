From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 18:04:11 +0200
Subject: [Buildroot] [PATCH 0/1] Add postgres server/client options
In-Reply-To: <1445179920-2413-1-git-send-email-mathstuf@gmail.com>
References: <1445179920-2413-1-git-send-email-mathstuf@gmail.com>
Message-ID: <20151018180411.7e5725fa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ben,

On Sun, 18 Oct 2015 10:51:59 -0400, Ben Boeckel wrote:
> Currently it is possible to turn on postgres and have both client and server
> off. Making it an either/or seemed like too much of a break for those wanting
> both, but I'm unsure of how to enforce at-least-one-of a set not available
> until the postgres package is enabled.

You can do:

	select BR2_PACKAGE_POSTGRESQL_CLIENT if !BR2_PACKAGE_POSTGRESQL_SERVER

This does not scale well if you have a lot of choices, but since there
is only a choice between two possibilities here, it's quite reasonable
to do that.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
