From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Apr 2015 22:41:24 +0200
Subject: [Buildroot] [PATCH] package/openvmtools: bump version to 9.10.0
In-Reply-To: <1427648360-122766-1-git-send-email-kaszak@gmail.com>
References: <1427648360-122766-1-git-send-email-kaszak@gmail.com>
Message-ID: <20150407224124.3e0adaa6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Karoly Kasza,

On Sun, 29 Mar 2015 18:59:20 +0200, Karoly Kasza wrote:
> 
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>

Thanks, I've applied your patch, with only some minor changes, see
below.

> +# If found openssl, build openvmtools with support for it

Such a comment is not really needed in this case, since it's quite
obvious what is happening.

> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +OPENVMTOOLS_DEPENDENCIES += openssl

I've added --with-ssl in OPENVMTOOLS_CONF_OPTS here, to be explicit,
like is done for procps for example.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
