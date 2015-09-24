From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 24 Sep 2015 11:33:47 +0100
Subject: [Buildroot] [PATCH] package/genimage: bump version to 8
In-Reply-To: <5603C18F.5040008@wsystem.com>
References: <1443086443-107037-1-git-send-email-benoit@wsystem.com>
 <5603C18F.5040008@wsystem.com>
Message-ID: <5603D18B.6050107@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On 09/24/2015 10:25 AM, Beno?t Th?baudeau wrote:
> On 24/09/2015 11:20, Beno?t Th?baudeau wrote:
>> This new version fixes segmentation faults on some platforms.
>>
>> Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

$ grep -E ^GENIMAGE_VERSION package/genimage/genimage.mk
GENIMAGE_VERSION = 8

$ uname -m
x86_64

$ file output/host/usr/bin/genimage
output/host/usr/bin/genimage: ELF 64-bit LSB executable, x86-64, version
1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.18,
not stripped

Regards,

Vincent.

>> ---
>>  package/genimage/genimage.hash | 2 +-
>>  package/genimage/genimage.mk   | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/genimage/genimage.hash b/package/genimage/genimage.hash
>> index 71b7601..b01ea46 100644
>> --- a/package/genimage/genimage.hash
>> +++ b/package/genimage/genimage.hash
>> @@ -1,2 +1,2 @@
>>  # Locally calculated
>> -sha256	7366dcfe4c542298ffe8a6c8d3551b1c3a84e25bfbb76ca75b9692e974f4534a	genimage-7.tar.xz
>> +sha256	363b2222b8036eca927c464994e7a877539adc3ea9ba895c1e2186f0589fafbf	genimage-8.tar.xz
>> diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
>> index 07d95a4..2dffbc5 100644
>> --- a/package/genimage/genimage.mk
>> +++ b/package/genimage/genimage.mk
>> @@ -4,7 +4,7 @@
>>  #
>>  ################################################################################
>>  
>> -GENIMAGE_VERSION = 7
>> +GENIMAGE_VERSION = 8
>>  GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
>>  GENIMAGE_SITE = http://www.pengutronix.de/software/genimage/download
>>  GENIMAGE_DEPENDENCIES = host-pkgconf libconfuse
> 
> I have successfully tested this with my RPi series using genimage.
> 
> Best regards,
> Beno?t
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
