From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 23:31:18 +0200
Subject: [Buildroot] [PATCH] package/usbguard: enforce the right
 permissions on the configuration file
In-Reply-To: <20210618094710.2248743-1-miquel.raynal@bootlin.com>
References: <20210618094710.2248743-1-miquel.raynal@bootlin.com>
Message-ID: <20210718233118.541401f5@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 18 Jun 2021 11:47:10 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Only 0600 rights are allowed for the rules.conf. This file is read when the
> usbguard daemon starts and will prevent it to run otherwise.
> 
> As Git only tracks the executable bit, setting the right permissions in the
> package makefile is the cleanest solution, in particular when providing this
> file from a rootfs overlay.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  package/usbguard/usbguard.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
