From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Wed, 12 Mar 2014 06:09:23 +0100
Subject: [Buildroot] [PATCH v5 1/6] libdrm: Remove xorg dependency for
	intel driver
References: <BLU0-SMTP20422ECD84A18D82671FAE4D9770@phx.gbl>
 <531F851F.40002@savoirfairelinux.com>
Message-ID: <3p65vaxf8m.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sebastien Bourdelin <sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/
@public.gmane.org> wrote in news:531F851F.40002 at savoirfairelinux.com:

> Hi bernd,
> 
> On 03/11/2014 02:53 PM, Bernd Kuhls wrote:
>> config BR2_PACKAGE_LIBDRM_INTEL bool "intel" - depends on
>> BR2_PACKAGE_XORG7 
> Remove that dependency will give a config error, so i was wrong with the
> dependency on BR2_PACKAGE_XORG7 in BR2_PACKAGE_MESA3D_DRI_DRIVER_I965
> because the intel dri driver depends on the libdrm that depends on the
> xlib_pciaccess which is inside the xorg7 package.
> 

Hi,

xlib_pciaccess itself does not depend on xorg stuff, I was able to compile 
the libdrm intel driver with patch v5 without activating xorg7.

Regards, Bernd
