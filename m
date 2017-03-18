From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 18 Mar 2017 16:31:51 +0100
Subject: [Buildroot] [PATCH] systemd: bump version to 233
In-Reply-To: <856c991d-d060-9f75-ed33-dfcecfb4ca9c@cartelsol.com>
References: <20170313132753.7178-1-Vincent.Riera@imgtec.com>
 <20170318155650.608756a0@free-electrons.com>
 <856c991d-d060-9f75-ed33-dfcecfb4ca9c@cartelsol.com>
Message-ID: <e34ac379-8f9c-9488-682e-257e14adf679@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-03-17 16:02, Marcus Hoffmann wrote:
> Hello,
> 
> On 03/18/2017 03:56 PM, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Mon, 13 Mar 2017 13:27:53 +0000, Vicente Olivert Riera wrote:
>>
>>> -config BR2_PACKAGE_SYSTEMD_KDBUS
>>> -	bool "enable kdbus support"
>>> -	help
>>> -	  Enable kdbus support for Systemd.
>>
>> This removes a Config.in option, so there is a question:
>>
>>  * If kdbus support is now unconditionally compiled into systemd, then
>>    I believe we don't need a Config.in.legacy option, because people
>>    who had it enabled would still have kdbus support.
>>
>>  * If kdbus support has been dropped entirely from systemd, then
>>    perhaps a Config.in.legacy entry should be added to warn users.
> 
> 
> I'm pretty sure kdbus has been dropped. It didn't get into the kernel.
> The successor project seems to be https://github.com/bus1.

 Yes, it should get a Config.in.legacy entry.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
