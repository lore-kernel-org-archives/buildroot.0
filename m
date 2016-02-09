From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 8 Feb 2016 21:23:54 -0500
Subject: [Buildroot] [PATCH v2 10/18] erlang-p1_stun: bump to version
	0.9.0
In-Reply-To: <56B67925.6050606@gmail.com>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
 <1454443064-14269-11-git-send-email-fhunleth@troodon-software.com>
 <56B67925.6050606@gmail.com>
Message-ID: <CA+-urNRqPcnhm72iVsQVVPhh5JwyHf4X_GBg8=XH9TqdAtkn1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Sat, Feb 6, 2016 at 5:52 PM, Romain Naour <romain.naour@gmail.com> wrote:
> Hi Frank, All,
>
> Le 02/02/2016 20:57, Frank Hunleth a ?crit :
>> As part of the version change, the package name changed to use an
>> underscore rather than a hyphen. Fortunately, the name change doesn't
>> affect the Config.in option, so no legacy handling is needed.
>
> I don't understand why we need to rename the Buildroot package here.

I renamed it for consistency with upstream. However, now that I look
into it, the rest of the erlang-p1-* packages could be renamed
erlang-p1_* by the same logic. I think that I'll revert the renaming
here and bump the version rather than tackling everything in this
patch set.

Frank

>
> Best regards,
> Romain
>
>>
>> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
>> ---
>>  package/Config.in                                                   | 2 +-
>>  package/{erlang-p1-stun => erlang-p1_stun}/Config.in                | 4 ++--
>>  .../erlang-p1-stun.mk => erlang-p1_stun/erlang-p1_stun.mk}          | 6 +++---
>>  3 files changed, 6 insertions(+), 6 deletions(-)
>>  rename package/{erlang-p1-stun => erlang-p1_stun}/Config.in (70%)
>>  rename package/{erlang-p1-stun/erlang-p1-stun.mk => erlang-p1_stun/erlang-p1_stun.mk} (77%)
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index e576c92..c5a7734 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -476,7 +476,7 @@ menu "Erlang libraries/modules"
>>       source "package/erlang-p1-iconv/Config.in"
>>       source "package/erlang-p1-sip/Config.in"
>>       source "package/erlang-p1-stringprep/Config.in"
>> -     source "package/erlang-p1-stun/Config.in"
>> +     source "package/erlang-p1_stun/Config.in"
>>       source "package/erlang-p1-tls/Config.in"
>>       source "package/erlang-p1-utils/Config.in"
>>       source "package/erlang-p1-xml/Config.in"
>> diff --git a/package/erlang-p1-stun/Config.in b/package/erlang-p1_stun/Config.in
>> similarity index 70%
>> rename from package/erlang-p1-stun/Config.in
>> rename to package/erlang-p1_stun/Config.in
>> index 70cdd91..b3f56de 100644
>> --- a/package/erlang-p1-stun/Config.in
>> +++ b/package/erlang-p1_stun/Config.in
>> @@ -1,6 +1,6 @@
>>  config BR2_PACKAGE_ERLANG_P1_STUN
>> -     bool "erlang-p1-stun"
>> -     select BR2_PACKAGE_ERLANG_P1_TLS
>> +     bool "erlang-p1_stun"
>> +     select BR2_PACKAGE_ERLANG_FAST_TLS
>>       select BR2_PACKAGE_ERLANG_P1_UTILS
>>       help
>>         STUN library for Erlang
>> diff --git a/package/erlang-p1-stun/erlang-p1-stun.mk b/package/erlang-p1_stun/erlang-p1_stun.mk
>> similarity index 77%
>> rename from package/erlang-p1-stun/erlang-p1-stun.mk
>> rename to package/erlang-p1_stun/erlang-p1_stun.mk
>> index 7920347..d689585 100644
>> --- a/package/erlang-p1-stun/erlang-p1-stun.mk
>> +++ b/package/erlang-p1_stun/erlang-p1_stun.mk
>> @@ -1,14 +1,14 @@
>>  ################################################################################
>>  #
>> -# erlang-p1-stun
>> +# erlang-p1_stun
>>  #
>>  ################################################################################
>>
>> -ERLANG_P1_STUN_VERSION = a3dce07
>> +ERLANG_P1_STUN_VERSION = 0.9.0
>>  ERLANG_P1_STUN_SITE = $(call github,processone,stun,$(ERLANG_P1_STUN_VERSION))
>>  ERLANG_P1_STUN_LICENSE = GPLv2+
>>  ERLANG_P1_STUN_LICENSE_FILES = COPYING
>> -ERLANG_P1_STUN_DEPENDENCIES = erlang-p1-tls erlang-p1-utils
>> +ERLANG_P1_STUN_DEPENDENCIES = erlang-fast_tls erlang-p1-utils
>>  ERLANG_P1_STUN_INSTALL_STAGING = YES
>>
>>  $(eval $(rebar-package))
>>
