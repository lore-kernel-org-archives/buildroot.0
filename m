From: arnaud aujon <arnaud.aujon@gmail.com>
Date: Thu, 24 Oct 2013 15:12:08 +0200
Subject: [Buildroot] [PATCH v2] openobex: use sourceforge repository
In-Reply-To: <5269136E.5040202@mind.be>
References: <1382616130-17139-1-git-send-email-arnaud.aujon@gmail.com>
 <5269136E.5040202@mind.be>
Message-ID: <CACjG4BLLuLMg7EayfLaMJZda6XNm=20Qm-tP0uQ=VJR9djNqrw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I used sourceforge because on openobex gitorious wiki page, the release
chapter refers to sourceforge.
But I guess, as the development is done using gitorious it's better using
it.
I will update the patch to use gitorious.

Arnaud


2013/10/24 Arnout Vandecappelle <arnout@mind.be>

> On 24/10/13 14:02, Arnaud Aujon wrote:
>
>> openobex releases are now available on sourceforge, add VERSION_MAJOR
>> to be able to bump it more easily if necessary.
>>
>
>  Why sourceforge? The source is hosted on gitorious, so it would be better
> to grab a tarball there I'd think. There's a tag for 1.5 so you can get the
> tarball from
> https://gitorious.org/**openobex/mainline/archive/1.5.**tar.gz<https://gitorious.org/openobex/mainline/archive/1.5.tar.gz>
>
>  Regards,
>  Arnout
>
>
>
>> Signed-off-by: Arnaud Aujon <arnaud.aujon@gmail.com>
>> ---
>> Changes v1 -> v2: just add patch comment
>> ---
>>   package/openobex/openobex.mk | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/openobex/openobex.mk b/package/openobex/openobex.mk
>> index 7195a26..4f383c8 100644
>> --- a/package/openobex/openobex.mk
>> +++ b/package/openobex/openobex.mk
>> @@ -4,8 +4,10 @@
>>   #
>>   ##############################**##############################**
>> ####################
>>
>> -OPENOBEX_VERSION = 1.5
>> -OPENOBEX_SITE = http://ftp.osuosl.org/pub/**linux/bluetooth<http://ftp.osuosl.org/pub/linux/bluetooth>
>> +OPENOBEX_VERSION_MAJOR = 1.5
>> +OPENOBEX_VERSION = $(OPENOBEX_VERSION_MAJOR).0
>> +OPENOBEX_SOURCE = openobex-$(OPENOBEX_VERSION)-**Source.zip
>> +OPENOBEX_SITE = http://downloads.sourceforge.**
>> net/project/openobex/openobex/**$(OPENOBEX_VERSION_MAJOR)<http://downloads.sourceforge.net/project/openobex/openobex/$(OPENOBEX_VERSION_MAJOR)>
>>   # Libraries seems to be released under LGPLv2.1+,
>>   # while other material is under GPLv2+.
>>   OPENOBEX_LICENSE = GPLv2+/LGPLv2.1+
>> @@ -15,6 +17,12 @@ OPENOBEX_DEPENDENCIES = host-pkgconf
>>   OPENOBEX_AUTORECONF = YES
>>   OPENOBEX_INSTALL_STAGING = YES
>>
>> +define OPENOBEX_EXTRACT_CMDS
>> ++       unzip -d $(@D) $(DL_DIR)/$(OPENOBEX_SOURCE)
>> ++       mv $(@D)/openobex-$(OPENOBEX_**VERSION)-Source/* $(@D)
>> ++       $(RM) -r $(@D)/openobex-$(OPENOBEX_**VERSION)-Source
>> +endef
>> +
>>   OPENOBEX_CONF_OPT += \
>>         $(if $(BR2_ENABLE_DEBUG),--enable-**debug) \
>>         $(if $(BR2_PACKAGE_OPENOBEX_APPS),-**-enable-apps) \
>>
>>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/**arnoutvandecappelle<http://www.linkedin.com/in/arnoutvandecappelle>
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131024/e94d8dfd/attachment-0001.html>
