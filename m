From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Nov 2014 11:25:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/minidlna: disable on nios2
References: <1417287381-5045-1-git-send-email-bernd.kuhls@t-online.de>
 <20141130094300.256d43e0@free-electrons.com>
Message-ID: <XnsA3F5743BD817berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20141130094300.256d43e0 at free-electrons.com:

>> +     # Triggers the _gp link issue
>> +     depends on !BR2_nios2
> 
> Can we instead please blacklist only the specific NIOS II toolchain
> causing the problem?

Hi,

BR2_nios2 does not allow building an internal toolchain and both external 
toolchains supported by buildroot are affected by the problem, so practically 
it makes no difference currently to disable the platform or both toolchains, 
but you are right, there might be a newer toolchain fixing the bug, so I sent 
v2: (and forgot the patch changelog..., arg), v3: 
http://patchwork.ozlabs.org/patch/416036/

Regards, Bernd
