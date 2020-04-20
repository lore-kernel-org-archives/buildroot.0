From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Mon, 20 Apr 2020 17:36:09 +0200
Subject: [Buildroot] [PATCH] package/qt5/Config.in: fix typo
In-Reply-To: <20200420152910.GI5035@scaer>
References: <20200420151024.41482-1-b.bilas@grinn-global.com>
 <20200420152910.GI5035@scaer>
Message-ID: <3fc1e8b1-1a19-5ed5-7636-d22fe8525227@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On 20.04.2020 17:29, Yann E. MORIN wrote:
> Bartosz, All,
>
> On 2020-04-20 17:10 +0200, Bartosz Bilas spake thusly:
>> There is no BR2_TOOLCHAIN_GCC_AT_LEAST_5_0 option
>> but BR2_TOOLCHAIN_GCC_AT_LEAST_5.
>>
>> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> I also fixed pinentry and wireshark, which had the incorrect version
> introduced with the same commit as qt5. Adapted the commit log and
> pushed to master, thanks.
maybe a good idea would be to introduce some verify-tests for those 
non-existing options (if it's possible ofc.) because as we see someone 
can make the same mistake again.
>
> Regards,
> Yann E. MORIN.
>
>> ---
>>   package/qt5/Config.in | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
>> index cd9c93735d..c716919476 100644
>> --- a/package/qt5/Config.in
>> +++ b/package/qt5/Config.in
>> @@ -16,14 +16,14 @@ comment "Qt5 needs a toolchain w/ gcc >= 5.0, wchar, NPTL, C++, dynamic library"
>>   	depends on !BR2_arc
>>   	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
>>   		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
>> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_5_0
>> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
>>   
>>   menuconfig BR2_PACKAGE_QT5
>>   	bool "Qt5"
>>   	depends on BR2_INSTALL_LIBSTDCPP
>>   	depends on BR2_USE_WCHAR
>>   	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5_0 # C++11, GCC_BUG_57694
>> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11, GCC_BUG_57694
>>   	depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
>>   	# no built-in double-conversion support
>>   	depends on !BR2_arc
>> -- 
>> 2.26.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
Best
Bartek
