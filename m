From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 16:51:47 +0200
Subject: [Buildroot] [[PATCH v2 01/14] package/mender: fix install path
 for identity and inventory scripts
In-Reply-To: <20180820130914.22377-2-mirza.krak@northern.tech>
References: <20180820130914.22377-1-mirza.krak@northern.tech>
 <20180820130914.22377-2-mirza.krak@northern.tech>
Message-ID: <20180820165147.77137a9a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 15:09:01 +0200, Mirza Krak wrote:
> These scripts are used to generate the device identity and to populate
> the the device inventory. The Mender client will call these and at least
> the mender-device-identity is required to be present at the correct
> location. Inventory scripts are there as an example and not
> actually required.
> 
> Example output from identity script:
> 
>     $ ./mender-device-identity
>     mac=de:ad:ca:fe:00:01
>     cpuid=1112233
> 
> Example output from inventory script:
> 
>     $ ./mender-inventory-network
>     mac_br-fbfdad18c33c=02:42:7e:74:96:85
>     network_interfaces=br-fbfdad18c33c
>     ipv4_br-fbfdad18c33c=172.21.0.1/16
>     mac_enp0s25=de:ad:be:ef:bb:05
>     network_interfaces=enp0s25
>     ipv4_enp0s25=123.22.0.197/16
>     ipv4_enp0s25=10.20.20.105/16
>     ipv6_enp0s25=fe80::2aad:beff:feef:bb05/64
> 
> Inventory and device identity data is presented on the Mender server
> front-end.
> 
> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
> ---
>  package/mender/mender.mk | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
