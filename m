From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 21 Mar 2017 09:57:35 +0100
Subject: [Buildroot] [PATCH 1/3] xenomai: bump version to 3.0.3
In-Reply-To: <20170320234014.6ad3182f@free-electrons.com>
References: <20170320233349.14057-1-sikor6@gmail.com>
 <20170320234014.6ad3182f@free-electrons.com>
Message-ID: <7f8f513c-d847-5b70-c084-6538c3a6af43@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-03-17 23:40, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 21 Mar 2017 00:33:47 +0100, sikor6 at gmail.com wrote:
>> From: Pawel Sikora <sikor6@gmail.com>
>>
>> Signed-off-by: Pawel Sikora <sikor6@gmail.com>
> 
> Thanks a lot for looking at the Xenomai package. It hasn't been updated
> in a while.
> 
>> ---
>>  package/xenomai/xenomai.hash | 2 +-
>>  package/xenomai/xenomai.mk   | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/xenomai/xenomai.hash b/package/xenomai/xenomai.hash
>> index 4d74472ee..e41859343 100644
>> --- a/package/xenomai/xenomai.hash
>> +++ b/package/xenomai/xenomai.hash
>> @@ -1,2 +1,2 @@
>>  # Locally computed;
>> -sha256  b6ff723cb0f3b1c2c4e15bccfd114b248dea1b4164a0ac0e612815379ce7caf8  xenomai-2.6.4.tar.bz2
>> +sha256  4c396b4d447efd414c4d7c0894f97ef52b4ec45c87f512c14adee981a45f0e3b  xenomai-3.0.3.tar.bz2
>> diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
>> index 6e0e44163..28875b944 100644
>> --- a/package/xenomai/xenomai.mk
>> +++ b/package/xenomai/xenomai.mk
>> @@ -6,7 +6,7 @@
>>  
>>  XENOMAI_VERSION = $(call qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
>>  ifeq ($(XENOMAI_VERSION),)
>> -XENOMAI_VERSION = 2.6.4
>> +XENOMAI_VERSION = 3.0.3
> 
> My understanding was that Xenomai 3.x was significantly different from
> Xenomai 2.x. Should we support both versions? Is Xenomai 3.x now old
> enough that Xenomai 2.x is considered legacy? What problems will people
> currently using Xenomai 2.x face if we ask them to move to Xenomai 3.x?

 There are some API differences, but (at least in dual-kernel mode), it is
pretty easy to port over. I think we have lots of packages where version bumps
introduce slight behavioural changes so I think this is OK.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
