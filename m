From: Julien Floret <julien.floret@6wind.com>
Date: Sun, 3 Jul 2016 09:26:56 +0200
Subject: [Buildroot] [PATCH 01/69] am335x-pru-package: add explicit
 dependencies for host variant
In-Reply-To: <20160703083200.3ae6e278@free-electrons.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
 <1467498098-23731-2-git-send-email-julien.floret@6wind.com>
 <20160703083200.3ae6e278@free-electrons.com>
Message-ID: <CAHfJR7gtputTr6Zjs8C8mmN8MceqZ4m9JJPvZfBaQDvZr9-SUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

2016-07-03 8:32 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Sun,  3 Jul 2016 00:20:30 +0200, Julien Floret wrote:
>> Signed-off-by: Julien Floret <julien.floret@6wind.com>
>> ---
>>  package/am335x-pru-package/am335x-pru-package.mk | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/package/am335x-pru-package/am335x-pru-package.mk b/package/am335x-pru-package/am335x-pru-package.mk
>> index a97e8a49eacb..8b33eb3d6cbf 100644
>> --- a/package/am335x-pru-package/am335x-pru-package.mk
>> +++ b/package/am335x-pru-package/am335x-pru-package.mk
>> @@ -9,6 +9,7 @@ AM335X_PRU_PACKAGE_SITE = $(call github,beagleboard,am335x_pru_package,$(AM335X_
>>  AM335X_PRU_PACKAGE_LICENSE = BSD-3c
>>  AM335X_PRU_PACKAGE_LICENSE_FILES = pru_sw/utils/LICENCE.txt
>>  AM335X_PRU_PACKAGE_DEPENDENCIES = host-am335x-pru-package
>> +HOST_AM335X_PRU_PACKAGE_DEPENDENCIES = host-am335x-pru-package
>
> With this addition, host-am335x-pru-package now depends on
> host-am335x-pru-package, which introduces a circular dependency.
>
> Having:
>
>   AM335X_PRU_PACKAGE_DEPENDENCIES = host-am335x-pru-package
>
> does *not* imply:
>
>   HOST_AM335X_PRU_PACKAGE_DEPENDENCIES = host-am335x-pru-package
>
> Because in the logic to derive host dependencies from target
> dependencies, we filter out if the package would depend on itself:
>
> $(2)_DEPENDENCIES ?= $$(filter-out host-skeleton host-toolchain $(1),\
>         $$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
>
> See the $(1) in the call of filter-out ?
>
> I'll mark this patch as Rejected then.

Of course. I stupidly missed this one, as well as in the "file" package.
Thanks,

Julien
