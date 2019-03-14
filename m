From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 22:03:55 +0100
Subject: [Buildroot] [PATCH] package/libpcap: disable dbus to break
 circular dependency
In-Reply-To: <87d1255df9dbfe03c8503a1fdb74bb2385675351.1552156094.git.baruch@tkos.co.il>
References: <87d1255df9dbfe03c8503a1fdb74bb2385675351.1552156094.git.baruch@tkos.co.il>
Message-ID: <20190314220355.33ac04f1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  9 Mar 2019 20:28:14 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> The optional dbus dependency of libpcap creates a circular dependency
> chain:
> 
> $ make libpcap-show-recursive-depends
> 
> Recursion detected for  : systemd
> which is a dependency of: dbus
> which is a dependency of: libpcap
> which is a dependency of: iptables
> which is a dependency of: systemd
> make: *** [package/libpcap/libpcap.mk:55: libpcap-show-recursive-depends] Error 1
> 
> Of all these dependencies the one of libpcap on dbus seems to be less
> useful. Drop it.
> 
> Fixes:
> http://autobuild.buildroot.net/results/0b5d18bff816cbcee11e8645449701722d956de5/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libpcap/libpcap.mk | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
