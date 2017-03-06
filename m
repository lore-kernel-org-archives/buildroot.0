From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 6 Mar 2017 13:27:33 +0100
Subject: [Buildroot] [PATCH 2/2] package/cwiid: add optional dependency
 to bluez5_utils
In-Reply-To: <20170306090313.6dfadac1@free-electrons.com>
References: <20170219131834.27844-1-bernd.kuhls@t-online.de>
 <20170219131834.27844-2-bernd.kuhls@t-online.de>
 <20170301222352.1f97ef44@free-electrons.com>
 <c592221b-1de8-f298-2628-c346f443c9a2@mind.be>
 <20170306090313.6dfadac1@free-electrons.com>
Message-ID: <a07e6eb2-9b2f-d0c0-83f0-29fc99c146b5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-03-17 09:03, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 6 Mar 2017 00:37:38 +0100, Arnout Vandecappelle wrote:
> 
>>> This causes a circular dependency:
>>>
>>> package/bluez_utils/Config.in:1:error: recursive dependency detected!
>>> package/bluez_utils/Config.in:1:	symbol BR2_PACKAGE_BLUEZ_UTILS is selected by BR2_PACKAGE_BLUEZ5_UTILS
>>> package/bluez5_utils/Config.in:1:	symbol BR2_PACKAGE_BLUEZ5_UTILS depends on BR2_PACKAGE_BLUEZ_UTILS  
>>
>>  I think it's just a matter of swapping them:
>>
>> select BR2_PACKAGE_BLUEZ5_UTILS if !BR2_PACKAGE_BLUEZ_UTILS
> 
> Yeah but that one changes the current behavior: if you have a defconfig
> with BR2_PACKAGE_CWIID=y, then you have been using bluez_utils, and
> your change would move to use bluez5_utils instead.
> 
> That being said, I don't know if it matters that much.

 I don't think we give any guarantees to people using a defconfig when updating
Buildroot. When you do that, things *will* change under the carpet without you
noticing. Certainly something like switching from bluez4 to bluez5 - which is
basically a version bump - is something you can expect in that case.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
