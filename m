From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 26 Jan 2017 11:38:37 +0100
Subject: [Buildroot] [PATCH] legacy/xserver: add a legacy entry for
 xserver >= 1.19.0
In-Reply-To: <4cee9174-8112-79b0-5078-bff7266030ca@gmail.com>
References: <20170108222011.3839-1-romain.naour@gmail.com>
 <20170108222011.3839-2-romain.naour@gmail.com>
 <20170124233306.40f3d345@free-electrons.com>
 <f51b9d8d-6853-b7fc-b16d-5205dda0da21@mind.be>
 <4cee9174-8112-79b0-5078-bff7266030ca@gmail.com>
Message-ID: <25577c96-c293-dea7-8163-685d744e50d5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-01-17 20:29, Romain Naour wrote:
> Hi Arnout, Thomas, All,
> 
> Le 25/01/2017 ? 11:56, Arnout Vandecappelle a ?crit :
>>
>> On 24-01-17 11:33, Thomas Petazzoni wrote:
>>> Hello,
>>>
>>> On Sun,  8 Jan 2017 23:20:11 +0100, Romain Naour wrote:
>>>> The legacy entry was missing in commit [1].
>>>>
>>>> [1] ec502ea8e4fec1e113b5f7c532809a05644a9fd4
>>>>
>>>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>>>> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
>>>> ---
>>>>  Config.in.legacy | 7 +++++++
>>>>  1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/Config.in.legacy b/Config.in.legacy
>>>> index 20445b8..8dfbbc8 100644
>>>> --- a/Config.in.legacy
>>>> +++ b/Config.in.legacy
>>>> @@ -145,6 +145,13 @@ endif
>>>>  ###############################################################################
>>>>  comment "Legacy options removed in 2017.02"
>>>>  
>>>> +config BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX
>>>> +	bool "xserver AIGLX Extension removed"
>>>> +	depends on !BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14 && !BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
>>>> +	select BR2_LEGACY
>>>> +	help
>>>> +	  The xserver AIGLX Extension has been removed in 1.19.0 release.
>>>
>>> Hum, but then we have the BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX option
>>> defined in two different places, with two different prompts. Do we
>>> really want to do this?
>>
>>  No we don't. We certainly don't want that changing some option (the server
>> version) suddenly creates a legacy option.
> 
> Indeed it's annoying...
> 
>>
>>  Also, legacy is not needed here: it never was possible (in a released
>> buildroot) to select this option for v1.19.0+.
> 
> ...but the xserver package is special since we support several versions.
> If only one version was used, this option would be removed with the bump to
> 1.19.0 and a legacy entry added.
> 
> If we previously used the latest xserver version (1.18.4) in 2016.11 with
> BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX selected, this option will be silently
> removed from the defconfig with 2017.02.
> 
> How we should handle new/old options when a package has several version available ?

 Well, normally the BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_18 legacy entry would
force the user to select a different version, and it would be obvious that aiglx
disappears in v1.19. However, we didn't add a legacy entry for v1.18...

 Regards,
 Arnout

> 
> Best regards,
> Romain
> 
>>
>>  Regards,
>>  Arnout
>>
>>>
>>> Cc'ing Arnout and Yann, to get their insights.
>>>
>>> Thanks,
>>>
>>> Thomas
>>>
>>
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
