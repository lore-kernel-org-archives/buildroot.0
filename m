From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Sun, 26 Aug 2012 13:51:39 +0300
Subject: [Buildroot] [PATCH] remove rest of the BR2_SOURCEFORGE_MIRROR
 references
In-Reply-To: <20120826093901.75f17f9c@skate>
References: <1345938768-1921-1-git-send-email-stefan.froberg@petroprogram.com>
 <20120826093901.75f17f9c@skate>
Message-ID: <5039FFBB.6040205@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

26.8.2012 10:39, Thomas Petazzoni kirjoitti:
> Hello,
>
> Thanks! Some comments below.
>
> Le Sun, 26 Aug 2012 02:52:48 +0300,
> Stefan Fr?berg <stefan.froberg@petroprogram.com> a ?crit :
>
>> diff --git a/package/genromfs/genromfs.mk b/package/genromfs/genromfs.mk
>> index c1cd608..3f5d44e 100644
>> --- a/package/genromfs/genromfs.mk
>> +++ b/package/genromfs/genromfs.mk
>> @@ -6,7 +6,7 @@
>>  
>>  GENROMFS_VERSION=0.5.2
>>  GENROMFS_SOURCE=genromfs-$(GENROMFS_VERSION).tar.gz
>> -GENROMFS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/romfs
>> +GENROMFS_SITE=http://downloads.sourceforge.net/project/romfs/genromfs/$(GENROMFS_VERSION)
>>  
>>  define GENROMFS_BUILD_CMDS
>>   $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
>> @@ -28,4 +28,4 @@ define HOST_GENROMFS_INSTALL_CMDS
>>  endef
>>  
>>  $(eval $(generic-package))
>> -$(eval $(host-generic-package))
>> \ No newline at end of file
>> +$(eval $(host-generic-package))
> You're adding a newline here (which was missing), but ok.
Oops!

>> diff --git a/package/poco/poco.mk b/package/poco/poco.mk
>> index f74c2b1..e59e812 100644
>> --- a/package/poco/poco.mk
>> +++ b/package/poco/poco.mk
>> @@ -3,9 +3,9 @@
>>  # poco
>>  #
>>  #############################################################
>> -POCO_VERSION = 1.4.3p1
>> -POCO_SOURCE = poco-$(POCO_VERSION)-all.tar.gz
>> -POCO_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/poco
>> +POCO_VERSION = 1.4.3
>> +POCO_SOURCE = poco-$(POCO_VERSION)p1-all.tar.gz
>> +POCO_SITE = http://downloads.sourceforge.net/project/poco/sources/poco-$(POCO_VERSION)
> No, I don't agree with this. The "p1" should be part of the version. So
> you should do something like:
>
> POCO_VERSION_MAJOR = 1.4.3
> POCO_VERSION = $(POCO_VERSION_MAJOR)p1
> POCO_SOURCE = poco-$(POCO_VERSION)-all.tar.gz
> POCO_SITE = http://downloads.sourceforge.net/project/poco/sources/poco-$(POCO_VERSION_MAJOR)
Ah, ok
>> diff --git a/package/synergy/synergy.mk b/package/synergy/synergy.mk
>> index b1afff7..0f492e7 100644
>> --- a/package/synergy/synergy.mk
>> +++ b/package/synergy/synergy.mk
>> @@ -1,4 +1,4 @@
>> -#############################################################
>> +	#############################################################
> Why ?
Another oops

3 mistakes out of 86 within one saturday evening hour.
Not too bad ;)

Stefan
>>  #
>>  # synergy
>>  #
>> @@ -6,7 +6,7 @@
>>  
>>  SYNERGY_VERSION = 1.3.1
>>  SYNERGY_SOURCE = synergy-$(SYNERGY_VERSION).tar.gz
>> -SYNERGY_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/synergy2/
>> +SYNERGY_SITE = http://downloads.sourceforge.net/project/synergy2/Sources/$(SYNERGY_VERSION)
> Thanks!
>
> Thomas
