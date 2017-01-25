From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 25 Jan 2017 11:56:19 +0100
Subject: [Buildroot] [PATCH] legacy/xserver: add a legacy entry for
 xserver >= 1.19.0
In-Reply-To: <20170124233306.40f3d345@free-electrons.com>
References: <20170108222011.3839-1-romain.naour@gmail.com>
 <20170108222011.3839-2-romain.naour@gmail.com>
 <20170124233306.40f3d345@free-electrons.com>
Message-ID: <f51b9d8d-6853-b7fc-b16d-5205dda0da21@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-01-17 11:33, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun,  8 Jan 2017 23:20:11 +0100, Romain Naour wrote:
>> The legacy entry was missing in commit [1].
>>
>> [1] ec502ea8e4fec1e113b5f7c532809a05644a9fd4
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
>> ---
>>  Config.in.legacy | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/Config.in.legacy b/Config.in.legacy
>> index 20445b8..8dfbbc8 100644
>> --- a/Config.in.legacy
>> +++ b/Config.in.legacy
>> @@ -145,6 +145,13 @@ endif
>>  ###############################################################################
>>  comment "Legacy options removed in 2017.02"
>>  
>> +config BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX
>> +	bool "xserver AIGLX Extension removed"
>> +	depends on !BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14 && !BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
>> +	select BR2_LEGACY
>> +	help
>> +	  The xserver AIGLX Extension has been removed in 1.19.0 release.
> 
> Hum, but then we have the BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX option
> defined in two different places, with two different prompts. Do we
> really want to do this?

 No we don't. We certainly don't want that changing some option (the server
version) suddenly creates a legacy option.

 Also, legacy is not needed here: it never was possible (in a released
buildroot) to select this option for v1.19.0+.

 Regards,
 Arnout

> 
> Cc'ing Arnout and Yann, to get their insights.
> 
> Thanks,
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
