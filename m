From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 May 2018 09:13:12 +0200
Subject: [Buildroot] [PATCH 3/4] Makefile: check rootfs overlays with
 BR2_ROOTFS_MERGED_USR enabled
In-Reply-To: <20180506213116.25084-4-casantos@datacom.ind.br>
References: <20180506213116.25084-1-casantos@datacom.ind.br>
 <20180506213116.25084-4-casantos@datacom.ind.br>
Message-ID: <20180507091312.4848b555@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  6 May 2018 18:31:15 -0300, Carlos Santos wrote:

> Fix the problem by adding a step in target-finalize that checks each
> overlay, using the same criteria used in skeleton-custom.mk.
> 
> Add a paragraph to the documentation clarifying that rootfs overlays
> should not contain /bin, /lib or /sbin.

Same comment here: I'm sure plenty of people want to add some stuff to
their filesystem (scripts, etc.) that might need to be in /bin or /sbin
(/lib is less likely).

So I'm not a big fan of this additional constraint, just like I said
for the skeleton case.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
