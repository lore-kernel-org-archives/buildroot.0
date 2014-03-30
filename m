From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sun, 30 Mar 2014 15:37:33 +0200
Subject: [Buildroot] [PATCH 1/1 v2] xdriver_xf86-video-intel: Bump
	version to 2.99.911
References: <1396178545-12912-1-git-send-email-bernd.kuhls@t-online.de>
 <20140330151109.658eb835@skate>
Message-ID: <t9jl0bxj2h.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20140330151109.658eb835 at skate: 

> Do we want KMS vs. UMS to be a configurable option?

this is not necessary because the driver can have both options compiled, 
therefore I removed the kms/ums-related options.

> Then in the Config.in file, if BR2_PACKAGE_MESA3D_DRI_DRIVER_I965 is
> enabled, you want to select MESA3D.

+       select BR2_PACKAGE_MESA3D if BR2_PACKAGE_MESA3D_DRI_DRIVER_I965

leads to

package/mesa3d/Config.in:1:error: recursive dependency detected!
package/mesa3d/Config.in:1:     symbol BR2_PACKAGE_MESA3D is selected by BR2
_PACKAGE_MESA3D_DRI_DRIVER_I965
package/mesa3d/Config.in:70:    symbol BR2_PACKAGE_MESA3D_DRI_DRIVER_I965 
depends on BR2_PACKAGE_MESA3D

Regards, Bernd
