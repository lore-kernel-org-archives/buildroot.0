From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 23:27:57 +0200
Subject: [Buildroot] [PATCH v2] package/python-bluezero: new package
In-Reply-To: <20190903212422.3416-1-grzegorz@blach.pl>
References: <20190830154716.30591-1-grzegorz@blach.pl>
 <20190903212422.3416-1-grzegorz@blach.pl>
Message-ID: <20190917232757.2634846e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Grzegorz,

On Tue,  3 Sep 2019 21:24:22 +0000
Grzegorz Blach <grzegorz@blach.pl> wrote:

> Python library for Bluetooth Low Energy (BLE) on Linux.
> 
> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> ---
> Changes v1 -> v2:
>   - Removed BR2_PACKAGE_PYTHON_AIOBLESCAN from runtime dependencies
>     since this is an optional dependency (used only by observer.py
>     module).

My understanding is that this Python module talks over D-Bus to BlueZ,
and therefore it cannot work without BlueZ. Shouldn't this package then
have some dependency on BlueZ, such as a "depends on" ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
