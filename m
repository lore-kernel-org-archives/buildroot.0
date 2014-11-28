From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 28 Nov 2014 22:01:34 +0100
Subject: [Buildroot] buildroot 2014.11-rc3 mono fails
In-Reply-To: <CA+TH9V=Y7vf6r1nWmYcK3exEyDP7W=5N-VtaUae9sWs-UB3ZJQ@mail.gmail.com>
References: <612310928.432121.1417205315374.JavaMail.open-xchange@oxbaltgw06.schlund.de>
 <CA+TH9V=Y7vf6r1nWmYcK3exEyDP7W=5N-VtaUae9sWs-UB3ZJQ@mail.gmail.com>
Message-ID: <CA+TH9VnSwsNK1ZooyMfjAZPuKg7Rux9XDjEZU9VHucnER2_oiA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rainer Berns,

Obviously you have to clean and rebuild mono and host-mono packages.

Sincerely, Angelo

2014-11-28 21:59 GMT+01:00 Angelo Compagnucci <angelo.compagnucci@gmail.com>:
> Dear Rainer Berns,
>
> Probably you have a mono compiler installed on your machine and this
> mono compiler is not compatible with the latest mono version.
>
> Mono uses the install wide mcs/gmcs compiler if it's present to
> compile itself,  also if not compatible.
>
> Try to remove that mono compiler so mono cross compilation can use the
> internal one.
> If you are on Ubuntu/Debian you can remove mono-mcs package.
>
> Hope this helps!
>
> Sincerely, Angelo.
>
> 2014-11-28 21:08 GMT+01:00 Rainer Berns <rainer.berns@berns-online.de>:
>> Hi,
>>
>> I try to build mono with beaglebone_defconfig, internal toolchain (3.12.10
>> headers) with IPv6 and WCHAR.
>> Building mono 4.5 ,4 and  2/3   fails with :
>>
>> Mono.Http/NtlmClient.cs(99,54): error CS1502: The best overloaded method
>> match for `Mono.Security.Protocol.Ntlm.Type3Message.Type3Message(byte[])'
>> has some invalid arguments
>> /usr/lib/mono/gac/Mono.Security/2.0.0.0__0738eb9f132ed756/Mono.Security.dll
>> (Location of the symbol related to previous error)
>> Mono.Http/NtlmClient.cs(99,54): error CS1503: Argument `#1' cannot convert
>> `Mono.Security.Protocol.Ntlm.Type2Message' expression to type `byte[]'
>> make[10]: *** [../../class/lib/basic/secxml/System.dll] Error 1
>> make[9]: *** [../../class/lib/basic/secxml/System.dll] Error 2
>> make[8]: *** [do-all] Error 2
>> make[7]: *** [all-recursive] Error 1
>> make[6]: *** [all-recursive] Error 1
>> make[5]: *** [profile-do--basic--all] Error 2
>> make[4]: *** [profiles-do--all] Error 2
>> make[3]: *** [all-local] Error 2
>> make[2]: *** [all-recursive] Error 1
>> make[1]: *** [all] Error 2
>> make: ***
>> [/home/berns/Entwicklung/buildroot-2014.11-rc3/output/build/host-mono-3.10.0/.stamp_built]
>> Error 2
>>
>>
>> Regards
>>
>> Rainer
>>
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
