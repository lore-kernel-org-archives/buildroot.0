From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Apr 2015 23:44:30 +0200
Subject: [Buildroot] [PATCH 02/30] package/matchbox: make matchbox-wm a
 real package
In-Reply-To: <553965AD.1000606@mind.be>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <2a2829fef33255a90ea0989d2fbd1a2cc67b7825.1429725549.git.yann.morin.1998@free.fr>
 <553965AD.1000606@mind.be>
Message-ID: <553967BE.60307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/23/15 23:35, Arnout Vandecappelle wrote:
> On 04/22/15 20:09, Yann E. MORIN wrote:
>> Similarly to what we just did for matchbox-lib, we make matchbox-wm a
>> real package.
>>
>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  (on condition that it goes to package/matchbox-wm)

 As discussed on IRC: moving all matchbox packages one directory up is for a
later patch, so this patch is good as it is.

 Regards,
 Arnout

> 
>  Regards,
>  Arnout
> 
>> ---
>>  package/matchbox/Config.in             | 2 ++
>>  package/matchbox/matchbox-wm/Config.in | 3 +++
>>  package/matchbox/matchbox.mk           | 1 -
>>  3 files changed, 5 insertions(+), 1 deletion(-)
>>  create mode 100644 package/matchbox/matchbox-wm/Config.in
>>
>> diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
>> index 70cc168..15b1017 100644
>> --- a/package/matchbox/Config.in
>> +++ b/package/matchbox/Config.in
>> @@ -8,6 +8,7 @@ config BR2_PACKAGE_MATCHBOX
>>  	select BR2_PACKAGE_XLIB_LIBXDAMAGE
>>  	select BR2_PACKAGE_XLIB_LIBXCURSOR
>>  	select BR2_PACKAGE_MATCHBOX_LIB
>> +	select BR2_PACKAGE_MATCHBOX_WM
>>  	help
>>  	  Matchbox is an Open Source base environment for the X Window
>>  	  System running on non-desktop embedded platforms such as
>> @@ -19,6 +20,7 @@ config BR2_PACKAGE_MATCHBOX
>>  if BR2_PACKAGE_MATCHBOX
>>  
>>  source "package/matchbox/matchbox-lib/Config.in"
>> +source "package/matchbox/matchbox-wm/Config.in"
>>  
>>  config BR2_PACKAGE_MATCHBOX_PANEL
>>  	bool "Matchbox Panel"
>> diff --git a/package/matchbox/matchbox-wm/Config.in b/package/matchbox/matchbox-wm/Config.in
>> new file mode 100644
>> index 0000000..6ad5dfc
>> --- /dev/null
>> +++ b/package/matchbox/matchbox-wm/Config.in
>> @@ -0,0 +1,3 @@
>> +config BR2_PACKAGE_MATCHBOX_WM
>> +	bool
>> +	select BR2_PACKAGE_MATCHBOX_LIB
>> diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
>> index e367df2..17d89d8 100644
>> --- a/package/matchbox/matchbox.mk
>> +++ b/package/matchbox/matchbox.mk
>> @@ -1,4 +1,3 @@
>>  ifeq ($(BR2_PACKAGE_MATCHBOX),y)
>>  include $(sort $(wildcard package/matchbox/*/*.mk))
>> -PACKAGES += matchbox-wm
>>  endif
>>
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
