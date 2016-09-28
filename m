From: Julien Boibessot <julien.boibessot@free.fr>
Date: Wed, 28 Sep 2016 10:24:09 +0200
Subject: [Buildroot] [PATCH] i2c-tools: install devt headers to staging
 dir
In-Reply-To: <20160927035747.b2t7jkxpdptn65fs@tarshish>
References: <1474639604-23866-1-git-send-email-julien.boibessot@free.fr>
 <20160924161810.09ee4fa5@free-electrons.com>
 <3aa07d73-d34f-0070-3020-a3786e5a82ae@free.fr>
 <6fa984a3-83e4-3ea5-8841-88b2db197ebc@mind.be>
 <87r3862z69.fsf@dell.be.48ers.dk> <20160927035747.b2t7jkxpdptn65fs@tarshish>
Message-ID: <fea13e44-54db-9e53-3bef-3c28caea623b@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 27/09/2016 05:57, Baruch Siach wrote:
> Hi Peter,
>
> On Mon, Sep 26, 2016 at 10:17:50PM +0200, Peter Korsgaard wrote:
>>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>>  >> Sorry for having missed that one ! Sadly, the same problem will occur
>>  >> with my patch.
>>  >> I have currently no idea how to solve that and still trying to figure
>>  >> out how it can works on debian systems with libi2c-dev package installed.
>>  >> So meanwhile you can forget about my patch.
>>
>>  >  I guess Debian doesn't have packages that include both i2c.h and i2c-dev.h.
>>  > libsoc, for example, doesn't exist in Debian.
>>
>>  >  I guess the solution would be for i2c-tools to #include or #include_next the
>>  > relevant kernel headers, instead of redefining. Or to have both i2c.h and
>>  > i2c-dev.h so that both kernel headers end up being overwritten.
>>
>> Does the i2c-tools version of this file add anything important on top of
>> the Linux headers? The i2c /dev interface afaik hasn't changed in MANY
>> years.
> The i2c-tools version of i2c-dev.h adds a number of convenient i2c_smbus_*() 
> routines, that wrap around the I2C_SMBUS ioctl.

These i2c_smbus_*() routines are used by some userspace I2C drivers (not
yet in BR), that's why I sent the patch to re-install i2c-dev.h

Regards,
Julien
