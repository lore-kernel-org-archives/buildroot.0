From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Feb 2020 23:23:03 +0100
Subject: [Buildroot] [PATCH] Config.in: add BR2_HOST_GCC_AT_LEAST_9
In-Reply-To: <20200225212213.22680-1-romain.naour@smile.fr>
References: <20200225212213.22680-1-romain.naour@smile.fr>
Message-ID: <20200225232303.1cad5408@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 25 Feb 2020 22:22:13 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> Fedora 30 switched to GCC 9.x. [1]
> 
> [1] https://fedoraproject.org/wiki/Changes/GCC9
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Thanks, but this was not sufficiently tested it seems: on my Fedora
system with gcc 9.x, BR2_HOST_GCC_VERSION was still 8, and therefore
BR2_HOST_GCC_AT_LEAST_9 was not "y". This is because the main Buildroot
Makefile HOSTCC_MAX_VERSION variable needs to be updated as well.

I fixed that up and applied to master. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
