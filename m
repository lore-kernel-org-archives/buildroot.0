From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 24 Apr 2017 00:06:30 +0200
Subject: [Buildroot] [PATCH] gcc: Fix build failure related to -fPIC for
 x86_64 -> i686 builds
In-Reply-To: <71cfdaf7-367d-44de-a1c6-9041e269c8de@cesnet.cz>
References: <71cfdaf7-367d-44de-a1c6-9041e269c8de@cesnet.cz>
Message-ID: <aded779d-fd0d-e83c-5a3e-d0e7b28b5dfe@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19-04-17 18:23, Jan Kundr?t wrote:
>> Without this patch, I cannot build the toolchain (both host-gcc-initial
>> and -final) on Gentoo's amd64 using GCC 4.9.3:
>>
>>   /usr/lib/gcc/x86_64-pc-linux-gnu/4.9.3/../../../../x86_64-pc-linux-gnu/bin/ld:
>>   gcov.o: relocation R_X86_64_32 against `.rodata.str1.8' can not
>>   be used when making a shared object; recompile with -fPIC
> 
> One important piece I forgot to add -- I'm running "Hardened Gentoo GCC" which
> enables PIE by default [1] [2]. As such, this might explain why other are
> (presumably) not seeing this problem.

 Indeed. However, I wonder, won't you have a similar problem with other host
packages that try to build something without -fPIC?


 We don't like to accept patches where it is not clear what happens, i.e. how
this particular change fixes your problem...


> BTW, I cannot find my original submission on patchwork. Was that e-mail OK? I
> see it in the ML archive [3].

 I believe it's because you sent it base64-encoded, patchwork only likes
plaintext. You didn't use git send-email, did you?

 Regards,
 Arnout

> 
> With kind regards,
> Jan
> 
> [1]
> https://wiki.gentoo.org/wiki/Hardened/Toolchain#Automatic_generation_of_Position_Independent_Executables_.28PIEs.29
> 
> [2]
> https://wiki.gentoo.org/wiki/Hardened/Toolchain#Toolchain_modifications_for_automatic_PIEs
> 
> [3] http://lists.busybox.net/pipermail/buildroot/2017-April/189441.html
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
