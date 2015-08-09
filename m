From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Aug 2015 17:17:01 +0200
Subject: [Buildroot] [PATCH] toolchain/external: better check for gcc-5
In-Reply-To: <1439118702-5376-1-git-send-email-yann.morin.1998@free.fr>
References: <1439118702-5376-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150809171701.331c2ed5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  9 Aug 2015 13:11:42 +0200, Yann E. MORIN wrote:
> gcc will always report a three-digit version sting, like 4.9.3 or 5.1.0.
> 
> For gcc before 5, we want to check the first two digits, while starting
> with gcc 5, we are only concerned about the first digit.
> 
> So, change our matching code to test for the leading part of the version
> string, up to the first dot after as-many version digit we're interested
> in.
> 
> Note: we're adding the dot in the .mk code rather than in the Kconfig
> symbol, because it seemed cleaner to do so.
> 
> Reported-by: J?rg Krause <joerg.krause@embedded.rocks>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/helpers.mk | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
