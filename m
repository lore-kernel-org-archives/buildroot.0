From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Mar 2019 21:56:04 +0100
Subject: [Buildroot] [PATCH v2] package/libpcap: fix bluez circular
 dependency
In-Reply-To: <45321e8446f7e16a4c1d5f4a9b827c5d2e75bdc3.1552849786.git.baruch@tkos.co.il>
References: <45321e8446f7e16a4c1d5f4a9b827c5d2e75bdc3.1552849786.git.baruch@tkos.co.il>
Message-ID: <20190318215604.117a03e0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Mar 2019 21:09:46 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> The optional bluez_utils dependency of libpcap creates a circular
> dependency:
> 
> $ make dbus-show-recursive-depends
> 
> Recursion detected for  : systemd
> which is a dependency of: dbus
> which is a dependency of: bluez_utils
> which is a dependency of: libpcap
> which is a dependency of: iptables
> which is a dependency of: systemd
> make: *** [package/dbus/dbus.mk:121: dbus-show-recursive-depends] Error 1
> 
> Drop support for bluez_utils. For bluez5_utils, which also depends on
> dbus, we only need the headers in the bluez5_utils-headers package. Use
> that to break the circular dependency.
> 
> Fixes:
> http://autobuild.buildroot.net/results/9c3/9c3ee798fa6bb501a20a7892c0b085d2b279b664/
> 
> Suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2: keep bluez5_utils, and use bluez5_utils-headers (Yann)
> ---
>  package/libpcap/libpcap.mk | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
