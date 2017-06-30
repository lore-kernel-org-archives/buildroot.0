From: Wolfgang Grandegger <wg@grandegger.com>
Date: Fri, 30 Jun 2017 19:33:19 +0200
Subject: [Buildroot] [RFC PATCH v5 01/11] package/patchelf: use most
 recent version as a base for rpath sanitation
In-Reply-To: <80a1cf57-34bb-dc8f-e2b9-dd4001f7df6b@mind.be>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
 <1498811828-6893-2-git-send-email-wg@grandegger.com>
 <80a1cf57-34bb-dc8f-e2b9-dd4001f7df6b@mind.be>
Message-ID: <5b16af39-81af-9a19-dd28-9aebfde9e817@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 30.06.2017 um 19:15 schrieb Arnout Vandecappelle:
> 
> 
> On 30-06-17 10:36, Wolfgang Grandegger wrote:
>> We would like to use "patchelf" to do rpath sanitation of all ELF files
>> in the "host", "staging" and "target" directory, mainly because a script
>> based solutions is too complex and slow.
> 
>   Note that the bump is needed because some features were introduced since 0.9
> that we need for out rpath sanitization.

OK. Strictly speaking, we don't need/use the new stuff. The patch could also be
adapted to 0.0. I mainly used the most recent version because of the mainlining
process.

>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
>> ---
>>   package/patchelf/patchelf.hash | 2 +-
>>   package/patchelf/patchelf.mk   | 8 ++++----
>>   2 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/package/patchelf/patchelf.hash b/package/patchelf/patchelf.hash
>> index 653eb46..95b067b 100644
>> --- a/package/patchelf/patchelf.hash
>> +++ b/package/patchelf/patchelf.hash
>> @@ -1,2 +1,2 @@
>>   # Locally calculated
>> -sha256	a0f65c1ba148890e9f2f7823f4bedf7ecad5417772f64f994004f59a39014f83	patchelf-0.9.tar.bz2
>> +sha256  c8f1e4d2d41d5b390931e9876ccab39050182dc0003e865d3edd06684dbf9d8d  patchelf-29c085fd9d3fc972f75b3961905d6b4ecce7eb2b.tar.gz
>> diff --git a/package/patchelf/patchelf.mk b/package/patchelf/patchelf.mk
>> index 74e6ccc..9750351 100644
>> --- a/package/patchelf/patchelf.mk
>> +++ b/package/patchelf/patchelf.mk
>> @@ -4,10 +4,10 @@
>>   #
>>   ################################################################################
>>   
>> -PATCHELF_VERSION = 0.9
>> -PATCHELF_SITE = http://releases.nixos.org/patchelf/patchelf-$(PATCHELF_VERSION)
>> -PATCHELF_SOURCE = patchelf-$(PATCHELF_VERSION).tar.bz2
>> -PATCHELF_LICENSE = GPL-3.0+
>> +PATCHELF_VERSION = 29c085fd9d3fc972f75b3961905d6b4ecce7eb2b
>> +PATCHELF_SITE = $(call github,NixOS,patchelf,$(PATCHELF_VERSION))
>> +PATCHELF_AUTORECONF = YES
> 
>   Please add a comment above that:
> # Fetched from Github, with no configure script

OK.

>> +PATCHELF_LICENSE = GPLv3+
> 
>   This was not the intention I guess?

Well, that's the licence used for the new version:

https://github.com/NixOS/patchelf/commit/e75749b84f1511fb14a4027d25a75ad9f867e25f

Wolfgang.
