From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Apr 2018 08:53:27 +0200
Subject: [Buildroot] [PATCH] usb_modeswitch: set CXX to false when C++
 is missing
In-Reply-To: <9c1fc72919be11ec00af92b2c0ba452d23f32144.1523937628.git.baruch@tkos.co.il>
References: <9c1fc72919be11ec00af92b2c0ba452d23f32144.1523937628.git.baruch@tkos.co.il>
Message-ID: <20180417085327.3da9c6bb@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Apr 2018 07:00:28 +0300, Baruch Siach wrote:
> Similar to the openocd fix in commit 5966e2dc54 (package/openocd: fix
> fallout after no-C++ fixups) the jimctl that is bundled with
> usb_modeswitch also wants to find a binary. This broke with commit
> 4cd1ab158 (core: alternate solution to disable C++). Revert to 'false'
> instead of 'no' here as well.
> 
> Fixes:
> http://autobuild.buildroot.net/results/b4d/b4d4e925763cb6558af915f9781afe07fc557ebc/
> http://autobuild.buildroot.net/results/61b/61b9dc2148df2e8fd0b30e62aedbfd30bb755e19/
> http://autobuild.buildroot.net/results/468/468a7e6b049f159fbb4e79d3a12b53ca890f6933/
> 
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> This fix is also applicable to the 2018.02.x branch.
> ---
>  package/usb_modeswitch/usb_modeswitch.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
