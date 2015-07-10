From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Fri, 10 Jul 2015 12:50:35 -0500
Subject: [Buildroot] [PATCH v7 07/22] busybox: applets as individual
	binaries
In-Reply-To: <CAHXCMMLjS2-TXnV7qDqzH5shegB4znd-APyZvLMgX-E83h8FTQ@mail.gmail.com>
References: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1433251718-3167-8-git-send-email-clayton.shotwell@rockwellcollins.com>
 <CAHXCMMLjS2-TXnV7qDqzH5shegB4znd-APyZvLMgX-E83h8FTQ@mail.gmail.com>
Message-ID: <CANn-YGQ1ZBQy276tBeBs3s-Mu8n-cFcqSd+Hqm8WSninbfiNhg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel,

Finally getting back to these patches.

On Sat, Jun 20, 2015 at 11:13 AM, Samuel Martin <s.martin49@gmail.com> wrote:
> Hi Clayton,
>
>> diff --git a/package/busybox/Config.in b/package/busybox/Config.in
>> index 6847a60..feed560 100644
>> --- a/package/busybox/Config.in
>> +++ b/package/busybox/Config.in
>> @@ -32,6 +32,15 @@ config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>>           Show packages in menuconfig that are potentially also provided
>>           by busybox.
>>
>> +config BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES
>> +       bool "Individual binaries"
>> +       depends on !BR2_STATIC_LIBS
>> +       depends on !BR2_bfin # libbusybox.so link issue
>> +
>> +comment "Busybox individual binaries depends on dynamic libraries"
>> +       depends on BR2_STATIC_LIBS
>> +       depends on BR2_bfin
> s/on BR2_bfin/on !BR2_bfin/
> (because this is an architecture dependency)

Good catch. I'll get that changed.

Thanks,
Clayton

Clayton Shotwell
Senior Software Engineer, Rockwell Collins
clayton.shotwell at rockwellcollins.com
