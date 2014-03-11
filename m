From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Tue, 11 Mar 2014 17:50:23 -0400
Subject: [Buildroot] [PATCH v5 1/6] libdrm: Remove xorg dependency for
 intel driver
In-Reply-To: <BLU0-SMTP20422ECD84A18D82671FAE4D9770@phx.gbl>
References: <BLU0-SMTP20422ECD84A18D82671FAE4D9770@phx.gbl>
Message-ID: <531F851F.40002@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi bernd,

On 03/11/2014 02:53 PM, Bernd Kuhls wrote:
> config BR2_PACKAGE_LIBDRM_INTEL bool "intel" - depends on
> BR2_PACKAGE_XORG7 
Remove that dependency will give a config error, so i was wrong with the
dependency on BR2_PACKAGE_XORG7 in BR2_PACKAGE_MESA3D_DRI_DRIVER_I965
because the intel dri driver depends on the libdrm that depends on the
xlib_pciaccess which is inside the xorg7 package.
