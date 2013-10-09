From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 09 Oct 2013 18:15:45 +0200
Subject: [Buildroot] [PATCH v2] i2c-tools: add license information
In-Reply-To: <52550BEE.3000600@mind.be>
References: <fc3b3afc1459d7a16e5b.1381302651@argentina>
 <52550BEE.3000600@mind.be>
Message-ID: <52558131.7080300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/09/13 09:55, Arnout Vandecappelle wrote:
> On 10/09/13 09:10, Thomas De Schampheleire wrote:
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Although on second thought: py-smbus is only built if you pass
EXTRA="py-smbus" in the make opts. Since we don't do that, we could just 
as well remove the license of py-smbus.

  That said, in case someone adds py-smbus support later it's good to 
have the license in place already.

  Bottom line: I'm OK with this patch as it is

  Regards,
  Arnout

>
>>
>> ---
>> v2: clarify separate py-smbus license (Arnout)
>>
>>   package/i2c-tools/i2c-tools.mk |  2 ++
>>   1 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/package/i2c-tools/i2c-tools.mk
>> b/package/i2c-tools/i2c-tools.mk
>> --- a/package/i2c-tools/i2c-tools.mk
>> +++ b/package/i2c-tools/i2c-tools.mk
>> @@ -7,6 +7,8 @@
>>   I2C_TOOLS_VERSION = 3.1.0
>>   I2C_TOOLS_SOURCE = i2c-tools-$(I2C_TOOLS_VERSION).tar.bz2
>>   I2C_TOOLS_SITE = http://dl.lm-sensors.org/i2c-tools/releases
>> +I2C_TOOLS_LICENSE = GPLv2+, GPLv2 (py-smbus)
>> +I2C_TOOLS_LICENSE_FILES = COPYING
>>
>>   define I2C_TOOLS_BUILD_CMDS
>>    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
>>
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
