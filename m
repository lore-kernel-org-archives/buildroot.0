From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Nov 2013 10:05:15 +0100
Subject: [Buildroot] [PATCH] libcap-ng: disable on avr32 which lacks TLS
In-Reply-To: <1385107694-2132-1-git-send-email-s.martin49@gmail.com>
References: <1385107694-2132-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20131122100515.3743af6c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Fri, 22 Nov 2013 09:08:14 +0100, Samuel Martin wrote:
> libcap-ng needs TLS support, which is not available on avr32.
> Also, disable reverse dependencies.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/73c/73c7c211a51c312bbe4eb6a540f3ad9c92c79ebe/
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/libcap-ng/Config.in | 1 +
>  package/ofono/Config.in     | 1 +
>  2 files changed, 2 insertions(+)

See the discussion at http://patchwork.ozlabs.org/patch/288051/.

However, this patch is better in that it takes into account reverse
dependencies. But it still isn't perfect because it isn't updating
ofono comment so that it doesn't get shown on AVR32.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
