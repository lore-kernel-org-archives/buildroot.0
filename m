From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 23:11:01 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/network-manager: add patches
 to build with kernel headers 3.2
In-Reply-To: <1434969830-31251-1-git-send-email-vorel@jablocom.com>
References: <1434969830-31251-1-git-send-email-vorel@jablocom.com>
Message-ID: <20150630231101.4cb57808@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Petr Vorel,

On Mon, 22 Jun 2015 12:43:50 +0200, Petr Vorel wrote:
> From: Petr Vorel <petr.vorel@gmail.com>
> 
> + lower kernel headers dependency
> 
> According to upstream [1], there is no known minimal kernel-version, nor
> minimal required feature-set.
> 
> Experimentally tested, that 1.0.2 is works with 3.2 kernel headers, even
> some features will be missing [2].
> 
> [1] https://mail.gnome.org/archives/networkmanager-list/2015-April/msg00039.html
> [2] https://mail.gnome.org/archives/networkmanager-list/2015-April/msg00041.html
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Changes v3:
>  - Lower kernel headers dependency to 3.2
>  - Preserved original author of
>    0002-systemd-dhcp-fix-build-with-Linux-3.2.0-headers.patch
>  - Added Signed-off-by inside both patches.
> Changes v2: rewrited patch 0002-systemd-dhcp-fix-build-with-Linux-3.2.0-headers.patch
> ---
>  ...anager-fix-build-with-Linux-3.2.0-headers.patch | 30 ++++++++++++++++++
>  ...d-dhcp-fix-build-with-Linux-3.2.0-headers.patch | 37 ++++++++++++++++++++++
>  package/network-manager/Config.in                  |  2 +-
>  3 files changed, 68 insertions(+), 1 deletion(-)
>  create mode 100644 package/network-manager/0001-ppp-manager-fix-build-with-Linux-3.2.0-headers.patch
>  create mode 100644 package/network-manager/0002-systemd-dhcp-fix-build-with-Linux-3.2.0-headers.patch

Applied after adding a comment in Config.in saying that it may work with
older kernel headers than 3.2, as suggested by Arnout.

Of course, when upstream makes a new release with those patches
integrated, it would be good if you could send a new Buildroot patch to
use this new upstream release.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
