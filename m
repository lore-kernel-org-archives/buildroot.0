From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 14:18:38 +0100
Subject: [Buildroot] [PATCH v2] package/pkg-kconfig: fix reconfigure for
 kconfig packages
In-Reply-To: <1574771063-29218-1-git-send-email-angelo@amarulasolutions.com>
References: <1574771063-29218-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20191126141838.74d804f8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 26 Nov 2019 13:24:23 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> 
> Commit 4b81badbcc0b25678ac6627548160702731cf393
> 
>     Currently, calling foo-reconfigure for a kconfig-based package will not
>     re-trigger the configuration (kconfig-wise) step for the package.
> 
> already solved this problem, but it was lately regressed by
> 
> Commit 05fea6e4a60a38a797d9bacbf318a2cd7dbd435f

Are you sure it was regressed ? When I read the code at commit
4b81badbcc0b25678ac6627548160702731cf393, I don't see even back then
how linux-reconfigure would trigger a complete reconfiguration. Have
you actually verified that it was working as expected back at commit
4b81badbcc0b25678ac6627548160702731cf393 ? Indeed, at commit
4b81badbcc0b25678ac6627548160702731cf393, we were already only removing
the stamp_kconfig_fixup_done stamp file, so my understanding is rather
that commit 4b81badbcc0b25678ac6627548160702731cf393 doesn't implement
what the commit log says.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
