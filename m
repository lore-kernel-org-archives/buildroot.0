From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 May 2019 23:36:52 +0200
Subject: [Buildroot] [PATCH 5/5] package/cog: bump version to 0.3.0
In-Reply-To: <20190514233310.GB20205@momiji>
References: <20190514114111.20424-1-aperez@igalia.com>
 <20190514114111.20424-6-aperez@igalia.com> <20190514233310.GB20205@momiji>
Message-ID: <6d6d945f-05be-61cd-0c60-6b9f75a23d97@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14/05/2019 22:33, Adrian Perez de Castro wrote:
> Hi,
> 
> One quick note below...
> 
> On Tue, 14 May 2019 14:41:11 +0300, Adrian Perez de Castro <aperez@igalia.com> wrote:
>> Version 0.2.0 does not work with WPE WebKit 2.22.x, this is the
>> first version which can be used with 2.24.x
>>
>> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
>> ---
>>  package/cog/cog.hash | 2 +-
>>  package/cog/cog.mk   | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/cog/cog.hash b/package/cog/cog.hash
>> index 97daf72744..39cf2afdbd 100644
>> --- a/package/cog/cog.hash
>> +++ b/package/cog/cog.hash
>> @@ -1,5 +1,5 @@
>>  # Locally generated
>> -sha256 a6abadb78395226bac2e1dd5467feab2cc8c493eab6894a09a51a8e072e38c06  cog-v0.2.0.tar.gz
>> +sha256 755c68029bbd05a17784262e56021362740783d15868dab9402a125ef35eedaf  cog-v0.3.0.tar.gz
>>  
>>  # Hashes for license files:
>>  sha256 e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
>> diff --git a/package/cog/cog.mk b/package/cog/cog.mk
>> index 43f13152c8..da59b6a097 100644
>> --- a/package/cog/cog.mk
>> +++ b/package/cog/cog.mk
>> @@ -4,7 +4,7 @@
>>  #
>>  ################################################################################
>>  
>> -COG_VERSION = v0.2.0
>> +COG_VERSION = v0.3.0
>>  COG_SITE = $(call github,Igalia,cog,$(COG_VERSION))
>>  COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo
>>  COG_LICENSE = MIT
> 
> FWIW, I think this should have also:
> 
>   COG_INSTALL_STAGING = YES
> 
> to make it possible to debug Cog properly. I can either resubmit a second
> version of the patchset, or send this one change in a separate independent
> patch as a follow-up.

 It's definitely independent. And I don't think we would see "to make it
possible to debug Cog properly" as a good reason... Because with that reasoning,
*all* packages should be installed to staging. (Which, indeed, they should...)

 Regards,
 Arnout
