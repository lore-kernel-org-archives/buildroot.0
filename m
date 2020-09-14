From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 14 Sep 2020 21:58:16 +0200
Subject: [Buildroot] [PATCH v2 07/12] package/busybox: fix applets
 runtime issue when building with clang cross-compiler
In-Reply-To: <7164ade8-bbe7-7e0f-a25c-24daf754b7e0@mind.be>
References: <20190907094027.9537-1-romain.naour@smile.fr>
 <20190907094027.9537-8-romain.naour@smile.fr>
 <7164ade8-bbe7-7e0f-a25c-24daf754b7e0@mind.be>
Message-ID: <ae1f557e-6aad-42b7-5dd4-f4f7173bc0f4@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 29/08/2020 ? 22:21, Arnout Vandecappelle a ?crit?:
> 
> 
> On 07/09/2019 11:40, Romain Naour wrote:
>> Apply a patch contributed by Luis Marques on the Busybox mailing list [1]
>> fixing a runtime issue (segfault) when busybox is compiled by Clang.
>>
>> The patch disable the compiler optimizations for Clang/LLVM only.
>>
>> Without this patch, busybox segfault with several applets
>> (login on aarch64 using Clang 8.0.1, init on x86_64 using Clang 9.0.0rc3)
> 
>  We should probably check if this patch is still needed with current busybox.

It should be fixed with the latest version of busybox 1.32 but it didn't work
well while testing with riscv64 and llvm/clang 10. I need to test again with
aarch64.

https://git.busybox.net/busybox/commit/?id=af7169b4a70eb3f60555ced17a40780f70aaaa5c

Best regards,
Romain


> 
>  Regards,
>  Arnout
> 
