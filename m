From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 22:57:32 +0100
Subject: [Buildroot] [PATCH 3/7] sysrepo: libnetconf2 is not needed
In-Reply-To: <9ce249faace5681092cd55ca8a1a046479c66bc5.1575456104.git.jan.kundrat@cesnet.cz>
References: <cover.1575456104.git.jan.kundrat@cesnet.cz>
 <9ce249faace5681092cd55ca8a1a046479c66bc5.1575456104.git.jan.kundrat@cesnet.cz>
Message-ID: <20191208225732.1bc84033@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 4 Dec 2019 10:35:27 +0100
Jan Kundr?t <jan.kundrat@cesnet.cz> wrote:

> The libnetconf2 library is a dependency of Netopeer2. Sysrepo does not
> have a NETCONF server or a NETCONF client, so it does not use this
> library.
> 
> Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>

There was a line:

	depends on BR2_USE_MMU # libnetconf2

which no longer made sense since sysrepo no longer selects libnetconf2.
However, a look at the sysrepo code shows that it is using fork(), and
therefore I changed the line to just:

	depends on BR2_USE_MMU

I also fixed the commit title to use "package/sysrepo:" as the prefix.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
