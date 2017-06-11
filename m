From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 11 Jun 2017 23:18:45 +0200
Subject: [Buildroot] [PATCH 04/14] package/minetest: new package
In-Reply-To: <1pb01exniq.ln2@ID-313208.user.individual.net>
References: <20170411222643.9770-1-romain.naour@gmail.com>
 <20170411222643.9770-4-romain.naour@gmail.com>
 <1pb01exniq.ln2@ID-313208.user.individual.net>
Message-ID: <556194f7-e699-7e68-75b2-8563f76b38ac@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

Le 11/06/2017 ? 19:38, Bernd Kuhls a ?crit :
> Hi Romain,
> 
> Am Wed, 12 Apr 2017 00:26:33 +0200 schrieb Romain Naour:
> 
>> Signed-off-by: Romain Naour <romain.naour-
> Re5JQEeQqe8AvxtiuMwx3w at public.gmane.org>
>> ---
>>  DEVELOPERS                   |  1 +
>>  package/Config.in            |  1 +
>>  package/minetest/Config.in   | 58 +++++++++++++++++++++++++++++++++++++
> +++++++
>>  package/minetest/minetest.mk | 44 +++++++++++++++++++++++++++++++++
> 
> please add a hash file, support for tarballs created by the github helper 
> was merged today.

Ok, I'll add it.

> 
>> diff --git a/package/minetest/minetest.mk b/package/minetest/minetest.mk
>> new file mode 100644
>> index 0000000..f110f7c
>> --- /dev/null
>> +++ b/package/minetest/minetest.mk
>> @@ -0,0 +1,44 @@
>>
> +################################################################################
>> +#
>> +# minetest
>> +#
>>
> +################################################################################
>> +
>> +MINETEST_VERSION = 0.4.15
> 
> Version 0.4.16 was released meanwhile.

Yes, it's an very active project and this series has been in the patchwork
during 2 months. I'll bump the version for the respin.

> 
> Building with this defconfig worked fine:
> 
> BR2_TOOLCHAIN_BUILDROOT_MUSL=y
> BR2_BINUTILS_VERSION_2_28_X=y
> BR2_GCC_VERSION_7_X=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_MINETEST=y
> BR2_PACKAGE_MINETEST_CLIENT_SERVER=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_LUAJIT=y

It means that I can add your Tested-by tag?

Best regards,
Romain

> 
> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
