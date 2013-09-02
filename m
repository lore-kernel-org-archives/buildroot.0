From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Sep 2013 23:48:44 +0200
Subject: [Buildroot] [PATCHv2 2/4] kmod: allow to build a host variant
In-Reply-To: <87fvtn7xgj.fsf@dell.be.48ers.dk>
References: <1377624514-10510-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1377624514-10510-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <87fvtn7xgj.fsf@dell.be.48ers.dk>
Message-ID: <20130902234844.5e078d47@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Mon, 02 Sep 2013 22:58:04 +0200, Peter Korsgaard wrote:

>  Thomas> +# We only install depmod, since that's the only tool used for the
>  Thomas> +# host.
>  Thomas> +define HOST_KMOD_INSTALL_TOOLS
>  Thomas> +	mkdir -p $(HOST_DIR)/sbin/
>  Thomas> +	ln -sf ../usr/bin/kmod $(HOST_DIR)/sbin/depmod
>  Thomas> +endef
>  Thomas> +
>  Thomas> +HOST_KMOD_POST_INSTALL_HOOKS += HOST_KMOD_INSTALL_TOOLS
>  Thomas> +
> 
> We also need to set HOST_KMOD_AUTORECONF = YES because of the
> configure.ac patch (arguably we should default HOST_<pkg>_AUTORECONF =
> <pkg>_AUTORECONF).

Ah, yes, right. I didn't see the problem since the configure.ac patch
is only to support gcc < 4.6.x on the host, which wasn't my case. But
certainly useful in general indeed.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
