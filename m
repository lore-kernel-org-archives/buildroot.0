From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 22:52:27 +0100
Subject: [Buildroot] [PATCH v3 2/4] skeleton: use
 BR2_SYSTEM_DEFAULT_PATH as default PATH
In-Reply-To: <20181220175814.2195-2-mmayer@broadcom.com>
References: <20181220175508.2091-1-mmayer@broadcom.com>
 <20181220175814.2195-1-mmayer@broadcom.com>
 <20181220175814.2195-2-mmayer@broadcom.com>
Message-ID: <20181230225227.7abf943c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Dec 2018 09:58:12 -0800, Markus Mayer wrote:
> We substitute the path specified in system/skeleton/etc/profile with
> the path specified in the configuration variable
> $(BR2_SYSTEM_DEFAULT_PATH).
> 
> $(BR2_SYSTEM_DEFAULT_PATH) is a Kconfig string. So it is already
> quoted, which is exactly what we want.

I am curious about this sentence: why is it "exactly what we want" ?

> diff --git a/system/skeleton/etc/profile b/system/skeleton/etc/profile
> index 1255d23ff40d..db29e44920e8 100644
> --- a/system/skeleton/etc/profile
> +++ b/system/skeleton/etc/profile
> @@ -1,4 +1,4 @@
> -export PATH=/bin:/sbin:/usr/bin:/usr/sbin
> +export PATH=@PATH@

Indeed, the variable assignment was not double quoted before, and now
it becomes double quoted:

export PATH="/bin:/sbin:/usr/bin:/usr/sbin"

is what I have in the resulting /etc/profile.

So does "exactly what we want" means "preserves the existing behavior"
or means "is better than the existing behavior" for some reason ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
