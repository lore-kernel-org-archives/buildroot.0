From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 8 Jun 2014 14:40:49 +0200
Subject: [Buildroot] [PATCH v6 3/4] rpi-userland: add patch fix missing
 libvcilcs install rules
In-Reply-To: <20140605192741.GG3553@free.fr>
References: <1401923053-30292-1-git-send-email-s.martin49@gmail.com>
 <1401923053-30292-4-git-send-email-s.martin49@gmail.com>
 <20140605192741.GG3553@free.fr>
Message-ID: <CAGduivytTDs2tPtLzYYJzOt41Uqir0mjVwFS-FJcpzbOkKVbzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Tested-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

On Thu, Jun 5, 2014 at 9:27 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Samuel, All,
>
> On 2014-06-05 01:04 +0200, Samuel Martin spake thusly:
>> This change adds a patch fix the missing install rules for libvcilcs.
>>
>> This is a pre-requisite to be able to build the shared libraries of the
>> rpi-userland package, and most importantly avoid linkage failure (at
>> link-time and/or runtime) in others libraries that link with it.
>>
>> Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Regards,
> Yann E. MORIN.
>
>> ---
>> changes v5 -> v6:
>> - new patch
>> ---
>>  ...vmcs_host-add-install-rules-for-libvcilcs.patch | 23 ++++++++++++++++++++++
>>  1 file changed, 23 insertions(+)
>>  create mode 100644 package/rpi-userland/rpi-userland-003-interface-vmcs_host-add-install-rules-for-libvcilcs.patch
>>
>> diff --git a/package/rpi-userland/rpi-userland-003-interface-vmcs_host-add-install-rules-for-libvcilcs.patch b/package/rpi-userland/rpi-userland-003-interface-vmcs_host-add-install-rules-for-libvcilcs.patch
>> new file mode 100644
>> index 0000000..05cf4b3
>> --- /dev/null
>> +++ b/package/rpi-userland/rpi-userland-003-interface-vmcs_host-add-install-rules-for-libvcilcs.patch
>> @@ -0,0 +1,23 @@
>> +From b60398837ddf39d4b605600abc167d4366e454a6 Mon Sep 17 00:00:00 2001
>> +From: Samuel Martin <s.martin49@gmail.com>
>> +Date: Thu, 5 Jun 2014 00:06:08 +0200
>> +Subject: [PATCH] interface/vmcs_host: add install rules for libvcilcs
>> +
>> +Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>> +---
>> + interface/vmcs_host/CMakeLists.txt | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/interface/vmcs_host/CMakeLists.txt b/interface/vmcs_host/CMakeLists.txt
>> +index 64ba2f8..8510f81 100755
>> +--- a/interface/vmcs_host/CMakeLists.txt
>> ++++ b/interface/vmcs_host/CMakeLists.txt
>> +@@ -33,4 +33,5 @@ target_link_libraries(vchostif vchiq_arm vcos vcfiled_check)
>> +
>> + add_subdirectory(linux/vcfiled)
>> + install(TARGETS vchostif DESTINATION lib)
>> ++install(TARGETS vcilcs DESTINATION lib)
>> +
>> +--
>> +2.0.0
>> +
>> --
>> 2.0.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
