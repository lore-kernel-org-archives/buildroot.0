From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 16:08:08 +0100
Subject: [Buildroot] [PATCH v6 5/6] package/polkit: add init service file
In-Reply-To: <20191206234649.3972927-5-aduskett@gmail.com>
References: <20191206234649.3972927-1-aduskett@gmail.com>
 <20191206234649.3972927-5-aduskett@gmail.com>
Message-ID: <20191208160808.7fcc27ec@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Carlos in Cc for the review of the init script.

On Fri,  6 Dec 2019 15:46:48 -0800
aduskett at gmail.com wrote:

> diff --git a/package/polkit/S50polkit b/package/polkit/S50polkit
> new file mode 100644
> index 0000000000..55c10e99ae
> --- /dev/null
> +++ b/package/polkit/S50polkit
> @@ -0,0 +1,15 @@
> +#!/bin/sh
> +#
> +# start polkitd
> +#
> +
> +case "$1" in
> +	start)
> +		start-stop-daemon -q -S -x /usr/lib/polkit-1/polkitd -- --no-debug &

Why is the & necessary at this end ?

I think this init script deserves a comment that explains why it
doesn't follow the traditional pattern for init scripts.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
