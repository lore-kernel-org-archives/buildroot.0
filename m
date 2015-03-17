From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 17 Mar 2015 23:37:25 +0100
Subject: [Buildroot] [PATCH 3/3] ljsyscall: refactor with
	BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
In-Reply-To: <CA+TH9VnqVH6iL73C9T=74gZaGfz71=h2xOPAgUMdrf_cN6s-NQ@mail.gmail.com>
References: <1426622689-31844-1-git-send-email-francois.perrad@gadz.org>
 <1426622689-31844-3-git-send-email-francois.perrad@gadz.org>
 <CA+TH9VnqVH6iL73C9T=74gZaGfz71=h2xOPAgUMdrf_cN6s-NQ@mail.gmail.com>
Message-ID: <CA+TH9VnTYcPxhi2XD9HcK3wtQ7Nsm5b=ktZnEyJj_sstFrWY=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,


2015-03-17 22:45 GMT+01:00 Angelo Compagnucci <angelo.compagnucci@gmail.com>:
> Dear Francois Perrad,
>
> 2015-03-17 21:04 GMT+01:00 Francois Perrad <fperrad@gmail.com>:
>
> Reviewed-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>
> Patch is fine for me. Nothing to add.
>
>>  package/ljsyscall/Config.in | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/ljsyscall/Config.in b/package/ljsyscall/Config.in
>> index dcbd521..b9ff04d 100644
>> --- a/package/ljsyscall/Config.in
>> +++ b/package/ljsyscall/Config.in
>> @@ -3,12 +3,12 @@ config BR2_PACKAGE_LJSYSCALL
>>         # ljsyscall is specifically for LuaJIT, not Lua.
>>         depends on BR2_PACKAGE_LUAJIT
>>         # ljsyscall is only available for some target architectures
>> -       depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm || BR2_armeb
>> +       depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS

Sorry for not having spotted before but

BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS != BR2_i386 || BR2_x86_64 ||
BR2_powerpc || BR2_arm || BR2_armeb

Actually, BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS is BR2_i386 has this condition more

((BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT)

Are you sure LJSYSCALL package works on mips?

>>         help
>>           An FFI implementation of the Linux and NetBSD kernel ABIs for LuaJIT.
>>
>>           http://github.com/justincormack/ljsyscall
>>
>>  comment "ljsyscall needs LuaJIT"
>> -       depends on !BR2_PACKAGE_LUAJIT && (BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm || BR2_armeb)
>> +       depends on !BR2_PACKAGE_LUAJIT && !BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
>>
>> --
>> 2.1.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
>
> --
> Profile: http://it.linkedin.com/in/compagnucciangelo



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
