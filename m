From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Thu, 09 Jul 2020 11:03:32 +0200
Subject: [Buildroot] [PATCH 5/9] support/scripts: Add a per
 configuration CVE checker
In-Reply-To: <87eepl5bdl.fsf@FE-laptop>
References: <20200708164006.859021-1-gregory.clement@bootlin.com>
 <20200708164006.859021-6-gregory.clement@bootlin.com>
 <CANQCQpbA7pSBTPgf0__OX5KAeVYU75KZ=3ZE4LoT49FFa-zWdg@mail.gmail.com>
 <87eepl5bdl.fsf@FE-laptop>
Message-ID: <87blkp5acb.fsf@FE-laptop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
>>> +
>>> +    args = parse_args()
>>> +    date = datetime.datetime.utcnow()
>>> +    commit = subprocess.check_output(['git', 'rev-parse',
>>> +                                      'HEAD']).splitlines()[0].decode()
>>
>> This git commit check doesn't work when the tools are used with out of
>> tree buildroot builds.
>>
>> To reproduce from within Buildroot clone:
>> make O=../foobar  qemu_x86_64_defconfig
>> cd ../foobar
>> make show-info | support/scripts/cve-checker --html report.html
>> --nvd-path nvd
>
>
> Thanks for the report I will check it.

I had a closer look on it, the way I tested was the following:
make O=../foobar  qemu_x86_64_defconfig
make O=../foobar show-info | support/scripts/cve-checker --html report.html --nvd-path nvd

That's why I didn't see this issue. However, I kept this information from
pkg-stat, but actually I don't think it has big value for a given
configuration.

I will just remove it.

Gregory

>
> -- 
> Gregory Clement, Bootlin
> Embedded Linux and Kernel engineering
> http://bootlin.com

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
