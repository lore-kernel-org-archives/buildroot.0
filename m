From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 May 2018 21:27:14 +0200
Subject: [Buildroot] [PATCH] bluez-alsa: needs NPTL
In-Reply-To: <8188b2c1ff0529d1b30581a7d7403ad344615dcd.1525192203.git.baruch@tkos.co.il>
References: <8188b2c1ff0529d1b30581a7d7403ad344615dcd.1525192203.git.baruch@tkos.co.il>
Message-ID: <20180501212714.6416e20b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 May 2018 19:30:03 +0300, Baruch Siach wrote:
> bluez-alsa calls pthread_setname_np() which is only provided by the NPTL
> pthread implementation.
> 
> Fixes:
> http://autobuild.buildroot.net/results/707/707fd46921b1cfda90e9c30be33ca918f2d0cb00/
> http://autobuild.buildroot.net/results/7a6/7a632c2b6b9021aa6edcd5126400de26e2b8ca42/
> 
> Cc: J?rg Krause <joerg.krause@embedded.rocks>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/bluez-alsa/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
