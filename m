From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 11 Apr 2016 12:08:38 +0200
Subject: [Buildroot] [PATCH] flashrom: bump to version 0.9.9
In-Reply-To: <20160411115629.64b82ba2@free-electrons.com>
References: <1460367986-22594-1-git-send-email-gary.bisson@boundarydevices.com>
 <20160411115629.64b82ba2@free-electrons.com>
Message-ID: <CAAMH-yu+nsout6iHJmdSNDFF3NWx8VQvFuwesVg20VjBQJxyOw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Mon, Apr 11, 2016 at 11:56 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 11 Apr 2016 11:46:26 +0200, Gary Bisson wrote:
>
>> diff --git a/package/flashrom/Config.in b/package/flashrom/Config.in
>> index adc068c..46fa641 100644
>> --- a/package/flashrom/Config.in
>> +++ b/package/flashrom/Config.in
>> @@ -6,7 +6,6 @@ config BR2_PACKAGE_FLASHROM
>>       select BR2_PACKAGE_LIBFTDI
>>       # dmidecode is only a runtime dependency
>>       select BR2_PACKAGE_DMIDECODE
>
> dmidecode is available on i386/x86-64 only, so you cannot keep this
> select and remove the i386/x86-64 dependency at the same time.

You're right. Also, pci-utils is not available for bfin so I guess I
need to exclude this architecture.

Regards,
Gary
