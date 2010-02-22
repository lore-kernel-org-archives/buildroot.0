From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Feb 2010 20:21:10 +0100
Subject: [Buildroot] [PATCH 11/16] package infrastructure: add
 LD_LIBRARY_PATH
In-Reply-To: <87ocjhi7md.fsf@macbook.be.48ers.dk>
References: <cover.1266691382.git.thomas.petazzoni@free-electrons.com>
	<cover.1266691382.git.thomas.petazzoni@free-electrons.com>
	<14420c94fda9f27c457b671f0da2a278cba23ac6.1266691382.git.thomas.petazzoni@free-electrons.com>
	<87ocjhi7md.fsf@macbook.be.48ers.dk>
Message-ID: <20100222202110.4880af25@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Feb 2010 16:59:38 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  Thomas> -TARGET_MAKE_ENV=PATH=$(TARGET_PATH)
>  Thomas> +# During the compilation of target packages, host tools might be used,
>  Thomas> +# and in turn, they might use host libraries installed in
>  Thomas> +# $(HOST_DIR)/usr/lib
>  Thomas> +TARGET_MAKE_ENV=PATH=$(TARGET_PATH) \
>  Thomas> +		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib"
> 
> We should probably append to LD_LIBRARY_PATH in case it is set already.

Sure, you're right.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
