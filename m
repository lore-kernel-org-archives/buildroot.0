From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Oct 2012 00:52:46 +0200
Subject: [Buildroot] [PATCHv6 5/5] iw: pkg-config cleanup
In-Reply-To: <1350956875-1726-5-git-send-email-gustavo@zacarias.com.ar>
References: <1350956875-1726-1-git-send-email-gustavo@zacarias.com.ar>
 <1350956875-1726-5-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20121025005246.32170c83@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 22 Oct 2012 22:47:55 -0300, Gustavo Zacarias wrote:
> We no longer need to specify PKG_CONFIG_PATH since it's handled by the
> host-pkgconf wrapper.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

but a followup patch might be useful:

> -IW_MAKE_ENV = PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
> -	PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
> +IW_MAKE_ENV = PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
>  	GIT_DIR=$(IW_DIR)

I think the PKG_CONFIG variable can be removed as well. All packages
are being compiled with TARGET_MAKE_ENV, which includes
PATH=$(TARGET_PATH), which ensures that $(HOST_DIR)/usr/bin is in the
PATH before all other directories in your PATH. So 'iw' should
automatically pick up the right pkg-config without having to specify
this PKG_CONFIG variable.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
