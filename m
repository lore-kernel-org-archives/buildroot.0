From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 22:00:25 +0100
Subject: [Buildroot] [PATCH v2] package/avahi: add upstream security fix
In-Reply-To: <20190312234651.13693-1-panfilov.artyom@gmail.com>
References: <20190312234651.13693-1-panfilov.artyom@gmail.com>
Message-ID: <20190314220025.62b34ab6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 13 Mar 2019 02:46:51 +0300
Artem Panfilov <panfilov.artyom@gmail.com> wrote:

> Fixes CVE-2017-6519: avahi-daemon in Avahi through 0.6.32 and 0.7
> inadvertently responds to IPv6 unicast queries with source addresses
> that are not on-link, which allows remote attackers to cause a denial
> of service (traffic amplification) and may cause information leakage
> by obtaining potentially sensitive information from the responding
> device via port-5353 UDP packets.
> 
> Signed-off-by: Artem Panfilov <panfilov.artyom@gmail.com>
> 
> ---
> Changes v1 -> v2:
>   - add "Signed-off-by" and "Backported from" tags in patch
> ---
>  ...ast-queries-from-address-not-on-loca.patch | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/avahi/0001-Drop-legacy-unicast-queries-from-address-not-on-loca.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
