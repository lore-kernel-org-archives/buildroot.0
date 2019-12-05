From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Dec 2019 21:33:50 +0100
Subject: [Buildroot] [PATCH v3] package/pkg-kconfig: fix reconfigure for
 kconfig packages
In-Reply-To: <1574774698-17881-1-git-send-email-angelo@amarulasolutions.com>
References: <1574774698-17881-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20191205213350.292bf71a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 26 Nov 2019 14:24:58 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> 
> Commit 4b81badbcc0b25678ac6627548160702731cf393
> 
>     Currently, calling foo-reconfigure for a kconfig-based package will not
>     re-trigger the configuration (kconfig-wise) step for the package.
> 
> was supposed to solve this problem and lately we had
> 
> Commit 05fea6e4a60a38a797d9bacbf318a2cd7dbd435f
> 
>     infra/pkg-kconfig: do not rely on package's .config as a timestamp
> 
> that introduced the .stamp_dotconfig file.
> 
> For this reason, to trigger a kconfig package reconfigure is now
> necessary to remove the .stamp_dotconfig file.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/pkg-kconfig.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
